import "package:encelade/model/proto/register.pbgrpc.dart" as proto;
import "package:encelade/model/types/record_state.dart";
import "package:encelade/model/types/traces.dart";
import "package:encelade/model/utils.dart";

class Record {
  final String id;
  final int apiVersion;
  final String summary;
  final DateTime? created;
  final Traces traces;
  final RecordState state;

  const Record(this.id, this.apiVersion, this.summary, this.created,
      this.traces, this.state);

  factory Record.fromProto(proto.Record record) {
    final traceCollected = Trace.fromProto(record.traces.collected);
    final traceReturned = Trace.fromProto(record.traces.returned);

    return Record(
      record.id,
      record.apiVersion,
      record.summary,
      record.created.seconds == 0
          ? null
          : dateTimeFromTimestamp(record.created),
      Traces(
        collected: traceCollected.isNull ? null : traceCollected,
        returned: traceReturned.isNull ? null : traceReturned,
      ),
      RecordState.values[record.state.value],
    );
  }
}
