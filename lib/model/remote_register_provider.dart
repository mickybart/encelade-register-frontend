import 'package:encelade/model/proto/google/protobuf/timestamp.pb.dart'
    as protog;
import 'package:encelade/model/proto/register.pbgrpc.dart' as proto;
import 'package:encelade/model/types/record.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class RemoteRegisterProvider {
  proto.RegisterClient? _registerClient;
  late final ClientChannel _channel;

  RemoteRegisterProvider() {
    _createChannel();
  }

  proto.RegisterClient get registerClient {
    if (_registerClient != null) return _registerClient!;

    _registerClient = proto.RegisterClient(_channel);

    debugPrint('return _registerClient');
    return _registerClient!;
  }

  void _createChannel() {
    debugPrint('_createChannel');
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
      time: _timestampFromDateTime(time),
    );

    await registerClient.collectClientInside(request);
  }

  Future<void> collectClientOutside(String id, DateTime time) async {
    final request = proto.TimestampTrace(
      id: id,
      time: _timestampFromDateTime(time),
    );

    await registerClient.collectClientOutside(request);
  }

  Future<void> returnClientInside(String id, DateTime time) async {
    final request = proto.TimestampTrace(
      id: id,
      time: _timestampFromDateTime(time),
    );

    await registerClient.returnClientInside(request);
  }

  Future<void> returnClientOutside(String id, DateTime time) async {
    final request = proto.TimestampTrace(
      id: id,
      time: _timestampFromDateTime(time),
    );

    await registerClient.returnClientOutside(request);
  }

  protog.Timestamp _timestampFromDateTime(DateTime time) {
    final timeSecondsSinceEpoch =
        (time.millisecondsSinceEpoch / Duration.millisecondsPerSecond).round();

    return protog.Timestamp(seconds: Int64(timeSecondsSinceEpoch));
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
}
