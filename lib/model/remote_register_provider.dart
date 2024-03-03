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

    try {
      final response = await registerClient.newDraft(request);

      return response.id;
    } on Exception catch (e) {
      debugPrint('error during draft creation: $e');
      rethrow;
    }
  }

  Future<void> updateDraft(String id, String summary) async {
    final request = proto.Draft(id: id, summary: summary);

    try {
      await registerClient.updateDraft(request);
    } on Exception catch (e) {
      debugPrint('error during draft update: $e');
      rethrow;
    }
  }

  Future<void> deleteDraft(String id) async {
    final request = proto.RecordID(id: id);

    try {
      await registerClient.deleteDraft(request);
    } on Exception catch (e) {
      debugPrint('error during draft deletion: $e');
      rethrow;
    }
  }

  Future<void> submitDraft(String id) async {
    final request = proto.RecordID(id: id);

    try {
      await registerClient.submitDraft(request);
    } on Exception catch (e) {
      debugPrint('error during draft submit: $e');
      rethrow;
    }
  }

  Future<void> collectClientInside(String id, DateTime time) async {
    try {
      final request = proto.TimestampTrace(
        id: id,
        time: _timestampFromDateTime(time),
      );

      await registerClient.collectClientInside(request);
    } on Exception catch (e) {
      debugPrint('error during client inside for collect: $e');
      rethrow;
    }
  }

  Future<void> collectClientOutside(String id, DateTime time) async {
    try {
      final request = proto.TimestampTrace(
        id: id,
        time: _timestampFromDateTime(time),
      );

      await registerClient.collectClientOutside(request);
    } on Exception catch (e) {
      debugPrint('error during client outside for collect: $e');
      rethrow;
    }
  }

  Future<void> returnClientInside(String id, DateTime time) async {
    try {
      final request = proto.TimestampTrace(
        id: id,
        time: _timestampFromDateTime(time),
      );

      await registerClient.returnClientInside(request);
    } on Exception catch (e) {
      debugPrint('error during client inside for return: $e');
      rethrow;
    }
  }

  Future<void> returnClientOutside(String id, DateTime time) async {
    try {
      final request = proto.TimestampTrace(
        id: id,
        time: _timestampFromDateTime(time),
      );

      await registerClient.returnClientOutside(request);
    } on Exception catch (e) {
      debugPrint('error during client outside for return: $e');
      rethrow;
    }
  }

  protog.Timestamp _timestampFromDateTime(DateTime time) {
    final timeSecondsSinceEpoch =
        (time.millisecondsSinceEpoch / Duration.millisecondsPerSecond).round();

    return protog.Timestamp(seconds: Int64(timeSecondsSinceEpoch));
  }

  Future<void> collectClientSignature(
      String id, String name, String signature) async {
    try {
      final request = proto.SignerTrace(
        id: id,
        signer: proto.Signer(
          name: name,
          signature: signature,
        ),
      );

      await registerClient.collectClientSignature(request);
    } on Exception catch (e) {
      debugPrint('error during client signature for collect: $e');
      rethrow;
    }
  }

  Future<void> returnClientSignature(
      String id, String name, String signature) async {
    try {
      final request = proto.SignerTrace(
        id: id,
        signer: proto.Signer(
          name: name,
          signature: signature,
        ),
      );

      await registerClient.returnClientSignature(request);
    } on Exception catch (e) {
      debugPrint('error during client signature for return: $e');
      rethrow;
    }
  }

  Future<void> collectPqrsSignature(
      String id, String name, String signature) async {
    try {
      final request = proto.SignerTrace(
        id: id,
        signer: proto.Signer(
          name: name,
          signature: signature,
        ),
      );

      await registerClient.collectPqrsSignature(request);
    } on Exception catch (e) {
      debugPrint('error during pqrs signature for collect: $e');
      rethrow;
    }
  }

  Future<void> returnPqrsSignature(
      String id, String name, String signature) async {
    try {
      final request = proto.SignerTrace(
        id: id,
        signer: proto.Signer(
          name: name,
          signature: signature,
        ),
      );

      await registerClient.returnPqrsSignature(request);
    } on Exception catch (e) {
      debugPrint('error during pqrs signature for return: $e');
      rethrow;
    }
  }

  Future<void> complete(String id) async {
    try {
      final request = proto.RecordID(id: id);

      await registerClient.complete(request);
    } on Exception catch (e) {
      debugPrint('error during completion: $e');
      rethrow;
    }
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

    try {
      final response = registerClient.search(request);

      await for (var record in response) {
        yield Record.fromProto(record);
      }
    } on Exception catch (e) {
      debugPrint('error during list records: $e');
      rethrow;
    }

    debugPrint('getRecords consumed !');
  }
}
