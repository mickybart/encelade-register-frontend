import 'package:encelade/model/types/record_state.dart';
import 'package:flutter/material.dart';

// for PDF
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

(IconData, Color, String) recordStyle(RecordState state) {
  switch (state) {
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

(pw.IconData, PdfColor, String) recordStylePdf(RecordState state) {
  switch (state) {
    case RecordState.draft:
      return (const pw.IconData(0xe151), PdfColors.purple, 'Draft');
    case RecordState.created:
      return (const pw.IconData(0xe8cc), PdfColors.blue, 'Ready to collect');
    case RecordState.collectClientInside:
      return (const pw.IconData(0xeb88), PdfColors.blue, 'Inside office');
    case RecordState.collectClientSignature:
      return (const pw.IconData(0xe746), PdfColors.blue, 'Signed by client');
    case RecordState.collectClientOutside:
      return (const pw.IconData(0xeffd), PdfColors.blue, 'Outside office');
    case RecordState.collectPqrsSignature:
      return (const pw.IconData(0xea4b), PdfColors.orange, 'Lab');
    case RecordState.returnClientInside:
      return (const pw.IconData(0xe928), PdfColors.lightGreen, 'Inside office');
    case RecordState.returnClientSignature:
      return (const pw.IconData(0xe746), PdfColors.lightGreen, 'Signed by client');
    case RecordState.returnClientOutside:
      return (const pw.IconData(0xeffd), PdfColors.lightGreen, 'Outside office');
    case RecordState.returnPqrsSignature:
      return (const pw.IconData(0xe746), PdfColors.lightGreen, 'Signed by PQRS');
    case RecordState.completed:
      return (const pw.IconData(0xef76), PdfColors.green, 'Completed');
    case RecordState.unspecified:
      return (const pw.IconData(0xe000), PdfColors.red, 'Unspecified');
  }
}