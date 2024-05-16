import 'package:encelade/model/proto/google/protobuf/timestamp.pb.dart'
    as protog_t;
import 'package:fixnum/fixnum.dart';

DateTime dateTimeFromTimestamp(protog_t.Timestamp timestamp) {
  final millisecondsSinceEpoch =
      timestamp.seconds.toInt() * Duration.millisecondsPerSecond;

  return DateTime.fromMillisecondsSinceEpoch(
    millisecondsSinceEpoch,
    //isUtc: true,
  );
}

protog_t.Timestamp timestampFromDateTime(DateTime time) {
  final timeSecondsSinceEpoch =
      (time.millisecondsSinceEpoch / Duration.millisecondsPerSecond).round();

  return protog_t.Timestamp(seconds: Int64(timeSecondsSinceEpoch));
}
