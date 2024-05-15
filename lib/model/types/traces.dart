import 'dart:convert';
import 'dart:io';

import 'package:encelade/model/proto/register.pb.dart' as proto;
import 'package:encelade/model/utils.dart';

class Signer {
  final String name;
  final String signature;

  Signer(this.name, this.signature);

  factory Signer.fromProto(proto.Signer signer) {
    return Signer(signer.name, signer.signature);
  }

  String get svgSignature {
    try {
      return utf8.decode(
        gzip.decode(
          base64.decode(signature),
        ),
      );
    } on Exception {
      return '<svg height="50" width="10" xmlns="http://www.w3.org/2000/svg">\n<line x1="0" y1="10" x2="5" y2="10" style="stroke:black;stroke-width:1" />\n</svg>';
    }
  }
}

class Trace {
  final DateTime? inside;
  final DateTime? outside;
  final Signer? client;
  final Signer? pqrs;

  Trace(this.inside, this.outside, this.client, this.pqrs);

  factory Trace.fromProto(proto.Trace trace) {
    final inside =
        trace.inside.seconds != 0 ? dateTimeFromTimestamp(trace.inside) : null;
    final outside = trace.outside.seconds != 0
        ? dateTimeFromTimestamp(trace.outside)
        : null;
    final client =
        trace.client.name != '' ? Signer.fromProto(trace.client) : null;
    final pqrs = trace.pqrs.name != '' ? Signer.fromProto(trace.pqrs) : null;

    return Trace(
      inside,
      outside,
      client,
      pqrs,
    );
  }

  bool get isNull =>
      (inside == null && outside == null && client == null && pqrs == null);
}

class Traces {
  final Trace? collected;
  final Trace? returned;

  Traces({this.collected, this.returned});
}
