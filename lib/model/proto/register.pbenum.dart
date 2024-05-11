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

class RecordState extends $pb.ProtobufEnum {
  static const RecordState UNSPECIFIED = RecordState._(0, _omitEnumNames ? '' : 'UNSPECIFIED');
  static const RecordState DRAFT = RecordState._(1, _omitEnumNames ? '' : 'DRAFT');
  static const RecordState CREATED = RecordState._(2, _omitEnumNames ? '' : 'CREATED');
  static const RecordState COLLECT_CLIENT_INSIDE = RecordState._(3, _omitEnumNames ? '' : 'COLLECT_CLIENT_INSIDE');
  static const RecordState COLLECT_CLIENT_SIGNATURE = RecordState._(4, _omitEnumNames ? '' : 'COLLECT_CLIENT_SIGNATURE');
  static const RecordState COLLECT_CLIENT_OUTSIDE = RecordState._(5, _omitEnumNames ? '' : 'COLLECT_CLIENT_OUTSIDE');
  static const RecordState COLLECT_PQRS_SIGNATURE = RecordState._(6, _omitEnumNames ? '' : 'COLLECT_PQRS_SIGNATURE');
  static const RecordState RETURN_CLIENT_INSIDE = RecordState._(7, _omitEnumNames ? '' : 'RETURN_CLIENT_INSIDE');
  static const RecordState RETURN_CLIENT_SIGNATURE = RecordState._(8, _omitEnumNames ? '' : 'RETURN_CLIENT_SIGNATURE');
  static const RecordState RETURN_CLIENT_OUTSIDE = RecordState._(9, _omitEnumNames ? '' : 'RETURN_CLIENT_OUTSIDE');
  static const RecordState RETURN_PQRS_SIGNATURE = RecordState._(10, _omitEnumNames ? '' : 'RETURN_PQRS_SIGNATURE');
  static const RecordState COMPLETED = RecordState._(11, _omitEnumNames ? '' : 'COMPLETED');

  static const $core.List<RecordState> values = <RecordState> [
    UNSPECIFIED,
    DRAFT,
    CREATED,
    COLLECT_CLIENT_INSIDE,
    COLLECT_CLIENT_SIGNATURE,
    COLLECT_CLIENT_OUTSIDE,
    COLLECT_PQRS_SIGNATURE,
    RETURN_CLIENT_INSIDE,
    RETURN_CLIENT_SIGNATURE,
    RETURN_CLIENT_OUTSIDE,
    RETURN_PQRS_SIGNATURE,
    COMPLETED,
  ];

  static final $core.Map<$core.int, RecordState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RecordState? valueOf($core.int value) => _byValue[value];

  const RecordState._($core.int v, $core.String n) : super(v, n);
}

class EventType extends $pb.ProtobufEnum {
  static const EventType EMPTY_EVENT = EventType._(0, _omitEnumNames ? '' : 'EMPTY_EVENT');
  static const EventType ADDED = EventType._(1, _omitEnumNames ? '' : 'ADDED');
  static const EventType MODIFIED = EventType._(2, _omitEnumNames ? '' : 'MODIFIED');
  static const EventType DELETED = EventType._(3, _omitEnumNames ? '' : 'DELETED');

  static const $core.List<EventType> values = <EventType> [
    EMPTY_EVENT,
    ADDED,
    MODIFIED,
    DELETED,
  ];

  static final $core.Map<$core.int, EventType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EventType? valueOf($core.int value) => _byValue[value];

  const EventType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
