import 'package:encelade/model/types/record_state.dart';
import 'package:flutter/material.dart';

(IconData, Color?, String) recordStyle(RecordState state) {
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