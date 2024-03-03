//
//  Generated code. Do not modify.
//  source: register.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/empty.pb.dart' as $1;
import 'register.pb.dart' as $0;

export 'register.pb.dart';

@$pb.GrpcServiceName('register.Register')
class RegisterClient extends $grpc.Client {
  static final _$newDraft = $grpc.ClientMethod<$0.Draft, $0.RecordID>(
      '/register.Register/NewDraft',
      ($0.Draft value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RecordID.fromBuffer(value));
  static final _$updateDraft = $grpc.ClientMethod<$0.Draft, $1.Empty>(
      '/register.Register/UpdateDraft',
      ($0.Draft value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$deleteDraft = $grpc.ClientMethod<$0.RecordID, $1.Empty>(
      '/register.Register/DeleteDraft',
      ($0.RecordID value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$submitDraft = $grpc.ClientMethod<$0.RecordID, $1.Empty>(
      '/register.Register/SubmitDraft',
      ($0.RecordID value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$collectClientInside = $grpc.ClientMethod<$0.TimestampTrace, $1.Empty>(
      '/register.Register/CollectClientInside',
      ($0.TimestampTrace value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$collectClientSignature = $grpc.ClientMethod<$0.SignerTrace, $1.Empty>(
      '/register.Register/CollectClientSignature',
      ($0.SignerTrace value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$collectClientOutside = $grpc.ClientMethod<$0.TimestampTrace, $1.Empty>(
      '/register.Register/CollectClientOutside',
      ($0.TimestampTrace value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$collectPqrsSignature = $grpc.ClientMethod<$0.SignerTrace, $1.Empty>(
      '/register.Register/CollectPqrsSignature',
      ($0.SignerTrace value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$returnClientInside = $grpc.ClientMethod<$0.TimestampTrace, $1.Empty>(
      '/register.Register/ReturnClientInside',
      ($0.TimestampTrace value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$returnClientSignature = $grpc.ClientMethod<$0.SignerTrace, $1.Empty>(
      '/register.Register/ReturnClientSignature',
      ($0.SignerTrace value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$returnClientOutside = $grpc.ClientMethod<$0.TimestampTrace, $1.Empty>(
      '/register.Register/ReturnClientOutside',
      ($0.TimestampTrace value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$returnPqrsSignature = $grpc.ClientMethod<$0.SignerTrace, $1.Empty>(
      '/register.Register/ReturnPqrsSignature',
      ($0.SignerTrace value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$complete = $grpc.ClientMethod<$0.RecordID, $1.Empty>(
      '/register.Register/Complete',
      ($0.RecordID value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$search = $grpc.ClientMethod<$0.SearchRequest, $0.Record>(
      '/register.Register/Search',
      ($0.SearchRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Record.fromBuffer(value));
  static final _$searchById = $grpc.ClientMethod<$0.RecordID, $0.Record>(
      '/register.Register/SearchById',
      ($0.RecordID value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Record.fromBuffer(value));

  RegisterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.RecordID> newDraft($0.Draft request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$newDraft, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateDraft($0.Draft request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateDraft, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteDraft($0.RecordID request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteDraft, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> submitDraft($0.RecordID request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$submitDraft, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> collectClientInside($0.TimestampTrace request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$collectClientInside, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> collectClientSignature($0.SignerTrace request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$collectClientSignature, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> collectClientOutside($0.TimestampTrace request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$collectClientOutside, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> collectPqrsSignature($0.SignerTrace request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$collectPqrsSignature, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> returnClientInside($0.TimestampTrace request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$returnClientInside, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> returnClientSignature($0.SignerTrace request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$returnClientSignature, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> returnClientOutside($0.TimestampTrace request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$returnClientOutside, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> returnPqrsSignature($0.SignerTrace request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$returnPqrsSignature, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> complete($0.RecordID request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$complete, request, options: options);
  }

  $grpc.ResponseStream<$0.Record> search($0.SearchRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$search, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.Record> searchById($0.RecordID request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$searchById, request, options: options);
  }
}

@$pb.GrpcServiceName('register.Register')
abstract class RegisterServiceBase extends $grpc.Service {
  $core.String get $name => 'register.Register';

  RegisterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Draft, $0.RecordID>(
        'NewDraft',
        newDraft_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Draft.fromBuffer(value),
        ($0.RecordID value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Draft, $1.Empty>(
        'UpdateDraft',
        updateDraft_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Draft.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RecordID, $1.Empty>(
        'DeleteDraft',
        deleteDraft_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RecordID.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RecordID, $1.Empty>(
        'SubmitDraft',
        submitDraft_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RecordID.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TimestampTrace, $1.Empty>(
        'CollectClientInside',
        collectClientInside_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TimestampTrace.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignerTrace, $1.Empty>(
        'CollectClientSignature',
        collectClientSignature_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignerTrace.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TimestampTrace, $1.Empty>(
        'CollectClientOutside',
        collectClientOutside_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TimestampTrace.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignerTrace, $1.Empty>(
        'CollectPqrsSignature',
        collectPqrsSignature_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignerTrace.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TimestampTrace, $1.Empty>(
        'ReturnClientInside',
        returnClientInside_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TimestampTrace.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignerTrace, $1.Empty>(
        'ReturnClientSignature',
        returnClientSignature_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignerTrace.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TimestampTrace, $1.Empty>(
        'ReturnClientOutside',
        returnClientOutside_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TimestampTrace.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignerTrace, $1.Empty>(
        'ReturnPqrsSignature',
        returnPqrsSignature_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignerTrace.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RecordID, $1.Empty>(
        'Complete',
        complete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RecordID.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SearchRequest, $0.Record>(
        'Search',
        search_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SearchRequest.fromBuffer(value),
        ($0.Record value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RecordID, $0.Record>(
        'SearchById',
        searchById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RecordID.fromBuffer(value),
        ($0.Record value) => value.writeToBuffer()));
  }

  $async.Future<$0.RecordID> newDraft_Pre($grpc.ServiceCall call, $async.Future<$0.Draft> request) async {
    return newDraft(call, await request);
  }

  $async.Future<$1.Empty> updateDraft_Pre($grpc.ServiceCall call, $async.Future<$0.Draft> request) async {
    return updateDraft(call, await request);
  }

  $async.Future<$1.Empty> deleteDraft_Pre($grpc.ServiceCall call, $async.Future<$0.RecordID> request) async {
    return deleteDraft(call, await request);
  }

  $async.Future<$1.Empty> submitDraft_Pre($grpc.ServiceCall call, $async.Future<$0.RecordID> request) async {
    return submitDraft(call, await request);
  }

  $async.Future<$1.Empty> collectClientInside_Pre($grpc.ServiceCall call, $async.Future<$0.TimestampTrace> request) async {
    return collectClientInside(call, await request);
  }

  $async.Future<$1.Empty> collectClientSignature_Pre($grpc.ServiceCall call, $async.Future<$0.SignerTrace> request) async {
    return collectClientSignature(call, await request);
  }

  $async.Future<$1.Empty> collectClientOutside_Pre($grpc.ServiceCall call, $async.Future<$0.TimestampTrace> request) async {
    return collectClientOutside(call, await request);
  }

  $async.Future<$1.Empty> collectPqrsSignature_Pre($grpc.ServiceCall call, $async.Future<$0.SignerTrace> request) async {
    return collectPqrsSignature(call, await request);
  }

  $async.Future<$1.Empty> returnClientInside_Pre($grpc.ServiceCall call, $async.Future<$0.TimestampTrace> request) async {
    return returnClientInside(call, await request);
  }

  $async.Future<$1.Empty> returnClientSignature_Pre($grpc.ServiceCall call, $async.Future<$0.SignerTrace> request) async {
    return returnClientSignature(call, await request);
  }

  $async.Future<$1.Empty> returnClientOutside_Pre($grpc.ServiceCall call, $async.Future<$0.TimestampTrace> request) async {
    return returnClientOutside(call, await request);
  }

  $async.Future<$1.Empty> returnPqrsSignature_Pre($grpc.ServiceCall call, $async.Future<$0.SignerTrace> request) async {
    return returnPqrsSignature(call, await request);
  }

  $async.Future<$1.Empty> complete_Pre($grpc.ServiceCall call, $async.Future<$0.RecordID> request) async {
    return complete(call, await request);
  }

  $async.Stream<$0.Record> search_Pre($grpc.ServiceCall call, $async.Future<$0.SearchRequest> request) async* {
    yield* search(call, await request);
  }

  $async.Future<$0.Record> searchById_Pre($grpc.ServiceCall call, $async.Future<$0.RecordID> request) async {
    return searchById(call, await request);
  }

  $async.Future<$0.RecordID> newDraft($grpc.ServiceCall call, $0.Draft request);
  $async.Future<$1.Empty> updateDraft($grpc.ServiceCall call, $0.Draft request);
  $async.Future<$1.Empty> deleteDraft($grpc.ServiceCall call, $0.RecordID request);
  $async.Future<$1.Empty> submitDraft($grpc.ServiceCall call, $0.RecordID request);
  $async.Future<$1.Empty> collectClientInside($grpc.ServiceCall call, $0.TimestampTrace request);
  $async.Future<$1.Empty> collectClientSignature($grpc.ServiceCall call, $0.SignerTrace request);
  $async.Future<$1.Empty> collectClientOutside($grpc.ServiceCall call, $0.TimestampTrace request);
  $async.Future<$1.Empty> collectPqrsSignature($grpc.ServiceCall call, $0.SignerTrace request);
  $async.Future<$1.Empty> returnClientInside($grpc.ServiceCall call, $0.TimestampTrace request);
  $async.Future<$1.Empty> returnClientSignature($grpc.ServiceCall call, $0.SignerTrace request);
  $async.Future<$1.Empty> returnClientOutside($grpc.ServiceCall call, $0.TimestampTrace request);
  $async.Future<$1.Empty> returnPqrsSignature($grpc.ServiceCall call, $0.SignerTrace request);
  $async.Future<$1.Empty> complete($grpc.ServiceCall call, $0.RecordID request);
  $async.Stream<$0.Record> search($grpc.ServiceCall call, $0.SearchRequest request);
  $async.Future<$0.Record> searchById($grpc.ServiceCall call, $0.RecordID request);
}
