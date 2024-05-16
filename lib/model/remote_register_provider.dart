import 'package:encelade/model/proto/google/protobuf/empty.pb.dart' as protog_e;
import 'package:encelade/model/proto/register.pbgrpc.dart' as proto;
import 'package:encelade/model/types/event_type.dart';
import 'package:encelade/model/types/record.dart';
import 'package:encelade/model/types/record_state.dart';
import 'package:encelade/model/types/record_event.dart';
import 'package:grpc/grpc.dart';

import 'utils.dart';

class RemoteRegisterProvider {
  proto.RegisterClient? _registerClient;
  late final ClientChannel _channel;

  RemoteRegisterProvider() {
    _createChannel();
  }

  proto.RegisterClient get registerClient {
    if (_registerClient != null) return _registerClient!;

    _registerClient = proto.RegisterClient(_channel);

    return _registerClient!;
  }

  void _createChannel() {
    const host = "127.0.0.1";
    const port = 50051;

    _channel = ClientChannel(
      host,
      port: port,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
  }

  void dispose() async {
    await _channel.shutdown();
  }

  Future<String> newDraft(String summary) async {
    final request = proto.Draft(summary: summary);
    final response = await registerClient.newDraft(request);

    return response.id;
  }

  Future<void> updateDraft(String id, String summary) async {
    final request = proto.Draft(id: id, summary: summary);
    await registerClient.updateDraft(request);
  }

  Future<void> deleteDraft(String id) async {
    final request = proto.RecordID(id: id);
    await registerClient.deleteDraft(request);
  }

  Future<void> submitDraft(String id) async {
    final request = proto.RecordID(id: id);
    await registerClient.submitDraft(request);
  }

  Future<void> collectClientInside(String id, DateTime time) async {
    final request = proto.TimestampTrace(
      id: id,
      time: timestampFromDateTime(time),
    );

    await registerClient.collectClientInside(request);
  }

  Future<void> collectClientOutside(String id, DateTime time) async {
    final request = proto.TimestampTrace(
      id: id,
      time: timestampFromDateTime(time),
    );

    await registerClient.collectClientOutside(request);
  }

  Future<void> returnClientInside(String id, DateTime time) async {
    final request = proto.TimestampTrace(
      id: id,
      time: timestampFromDateTime(time),
    );

    await registerClient.returnClientInside(request);
  }

  Future<void> returnClientOutside(String id, DateTime time) async {
    final request = proto.TimestampTrace(
      id: id,
      time: timestampFromDateTime(time),
    );

    await registerClient.returnClientOutside(request);
  }

  Future<void> collectClientSignature(
      String id, String name, String signature) async {
    final request = proto.SignerTrace(
      id: id,
      signer: proto.Signer(
        name: name,
        signature: signature,
      ),
    );

    await registerClient.collectClientSignature(request);
  }

  Future<void> returnClientSignature(
      String id, String name, String signature) async {
    final request = proto.SignerTrace(
      id: id,
      signer: proto.Signer(
        name: name,
        signature: signature,
      ),
    );

    await registerClient.returnClientSignature(request);
  }

  Future<void> collectPqrsSignature(
      String id, String name, String signature) async {
    final request = proto.SignerTrace(
      id: id,
      signer: proto.Signer(
        name: name,
        signature: signature,
      ),
    );

    await registerClient.collectPqrsSignature(request);
  }

  Future<void> returnPqrsSignature(
      String id, String name, String signature) async {
    final request = proto.SignerTrace(
      id: id,
      signer: proto.Signer(
        name: name,
        signature: signature,
      ),
    );

    await registerClient.returnPqrsSignature(request);
  }

  Future<void> complete(String id) async {
    final request = proto.RecordID(id: id);

    await registerClient.complete(request);
  }

  Stream<Record> getRecordsNotCompleted() async* {
    final request = proto.SearchRequest(
      states: [
        proto.RecordState.DRAFT,
        proto.RecordState.CREATED,
        proto.RecordState.COLLECT_CLIENT_INSIDE,
        proto.RecordState.COLLECT_CLIENT_SIGNATURE,
        proto.RecordState.COLLECT_CLIENT_OUTSIDE,
        proto.RecordState.COLLECT_PQRS_SIGNATURE,
        proto.RecordState.RETURN_CLIENT_INSIDE,
        proto.RecordState.RETURN_CLIENT_SIGNATURE,
        proto.RecordState.RETURN_CLIENT_OUTSIDE,
        proto.RecordState.RETURN_PQRS_SIGNATURE,
      ],
    );

    final response = registerClient.search(request);

    await for (var record in response) {
      yield Record.fromProto(record);
    }
  }

  Stream<Record> getRecords(List<RecordState> states, List<DateTime> range) async* {
    final request = proto.SearchRequest(
      states: states.map((e) => proto.RecordState.values[e.index]).toList(),
      range: proto.TimestampRange(
        begin: timestampFromDateTime(range[0]),
        end: timestampFromDateTime(range[1]),
      ),
    );

    final response = registerClient.search(request);

    await for (var record in response) {
      yield Record.fromProto(record);
    }
  }

  Stream<RecordEvent> watch(Stream<Record> Function() initial) async* {
    final request = protog_e.Empty();

    // Empty event
    final emptyEvent = proto.RecordEvent.create()
      ..eventType = proto.EventType.EMPTY_EVENT;

    // create the stream but does not read it
    // generate empty event when there is no event since a long time (2 sec)
    // this is a workaround to permit frontend to disable the stream when
    // user will toggle sync on/off
    final response = registerClient.watch(request).timeout(
          const Duration(seconds: 2),
          onTimeout: (sink) => sink.add(emptyEvent),
        );

    // preload initial data that will be updated by incoming events later
    await for (var record in initial()) {
      yield RecordEvent(EventType.added, record);
    }

    // listen changes
    await for (var event in response) {
      yield RecordEvent.fromProto(event);
    }
  }
}
