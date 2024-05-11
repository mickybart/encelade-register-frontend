import "package:encelade/model/proto/register.pbgrpc.dart"
    as proto;
import "package:encelade/model/types/record.dart";
import 'package:encelade/model/types/event_type.dart';

class RecordEvent {
  final EventType eventType;
  final Record? record;

  RecordEvent(this.eventType, this.record);

  factory RecordEvent.fromProto(proto.RecordEvent event) {
    return RecordEvent(
      EventType.values[event.eventType.value],
      Record.fromProto(event.record),
    );
  }
}