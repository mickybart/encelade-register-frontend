import "package:encelade/model/proto/register.pbgrpc.dart"
    as proto;
import "package:encelade/model/types/record_state.dart";

class Record {
  final String id;
  final int apiVersion;
  final String summary;
  final RecordState state;

  Record(this.id, this.apiVersion, this.summary, this.state);

  factory Record.fromProto(proto.Record record) {
    return Record(
      record.id,
      record.apiVersion,
      record.summary,
      RecordState.values[record.state.value],
    );
  }
}
