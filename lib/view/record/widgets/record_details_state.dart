import 'package:encelade/model/types/record_state.dart';
import 'package:encelade/view/record/styles/record_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordDetailsState extends StatelessWidget {
  final RecordState state;

  const RecordDetailsState({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final (recordIconData, recordColor, recordFriendlyState) = recordStyle(state);

    return Row(
      children: [
        Icon(
          recordIconData,
          color: recordColor,
        ),
        const SizedBox(width: 8.0),
        Text(
          recordFriendlyState,
          style: TextStyle(color: recordColor),
        ),
        if (state == RecordState.collectPqrsSignature) ...[
          const SizedBox(width: 8.0),
          Text('rs_signed_pqrs_alt'.tr, style: const TextStyle(color: Colors.blue)),
        ],
      ],
    );
  }
}
