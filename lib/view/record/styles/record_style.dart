import 'package:encelade/model/types/record_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// for PDF
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

(IconData, Color, String) recordStyle(RecordState state) {
  switch (state) {
    case RecordState.draft:
      return (Icons.drafts, Colors.purple, 'state_draft'.tr);
    case RecordState.created:
      return (Icons.shopping_cart, Colors.blue, 'state_created'.tr);
    case RecordState.collectClientInside:
      return (Icons.point_of_sale, Colors.blue, 'state_inside'.tr);
    case RecordState.collectClientSignature:
      return (Icons.draw, Colors.blue, 'state_signed_client'.tr);
    case RecordState.collectClientOutside:
      return (Icons.door_front_door, Colors.blue, 'state_outside'.tr);
    case RecordState.collectPqrsSignature:
      return (Icons.science, Colors.orange, 'state_lab'.tr);
    case RecordState.returnClientInside:
      return (Icons.remove_shopping_cart, Colors.lightGreen, 'state_inside'.tr);
    case RecordState.returnClientSignature:
      return (Icons.draw, Colors.lightGreen, 'state_signed_client'.tr);
    case RecordState.returnClientOutside:
      return (Icons.door_front_door, Colors.lightGreen, 'state_outside'.tr);
    case RecordState.returnPqrsSignature:
      return (Icons.draw, Colors.lightGreen, 'state_signed_pqrs'.tr);
    case RecordState.completed:
      return (Icons.verified, Colors.green, 'state_completed'.tr);
    case RecordState.unspecified:
      return (Icons.error, Colors.red, 'state_unspecified'.tr);
  }
}

(pw.IconData, PdfColor, String) recordStylePdf(RecordState state) {
  switch (state) {
    case RecordState.draft:
      return (const pw.IconData(0xe151), PdfColors.purple, 'state_draft'.tr);
    case RecordState.created:
      return (const pw.IconData(0xe8cc), PdfColors.blue, 'state_created'.tr);
    case RecordState.collectClientInside:
      return (const pw.IconData(0xf17e), PdfColors.blue, 'state_inside'.tr);
    case RecordState.collectClientSignature:
      return (const pw.IconData(0xe746), PdfColors.blue, 'state_signed_client'.tr);
    case RecordState.collectClientOutside:
      return (const pw.IconData(0xeffd), PdfColors.blue, 'state_outside'.tr);
    case RecordState.collectPqrsSignature:
      return (const pw.IconData(0xea4b), PdfColors.orange, 'state_lab'.tr);
    case RecordState.returnClientInside:
      return (const pw.IconData(0xe928), PdfColors.lightGreen, 'state_inside'.tr);
    case RecordState.returnClientSignature:
      return (const pw.IconData(0xe746), PdfColors.lightGreen, 'state_signed_client'.tr);
    case RecordState.returnClientOutside:
      return (const pw.IconData(0xeffd), PdfColors.lightGreen, 'state_outside'.tr);
    case RecordState.returnPqrsSignature:
      return (const pw.IconData(0xe746), PdfColors.lightGreen, 'state_signed_pqrs'.tr);
    case RecordState.completed:
      return (const pw.IconData(0xef76), PdfColors.green, 'state_completed'.tr);
    case RecordState.unspecified:
      return (const pw.IconData(0xe000), PdfColors.red, 'state_unspecified'.tr);
  }
}