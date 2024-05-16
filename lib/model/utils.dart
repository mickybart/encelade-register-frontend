import 'package:encelade/model/proto/google/protobuf/timestamp.pb.dart'
    as protog_t;

DateTime dateTimeFromTimestamp(protog_t.Timestamp timestamp) {
  final millisecondsSinceEpoch =
      timestamp.seconds.toInt() * Duration.millisecondsPerSecond;

  return DateTime.fromMillisecondsSinceEpoch(
    millisecondsSinceEpoch,
    //isUtc: true,
  );
}
