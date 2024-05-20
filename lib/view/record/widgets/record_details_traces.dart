import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../model/types/traces.dart';

class RecordDetailsTraces extends StatelessWidget {
  final Trace trace;

  const RecordDetailsTraces({super.key, required this.trace});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.jm();

    return Column(
      children: [
        const Text(
          'Client',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(150),
            1: FlexColumnWidth(),
          },
          children: [
            TableRow(
              children: [
                const Text('Inside at:'),
                Text(trace.inside == null
                    ? '-'
                    : dateFormat.format(trace.inside!)),
              ],
            ),
            TableRow(children: [
              const Text('Name:'),
              Text(trace.client == null ? '-' : trace.client!.name),
            ]),
            TableRow(children: [
              const Text('Signature:'),
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
              const Text('Outside at:'),
              Text(trace.outside == null
                  ? '-'
                  : dateFormat.format(trace.outside!)),
            ]),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Text(
          'PQRS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(150),
            1: FlexColumnWidth(),
          },
          children: [
            TableRow(children: [
              const Text('Name:'),
              Text(trace.pqrs == null ? '-' : trace.pqrs!.name),
            ]),
            TableRow(children: [
              const Text('Signature:'),
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
