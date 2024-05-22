import 'package:encelade/model/types/record_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// for PDF
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

(IconData, Color, String) recordStyle(RecordState state) {
  switch (state) {
    case RecordState.draft:
      return (Icons.drafts, Colors.purple, 'rs_draft'.tr);
    case RecordState.created:
      return (Icons.shopping_cart, Colors.blue, 'rs_created'.tr);
    case RecordState.collectClientInside:
      return (Icons.shopping_cart_checkout, Colors.blue, 'rs_inside'.tr);
    case RecordState.collectClientSignature:
      return (Icons.draw, Colors.blue, 'rs_signed_client'.tr);
    case RecordState.collectClientOutside:
      return (Icons.door_front_door, Colors.blue, 'rs_outside'.tr);
    case RecordState.collectPqrsSignature:
      return (Icons.science, Colors.orange, 'rs_lab'.tr);
    case RecordState.returnClientInside:
      return (Icons.remove_shopping_cart, Colors.lightGreen, 'rs_inside'.tr);
    case RecordState.returnClientSignature:
      return (Icons.draw, Colors.lightGreen, 'rs_signed_client'.tr);
    case RecordState.returnClientOutside:
      return (Icons.door_front_door, Colors.lightGreen, 'rs_outside'.tr);
    case RecordState.returnPqrsSignature:
      return (Icons.draw, Colors.lightGreen, 'rs_signed_pqrs'.tr);
    case RecordState.completed:
      return (Icons.verified, Colors.green, 'rs_completed'.tr);
    case RecordState.unspecified:
      return (Icons.error, Colors.red, 'rs_unspecified'.tr);
  }
}

(pw.IconData, PdfColor, String) recordStylePdf(RecordState state) {
  switch (state) {
    case RecordState.draft:
      return (const pw.IconData(0xe151), PdfColors.purple, 'rs_draft'.tr);
    case RecordState.created:
      return (const pw.IconData(0xe8cc), PdfColors.blue, 'rs_created'.tr);
    case RecordState.collectClientInside:
      return (const pw.IconData(0xeb88), PdfColors.blue, 'rs_inside'.tr);
    case RecordState.collectClientSignature:
      return (const pw.IconData(0xe746), PdfColors.blue, 'rs_signed_client'.tr);
    case RecordState.collectClientOutside:
      return (const pw.IconData(0xeffd), PdfColors.blue, 'rs_outside'.tr);
    case RecordState.collectPqrsSignature:
      return (const pw.IconData(0xea4b), PdfColors.orange, 'rs_lab'.tr);
    case RecordState.returnClientInside:
      return (const pw.IconData(0xe928), PdfColors.lightGreen, 'rs_inside'.tr);
    case RecordState.returnClientSignature:
      return (const pw.IconData(0xe746), PdfColors.lightGreen, 'rs_signed_client'.tr);
    case RecordState.returnClientOutside:
      return (const pw.IconData(0xeffd), PdfColors.lightGreen, 'rs_outside'.tr);
    case RecordState.returnPqrsSignature:
      return (const pw.IconData(0xe746), PdfColors.lightGreen, 'rs_signed_pqrs'.tr);
    case RecordState.completed:
      return (const pw.IconData(0xef76), PdfColors.green, 'rs_completed'.tr);
    case RecordState.unspecified:
      return (const pw.IconData(0xe000), PdfColors.red, 'rs_unspecified'.tr);
  }
}