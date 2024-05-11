//
//  Generated code. Do not modify.
//  source: register.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use recordStateDescriptor instead')
const RecordState$json = {
  '1': 'RecordState',
  '2': [
    {'1': 'UNSPECIFIED', '2': 0},
    {'1': 'DRAFT', '2': 1},
    {'1': 'CREATED', '2': 2},
    {'1': 'COLLECT_CLIENT_INSIDE', '2': 3},
    {'1': 'COLLECT_CLIENT_SIGNATURE', '2': 4},
    {'1': 'COLLECT_CLIENT_OUTSIDE', '2': 5},
    {'1': 'COLLECT_PQRS_SIGNATURE', '2': 6},
    {'1': 'RETURN_CLIENT_INSIDE', '2': 7},
    {'1': 'RETURN_CLIENT_SIGNATURE', '2': 8},
    {'1': 'RETURN_CLIENT_OUTSIDE', '2': 9},
    {'1': 'RETURN_PQRS_SIGNATURE', '2': 10},
    {'1': 'COMPLETED', '2': 11},
  ],
};

/// Descriptor for `RecordState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List recordStateDescriptor = $convert.base64Decode(
    'CgtSZWNvcmRTdGF0ZRIPCgtVTlNQRUNJRklFRBAAEgkKBURSQUZUEAESCwoHQ1JFQVRFRBACEh'
    'kKFUNPTExFQ1RfQ0xJRU5UX0lOU0lERRADEhwKGENPTExFQ1RfQ0xJRU5UX1NJR05BVFVSRRAE'
    'EhoKFkNPTExFQ1RfQ0xJRU5UX09VVFNJREUQBRIaChZDT0xMRUNUX1BRUlNfU0lHTkFUVVJFEA'
    'YSGAoUUkVUVVJOX0NMSUVOVF9JTlNJREUQBxIbChdSRVRVUk5fQ0xJRU5UX1NJR05BVFVSRRAI'
    'EhkKFVJFVFVSTl9DTElFTlRfT1VUU0lERRAJEhkKFVJFVFVSTl9QUVJTX1NJR05BVFVSRRAKEg'
    '0KCUNPTVBMRVRFRBAL');

@$core.Deprecated('Use eventTypeDescriptor instead')
const EventType$json = {
  '1': 'EventType',
  '2': [
    {'1': 'EMPTY_EVENT', '2': 0},
    {'1': 'ADDED', '2': 1},
    {'1': 'MODIFIED', '2': 2},
    {'1': 'DELETED', '2': 3},
  ],
};

/// Descriptor for `EventType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List eventTypeDescriptor = $convert.base64Decode(
    'CglFdmVudFR5cGUSDwoLRU1QVFlfRVZFTlQQABIJCgVBRERFRBABEgwKCE1PRElGSUVEEAISCw'
    'oHREVMRVRFRBAD');

@$core.Deprecated('Use draftDescriptor instead')
const Draft$json = {
  '1': 'Draft',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'summary', '3': 2, '4': 1, '5': 9, '10': 'summary'},
  ],
};

/// Descriptor for `Draft`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List draftDescriptor = $convert.base64Decode(
    'CgVEcmFmdBIOCgJpZBgBIAEoCVICaWQSGAoHc3VtbWFyeRgCIAEoCVIHc3VtbWFyeQ==');

@$core.Deprecated('Use recordIDDescriptor instead')
const RecordID$json = {
  '1': 'RecordID',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `RecordID`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordIDDescriptor = $convert.base64Decode(
    'CghSZWNvcmRJRBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use timestampTraceDescriptor instead')
const TimestampTrace$json = {
  '1': 'TimestampTrace',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'time', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'time'},
  ],
};

/// Descriptor for `TimestampTrace`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timestampTraceDescriptor = $convert.base64Decode(
    'Cg5UaW1lc3RhbXBUcmFjZRIOCgJpZBgBIAEoCVICaWQSLgoEdGltZRgCIAEoCzIaLmdvb2dsZS'
    '5wcm90b2J1Zi5UaW1lc3RhbXBSBHRpbWU=');

@$core.Deprecated('Use signerDescriptor instead')
const Signer$json = {
  '1': 'Signer',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'signature', '3': 2, '4': 1, '5': 9, '10': 'signature'},
  ],
};

/// Descriptor for `Signer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signerDescriptor = $convert.base64Decode(
    'CgZTaWduZXISEgoEbmFtZRgBIAEoCVIEbmFtZRIcCglzaWduYXR1cmUYAiABKAlSCXNpZ25hdH'
    'VyZQ==');

@$core.Deprecated('Use signerTraceDescriptor instead')
const SignerTrace$json = {
  '1': 'SignerTrace',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'signer', '3': 2, '4': 1, '5': 11, '6': '.register.Signer', '10': 'signer'},
  ],
};

/// Descriptor for `SignerTrace`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signerTraceDescriptor = $convert.base64Decode(
    'CgtTaWduZXJUcmFjZRIOCgJpZBgBIAEoCVICaWQSKAoGc2lnbmVyGAIgASgLMhAucmVnaXN0ZX'
    'IuU2lnbmVyUgZzaWduZXI=');

@$core.Deprecated('Use traceDescriptor instead')
const Trace$json = {
  '1': 'Trace',
  '2': [
    {'1': 'inside', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'inside', '17': true},
    {'1': 'outside', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 1, '10': 'outside', '17': true},
    {'1': 'client', '3': 3, '4': 1, '5': 11, '6': '.register.Signer', '9': 2, '10': 'client', '17': true},
    {'1': 'pqrs', '3': 4, '4': 1, '5': 11, '6': '.register.Signer', '9': 3, '10': 'pqrs', '17': true},
  ],
  '8': [
    {'1': '_inside'},
    {'1': '_outside'},
    {'1': '_client'},
    {'1': '_pqrs'},
  ],
};

/// Descriptor for `Trace`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List traceDescriptor = $convert.base64Decode(
    'CgVUcmFjZRI3CgZpbnNpZGUYASABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSABSBm'
    'luc2lkZYgBARI5CgdvdXRzaWRlGAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgB'
    'UgdvdXRzaWRliAEBEi0KBmNsaWVudBgDIAEoCzIQLnJlZ2lzdGVyLlNpZ25lckgCUgZjbGllbn'
    'SIAQESKQoEcHFycxgEIAEoCzIQLnJlZ2lzdGVyLlNpZ25lckgDUgRwcXJziAEBQgkKB19pbnNp'
    'ZGVCCgoIX291dHNpZGVCCQoHX2NsaWVudEIHCgVfcHFycw==');

@$core.Deprecated('Use tracesDescriptor instead')
const Traces$json = {
  '1': 'Traces',
  '2': [
    {'1': 'collected', '3': 1, '4': 1, '5': 11, '6': '.register.Trace', '9': 0, '10': 'collected', '17': true},
    {'1': 'returned', '3': 2, '4': 1, '5': 11, '6': '.register.Trace', '9': 1, '10': 'returned', '17': true},
  ],
  '8': [
    {'1': '_collected'},
    {'1': '_returned'},
  ],
};

/// Descriptor for `Traces`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tracesDescriptor = $convert.base64Decode(
    'CgZUcmFjZXMSMgoJY29sbGVjdGVkGAEgASgLMg8ucmVnaXN0ZXIuVHJhY2VIAFIJY29sbGVjdG'
    'VkiAEBEjAKCHJldHVybmVkGAIgASgLMg8ucmVnaXN0ZXIuVHJhY2VIAVIIcmV0dXJuZWSIAQFC'
    'DAoKX2NvbGxlY3RlZEILCglfcmV0dXJuZWQ=');

@$core.Deprecated('Use recordDescriptor instead')
const Record$json = {
  '1': 'Record',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'api_version', '3': 2, '4': 1, '5': 5, '10': 'apiVersion'},
    {'1': 'summary', '3': 3, '4': 1, '5': 9, '10': 'summary'},
    {'1': 'created', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'created', '17': true},
    {'1': 'traces', '3': 5, '4': 1, '5': 11, '6': '.register.Traces', '9': 1, '10': 'traces', '17': true},
    {'1': 'state', '3': 6, '4': 1, '5': 14, '6': '.register.RecordState', '10': 'state'},
  ],
  '8': [
    {'1': '_created'},
    {'1': '_traces'},
  ],
};

/// Descriptor for `Record`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordDescriptor = $convert.base64Decode(
    'CgZSZWNvcmQSDgoCaWQYASABKAlSAmlkEh8KC2FwaV92ZXJzaW9uGAIgASgFUgphcGlWZXJzaW'
    '9uEhgKB3N1bW1hcnkYAyABKAlSB3N1bW1hcnkSOQoHY3JlYXRlZBgEIAEoCzIaLmdvb2dsZS5w'
    'cm90b2J1Zi5UaW1lc3RhbXBIAFIHY3JlYXRlZIgBARItCgZ0cmFjZXMYBSABKAsyEC5yZWdpc3'
    'Rlci5UcmFjZXNIAVIGdHJhY2VziAEBEisKBXN0YXRlGAYgASgOMhUucmVnaXN0ZXIuUmVjb3Jk'
    'U3RhdGVSBXN0YXRlQgoKCF9jcmVhdGVkQgkKB190cmFjZXM=');

@$core.Deprecated('Use timestampRangeDescriptor instead')
const TimestampRange$json = {
  '1': 'TimestampRange',
  '2': [
    {'1': 'begin', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'begin'},
    {'1': 'end', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'end', '17': true},
  ],
  '8': [
    {'1': '_end'},
  ],
};

/// Descriptor for `TimestampRange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timestampRangeDescriptor = $convert.base64Decode(
    'Cg5UaW1lc3RhbXBSYW5nZRIwCgViZWdpbhgBIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3'
    'RhbXBSBWJlZ2luEjEKA2VuZBgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAFID'
    'ZW5kiAEBQgYKBF9lbmQ=');

@$core.Deprecated('Use searchRequestDescriptor instead')
const SearchRequest$json = {
  '1': 'SearchRequest',
  '2': [
    {'1': 'states', '3': 1, '4': 3, '5': 14, '6': '.register.RecordState', '10': 'states'},
    {'1': 'range', '3': 2, '4': 1, '5': 11, '6': '.register.TimestampRange', '9': 0, '10': 'range', '17': true},
  ],
  '8': [
    {'1': '_range'},
  ],
};

/// Descriptor for `SearchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchRequestDescriptor = $convert.base64Decode(
    'Cg1TZWFyY2hSZXF1ZXN0Ei0KBnN0YXRlcxgBIAMoDjIVLnJlZ2lzdGVyLlJlY29yZFN0YXRlUg'
    'ZzdGF0ZXMSMwoFcmFuZ2UYAiABKAsyGC5yZWdpc3Rlci5UaW1lc3RhbXBSYW5nZUgAUgVyYW5n'
    'ZYgBAUIICgZfcmFuZ2U=');

@$core.Deprecated('Use recordEventDescriptor instead')
const RecordEvent$json = {
  '1': 'RecordEvent',
  '2': [
    {'1': 'event_type', '3': 1, '4': 1, '5': 14, '6': '.register.EventType', '10': 'eventType'},
    {'1': 'record', '3': 2, '4': 1, '5': 11, '6': '.register.Record', '10': 'record'},
  ],
};

/// Descriptor for `RecordEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordEventDescriptor = $convert.base64Decode(
    'CgtSZWNvcmRFdmVudBIyCgpldmVudF90eXBlGAEgASgOMhMucmVnaXN0ZXIuRXZlbnRUeXBlUg'
    'lldmVudFR5cGUSKAoGcmVjb3JkGAIgASgLMhAucmVnaXN0ZXIuUmVjb3JkUgZyZWNvcmQ=');

