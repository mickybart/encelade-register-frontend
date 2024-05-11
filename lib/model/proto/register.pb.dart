//
//  Generated code. Do not modify.
//  source: register.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $2;
import 'register.pbenum.dart';

export 'register.pbenum.dart';

class Draft extends $pb.GeneratedMessage {
  factory Draft({
    $core.String? id,
    $core.String? summary,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (summary != null) {
      $result.summary = summary;
    }
    return $result;
  }
  Draft._() : super();
  factory Draft.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Draft.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Draft', package: const $pb.PackageName(_omitMessageNames ? '' : 'register'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'summary')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Draft clone() => Draft()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Draft copyWith(void Function(Draft) updates) => super.copyWith((message) => updates(message as Draft)) as Draft;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Draft create() => Draft._();
  Draft createEmptyInstance() => create();
  static $pb.PbList<Draft> createRepeated() => $pb.PbList<Draft>();
  @$core.pragma('dart2js:noInline')
  static Draft getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Draft>(create);
  static Draft? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get summary => $_getSZ(1);
  @$pb.TagNumber(2)
  set summary($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSummary() => $_has(1);
  @$pb.TagNumber(2)
  void clearSummary() => clearField(2);
}

class RecordID extends $pb.GeneratedMessage {
  factory RecordID({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  RecordID._() : super();
  factory RecordID.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecordID.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecordID', package: const $pb.PackageName(_omitMessageNames ? '' : 'register'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecordID clone() => RecordID()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecordID copyWith(void Function(RecordID) updates) => super.copyWith((message) => updates(message as RecordID)) as RecordID;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordID create() => RecordID._();
  RecordID createEmptyInstance() => create();
  static $pb.PbList<RecordID> createRepeated() => $pb.PbList<RecordID>();
  @$core.pragma('dart2js:noInline')
  static RecordID getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecordID>(create);
  static RecordID? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class TimestampTrace extends $pb.GeneratedMessage {
  factory TimestampTrace({
    $core.String? id,
    $2.Timestamp? time,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (time != null) {
      $result.time = time;
    }
    return $result;
  }
  TimestampTrace._() : super();
  factory TimestampTrace.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimestampTrace.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TimestampTrace', package: const $pb.PackageName(_omitMessageNames ? '' : 'register'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'time', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimestampTrace clone() => TimestampTrace()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimestampTrace copyWith(void Function(TimestampTrace) updates) => super.copyWith((message) => updates(message as TimestampTrace)) as TimestampTrace;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimestampTrace create() => TimestampTrace._();
  TimestampTrace createEmptyInstance() => create();
  static $pb.PbList<TimestampTrace> createRepeated() => $pb.PbList<TimestampTrace>();
  @$core.pragma('dart2js:noInline')
  static TimestampTrace getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimestampTrace>(create);
  static TimestampTrace? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $2.Timestamp get time => $_getN(1);
  @$pb.TagNumber(2)
  set time($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureTime() => $_ensure(1);
}

class Signer extends $pb.GeneratedMessage {
  factory Signer({
    $core.String? name,
    $core.String? signature,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  Signer._() : super();
  factory Signer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Signer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Signer', package: const $pb.PackageName(_omitMessageNames ? '' : 'register'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'signature')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Signer clone() => Signer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Signer copyWith(void Function(Signer) updates) => super.copyWith((message) => updates(message as Signer)) as Signer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Signer create() => Signer._();
  Signer createEmptyInstance() => create();
  static $pb.PbList<Signer> createRepeated() => $pb.PbList<Signer>();
  @$core.pragma('dart2js:noInline')
  static Signer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Signer>(create);
  static Signer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get signature => $_getSZ(1);
  @$pb.TagNumber(2)
  set signature($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => clearField(2);
}

class SignerTrace extends $pb.GeneratedMessage {
  factory SignerTrace({
    $core.String? id,
    Signer? signer,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (signer != null) {
      $result.signer = signer;
    }
    return $result;
  }
  SignerTrace._() : super();
  factory SignerTrace.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignerTrace.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignerTrace', package: const $pb.PackageName(_omitMessageNames ? '' : 'register'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOM<Signer>(2, _omitFieldNames ? '' : 'signer', subBuilder: Signer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignerTrace clone() => SignerTrace()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignerTrace copyWith(void Function(SignerTrace) updates) => super.copyWith((message) => updates(message as SignerTrace)) as SignerTrace;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignerTrace create() => SignerTrace._();
  SignerTrace createEmptyInstance() => create();
  static $pb.PbList<SignerTrace> createRepeated() => $pb.PbList<SignerTrace>();
  @$core.pragma('dart2js:noInline')
  static SignerTrace getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignerTrace>(create);
  static SignerTrace? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Signer get signer => $_getN(1);
  @$pb.TagNumber(2)
  set signer(Signer v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSigner() => $_has(1);
  @$pb.TagNumber(2)
  void clearSigner() => clearField(2);
  @$pb.TagNumber(2)
  Signer ensureSigner() => $_ensure(1);
}

class Trace extends $pb.GeneratedMessage {
  factory Trace({
    $2.Timestamp? inside,
    $2.Timestamp? outside,
    Signer? client,
    Signer? pqrs,
  }) {
    final $result = create();
    if (inside != null) {
      $result.inside = inside;
    }
    if (outside != null) {
      $result.outside = outside;
    }
    if (client != null) {
      $result.client = client;
    }
    if (pqrs != null) {
      $result.pqrs = pqrs;
    }
    return $result;
  }
  Trace._() : super();
  factory Trace.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Trace.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Trace', package: const $pb.PackageName(_omitMessageNames ? '' : 'register'), createEmptyInstance: create)
    ..aOM<$2.Timestamp>(1, _omitFieldNames ? '' : 'inside', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'outside', subBuilder: $2.Timestamp.create)
    ..aOM<Signer>(3, _omitFieldNames ? '' : 'client', subBuilder: Signer.create)
    ..aOM<Signer>(4, _omitFieldNames ? '' : 'pqrs', subBuilder: Signer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Trace clone() => Trace()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Trace copyWith(void Function(Trace) updates) => super.copyWith((message) => updates(message as Trace)) as Trace;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Trace create() => Trace._();
  Trace createEmptyInstance() => create();
  static $pb.PbList<Trace> createRepeated() => $pb.PbList<Trace>();
  @$core.pragma('dart2js:noInline')
  static Trace getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Trace>(create);
  static Trace? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Timestamp get inside => $_getN(0);
  @$pb.TagNumber(1)
  set inside($2.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInside() => $_has(0);
  @$pb.TagNumber(1)
  void clearInside() => clearField(1);
  @$pb.TagNumber(1)
  $2.Timestamp ensureInside() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.Timestamp get outside => $_getN(1);
  @$pb.TagNumber(2)
  set outside($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOutside() => $_has(1);
  @$pb.TagNumber(2)
  void clearOutside() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureOutside() => $_ensure(1);

  @$pb.TagNumber(3)
  Signer get client => $_getN(2);
  @$pb.TagNumber(3)
  set client(Signer v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasClient() => $_has(2);
  @$pb.TagNumber(3)
  void clearClient() => clearField(3);
  @$pb.TagNumber(3)
  Signer ensureClient() => $_ensure(2);

  @$pb.TagNumber(4)
  Signer get pqrs => $_getN(3);
  @$pb.TagNumber(4)
  set pqrs(Signer v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPqrs() => $_has(3);
  @$pb.TagNumber(4)
  void clearPqrs() => clearField(4);
  @$pb.TagNumber(4)
  Signer ensurePqrs() => $_ensure(3);
}

class Traces extends $pb.GeneratedMessage {
  factory Traces({
    Trace? collected,
    Trace? returned,
  }) {
    final $result = create();
    if (collected != null) {
      $result.collected = collected;
    }
    if (returned != null) {
      $result.returned = returned;
    }
    return $result;
  }
  Traces._() : super();
  factory Traces.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Traces.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Traces', package: const $pb.PackageName(_omitMessageNames ? '' : 'register'), createEmptyInstance: create)
    ..aOM<Trace>(1, _omitFieldNames ? '' : 'collected', subBuilder: Trace.create)
    ..aOM<Trace>(2, _omitFieldNames ? '' : 'returned', subBuilder: Trace.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Traces clone() => Traces()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Traces copyWith(void Function(Traces) updates) => super.copyWith((message) => updates(message as Traces)) as Traces;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Traces create() => Traces._();
  Traces createEmptyInstance() => create();
  static $pb.PbList<Traces> createRepeated() => $pb.PbList<Traces>();
  @$core.pragma('dart2js:noInline')
  static Traces getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Traces>(create);
  static Traces? _defaultInstance;

  @$pb.TagNumber(1)
  Trace get collected => $_getN(0);
  @$pb.TagNumber(1)
  set collected(Trace v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCollected() => $_has(0);
  @$pb.TagNumber(1)
  void clearCollected() => clearField(1);
  @$pb.TagNumber(1)
  Trace ensureCollected() => $_ensure(0);

  @$pb.TagNumber(2)
  Trace get returned => $_getN(1);
  @$pb.TagNumber(2)
  set returned(Trace v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasReturned() => $_has(1);
  @$pb.TagNumber(2)
  void clearReturned() => clearField(2);
  @$pb.TagNumber(2)
  Trace ensureReturned() => $_ensure(1);
}

class Record extends $pb.GeneratedMessage {
  factory Record({
    $core.String? id,
    $core.int? apiVersion,
    $core.String? summary,
    $2.Timestamp? created,
    Traces? traces,
    RecordState? state,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (apiVersion != null) {
      $result.apiVersion = apiVersion;
    }
    if (summary != null) {
      $result.summary = summary;
    }
    if (created != null) {
      $result.created = created;
    }
    if (traces != null) {
      $result.traces = traces;
    }
    if (state != null) {
      $result.state = state;
    }
    return $result;
  }
  Record._() : super();
  factory Record.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Record.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Record', package: const $pb.PackageName(_omitMessageNames ? '' : 'register'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'apiVersion', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'summary')
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'created', subBuilder: $2.Timestamp.create)
    ..aOM<Traces>(5, _omitFieldNames ? '' : 'traces', subBuilder: Traces.create)
    ..e<RecordState>(6, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: RecordState.UNSPECIFIED, valueOf: RecordState.valueOf, enumValues: RecordState.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Record clone() => Record()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Record copyWith(void Function(Record) updates) => super.copyWith((message) => updates(message as Record)) as Record;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Record create() => Record._();
  Record createEmptyInstance() => create();
  static $pb.PbList<Record> createRepeated() => $pb.PbList<Record>();
  @$core.pragma('dart2js:noInline')
  static Record getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Record>(create);
  static Record? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get apiVersion => $_getIZ(1);
  @$pb.TagNumber(2)
  set apiVersion($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasApiVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearApiVersion() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get summary => $_getSZ(2);
  @$pb.TagNumber(3)
  set summary($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSummary() => $_has(2);
  @$pb.TagNumber(3)
  void clearSummary() => clearField(3);

  @$pb.TagNumber(4)
  $2.Timestamp get created => $_getN(3);
  @$pb.TagNumber(4)
  set created($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreated() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreated() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureCreated() => $_ensure(3);

  @$pb.TagNumber(5)
  Traces get traces => $_getN(4);
  @$pb.TagNumber(5)
  set traces(Traces v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTraces() => $_has(4);
  @$pb.TagNumber(5)
  void clearTraces() => clearField(5);
  @$pb.TagNumber(5)
  Traces ensureTraces() => $_ensure(4);

  @$pb.TagNumber(6)
  RecordState get state => $_getN(5);
  @$pb.TagNumber(6)
  set state(RecordState v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => clearField(6);
}

class TimestampRange extends $pb.GeneratedMessage {
  factory TimestampRange({
    $2.Timestamp? begin,
    $2.Timestamp? end,
  }) {
    final $result = create();
    if (begin != null) {
      $result.begin = begin;
    }
    if (end != null) {
      $result.end = end;
    }
    return $result;
  }
  TimestampRange._() : super();
  factory TimestampRange.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimestampRange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TimestampRange', package: const $pb.PackageName(_omitMessageNames ? '' : 'register'), createEmptyInstance: create)
    ..aOM<$2.Timestamp>(1, _omitFieldNames ? '' : 'begin', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'end', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimestampRange clone() => TimestampRange()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimestampRange copyWith(void Function(TimestampRange) updates) => super.copyWith((message) => updates(message as TimestampRange)) as TimestampRange;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimestampRange create() => TimestampRange._();
  TimestampRange createEmptyInstance() => create();
  static $pb.PbList<TimestampRange> createRepeated() => $pb.PbList<TimestampRange>();
  @$core.pragma('dart2js:noInline')
  static TimestampRange getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimestampRange>(create);
  static TimestampRange? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Timestamp get begin => $_getN(0);
  @$pb.TagNumber(1)
  set begin($2.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBegin() => $_has(0);
  @$pb.TagNumber(1)
  void clearBegin() => clearField(1);
  @$pb.TagNumber(1)
  $2.Timestamp ensureBegin() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.Timestamp get end => $_getN(1);
  @$pb.TagNumber(2)
  set end($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnd() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureEnd() => $_ensure(1);
}

class SearchRequest extends $pb.GeneratedMessage {
  factory SearchRequest({
    $core.Iterable<RecordState>? states,
    TimestampRange? range,
  }) {
    final $result = create();
    if (states != null) {
      $result.states.addAll(states);
    }
    if (range != null) {
      $result.range = range;
    }
    return $result;
  }
  SearchRequest._() : super();
  factory SearchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'register'), createEmptyInstance: create)
    ..pc<RecordState>(1, _omitFieldNames ? '' : 'states', $pb.PbFieldType.KE, valueOf: RecordState.valueOf, enumValues: RecordState.values, defaultEnumValue: RecordState.UNSPECIFIED)
    ..aOM<TimestampRange>(2, _omitFieldNames ? '' : 'range', subBuilder: TimestampRange.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchRequest clone() => SearchRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchRequest copyWith(void Function(SearchRequest) updates) => super.copyWith((message) => updates(message as SearchRequest)) as SearchRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchRequest create() => SearchRequest._();
  SearchRequest createEmptyInstance() => create();
  static $pb.PbList<SearchRequest> createRepeated() => $pb.PbList<SearchRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchRequest>(create);
  static SearchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RecordState> get states => $_getList(0);

  @$pb.TagNumber(2)
  TimestampRange get range => $_getN(1);
  @$pb.TagNumber(2)
  set range(TimestampRange v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRange() => $_has(1);
  @$pb.TagNumber(2)
  void clearRange() => clearField(2);
  @$pb.TagNumber(2)
  TimestampRange ensureRange() => $_ensure(1);
}

class RecordEvent extends $pb.GeneratedMessage {
  factory RecordEvent({
    EventType? eventType,
    Record? record,
  }) {
    final $result = create();
    if (eventType != null) {
      $result.eventType = eventType;
    }
    if (record != null) {
      $result.record = record;
    }
    return $result;
  }
  RecordEvent._() : super();
  factory RecordEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecordEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecordEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'register'), createEmptyInstance: create)
    ..e<EventType>(1, _omitFieldNames ? '' : 'eventType', $pb.PbFieldType.OE, defaultOrMaker: EventType.EMPTY_EVENT, valueOf: EventType.valueOf, enumValues: EventType.values)
    ..aOM<Record>(2, _omitFieldNames ? '' : 'record', subBuilder: Record.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecordEvent clone() => RecordEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecordEvent copyWith(void Function(RecordEvent) updates) => super.copyWith((message) => updates(message as RecordEvent)) as RecordEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordEvent create() => RecordEvent._();
  RecordEvent createEmptyInstance() => create();
  static $pb.PbList<RecordEvent> createRepeated() => $pb.PbList<RecordEvent>();
  @$core.pragma('dart2js:noInline')
  static RecordEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecordEvent>(create);
  static RecordEvent? _defaultInstance;

  @$pb.TagNumber(1)
  EventType get eventType => $_getN(0);
  @$pb.TagNumber(1)
  set eventType(EventType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventType() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventType() => clearField(1);

  @$pb.TagNumber(2)
  Record get record => $_getN(1);
  @$pb.TagNumber(2)
  set record(Record v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRecord() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecord() => clearField(2);
  @$pb.TagNumber(2)
  Record ensureRecord() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
