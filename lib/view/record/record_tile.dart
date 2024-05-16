import 'package:encelade/model/types/record.dart';
import 'package:encelade/view/record/record_style.dart';
import 'package:flutter/material.dart';

class RecordTile extends StatelessWidget {
  final Record record;
  final void Function(Record record)? onTap;
  final void Function(Record record)? onDetailsTap;

  const RecordTile(
      {super.key, required this.record, this.onTap, this.onDetailsTap});

  @override
  Widget build(BuildContext context) {
    final (recordIconData, recordColor, recordFriendlyState) = recordStyle(record.state);

    return ListTile(
      leading: Icon(
        recordIconData,
        color: recordColor,
      ),
      contentPadding: const EdgeInsets.all(8.0),
      trailing: onDetailsTap == null
          ? null
          : IconButton(
              onPressed: () => onDetailsTap!(record),
              icon: const Icon(Icons.more_vert),
            ),
      title: Text(record.id),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(record.summary),
          Text(
            recordFriendlyState,
            textAlign: TextAlign.right,
            style: TextStyle(fontStyle: FontStyle.italic, color: recordColor),
          ),
        ],
      ),
      onTap: onTap == null ? null : () => onTap!(record),
    );
  }
}
