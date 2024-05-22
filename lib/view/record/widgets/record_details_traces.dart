import 'package:encelade/translations/get_date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../model/types/traces.dart';

class RecordDetailsTraces extends StatelessWidget {
  final Trace trace;

  const RecordDetailsTraces({super.key, required this.trace});

  @override
  Widget build(BuildContext context) {
    final dateFormat = GetDateFormat.jm();

    return Column(
      children: [
        Text(
          'record_client'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(150),
            1: FlexColumnWidth(),
          },
          children: [
            TableRow(
              children: [
                Text('record_inside_at'.tr),
                Text(trace.inside == null
                    ? '-'
                    : dateFormat.format(trace.inside!)),
              ],
            ),
            TableRow(children: [
              Text('record_name'.tr),
              Text(trace.client == null ? '-' : trace.client!.name),
            ]),
            TableRow(children: [
              Text('record_signature'.tr),
              trace.client == null
                  ? const Text('-')
                  : SvgPicture.string(
                      trace.client!.svgSignature,
                      height: 50.0,
                      width: 100.0,
                      alignment: Alignment.topLeft,
                    ),
            ]),
            TableRow(children: [
              Text('record_outside_at'.tr),
              Text(trace.outside == null
                  ? '-'
                  : dateFormat.format(trace.outside!)),
            ]),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          'record_pqrs'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(150),
            1: FlexColumnWidth(),
          },
          children: [
            TableRow(children: [
              Text('record_name'.tr),
              Text(trace.pqrs == null ? '-' : trace.pqrs!.name),
            ]),
            TableRow(children: [
              Text('record_signature'.tr),
              trace.pqrs == null
                  ? const Text('-')
                  : SvgPicture.string(
                      trace.pqrs!.svgSignature,
                      height: 50.0,
                      width: 100.0,
                      alignment: Alignment.topLeft,
                    ),
            ]),
          ],
        ),
      ],
    );
  }
}
