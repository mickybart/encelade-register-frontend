import 'package:encelade/model/types/record.dart';
import 'package:encelade/model/types/record_state.dart';
import 'package:flutter/material.dart';

class RecordTile extends StatelessWidget {
  final Record record;
  final void Function(Record record)? onTap;

  const RecordTile({super.key, required this.record, this.onTap});

  @override
  Widget build(BuildContext context) {
    final (recordIconData, recordColor, recordFriendlyState) = _buildConfig();

    return ListTile(
      leading: Icon(recordIconData, color: recordColor,),
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

  (IconData, Color?, String) _buildConfig() {
    switch (record.state) {
      case RecordState.draft:
        return (Icons.drafts, Colors.purple, 'Draft');
      case RecordState.created:
        return (Icons.shopping_cart, Colors.blue, 'Ready to collect');
      case RecordState.collectClientInside:
        return (Icons.shopping_cart_checkout, Colors.blue, 'Inside office');
      case RecordState.collectClientSignature:
        return (Icons.draw, Colors.blue, 'Signed by client');
      case RecordState.collectClientOutside:
        return (Icons.door_front_door, Colors.blue, 'Outside office');
      case RecordState.collectPqrsSignature:
        return (Icons.science, Colors.orange, 'Lab');
      case RecordState.returnClientInside:
        return (Icons.remove_shopping_cart, Colors.lightGreen, 'Inside office');
      case RecordState.returnClientSignature:
        return (Icons.draw, Colors.lightGreen, 'Signed by client');
      case RecordState.returnClientOutside:
        return (Icons.door_front_door, Colors.lightGreen, 'Outside office');
      case RecordState.returnPqrsSignature:
        return (Icons.draw, Colors.lightGreen, 'Signed by PQRS');
      case RecordState.completed:
        return (Icons.verified, Colors.green, 'Completed');
      case RecordState.unspecified:
        return (Icons.error, Colors.red, 'Unspecified');
    }
  }
}
