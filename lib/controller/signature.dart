import 'dart:convert';
import 'dart:io';

import 'package:encelade/controller/interfaces/i_record_controller.dart';
import 'package:encelade/model/types/record_state.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart' as sign;

class SignatureController extends IRecordController {
  final _name = TextEditingController();
  final _signature = sign.SignatureController(
    penStrokeWidth: 1.0,
    exportBackgroundColor: Colors.transparent,
    exportPenColor: Colors.black,
  );

  SignatureController(super.remoteRegisterProvider, super.record) {
    _name.addListener(_updateValidity);
    _signature.addListener(_updateValidity);
  }

  void _updateValidity() {
    validity(_name.text.isNotEmpty && _signature.isNotEmpty);
  }

  String get title {
    switch (record.state) {
      case RecordState.collectClientInside:
      case RecordState.returnClientInside:
        /*
         * next step: client is ready to sign.
         */
        return 'Client signature';
      case RecordState.collectClientOutside:
      case RecordState.returnClientOutside:
        /*
         * next step: pqrs is ready to sign.
         */
        return 'PQRS signature';
      default:
        throw Exception('not allowed for this record state !');
    }
  }

  String get nameLabel {
    switch (record.state) {
      case RecordState.collectClientInside:
      case RecordState.returnClientInside:
        /*
         * next step: client is ready to sign.
         */
        return 'client name';
      case RecordState.collectClientOutside:
      case RecordState.returnClientOutside:
        /*
         * next step: pqrs is ready to sign.
         */
        return 'PQRS name';
      default:
        throw Exception('not allowed for this record state !');
    }
  }

  TextEditingController get nameController => _name;
  sign.SignatureController get signatureController => _signature;

  Future<void> _onSign() async {
    final svg = _signature.toRawSVG();
    if (svg == null) throw Exception('The signature is empty !');

    final signature = base64.encode(
      gzip.encode(
        utf8.encode(svg),
      ),
    );

    switch (record.state) {
      case RecordState.collectClientInside:
        /*
         * next step: client signature to collect
         */
        return await remoteRegisterProvider.collectClientSignature(
          record.id,
          _name.text,
          signature,
        );
      case RecordState.collectClientOutside:
        /*
         * next step: pqrs signature to collect
         */
        return await remoteRegisterProvider.collectPqrsSignature(
          record.id,
          _name.text,
          signature,
        );
      case RecordState.returnClientInside:
        /*
         * next step: client signature to return
         */
        return await remoteRegisterProvider.returnClientSignature(
          record.id,
          _name.text,
          signature,
        );
      case RecordState.returnClientOutside:
        /*
         * next step: pqrs signature to return
         */
        return await remoteRegisterProvider.returnPqrsSignature(
          record.id,
          _name.text,
          signature,
        );
      default:
        throw Exception('not allowed for this record state !');
    }
  }

  Future<void> onSign() async {
    await onRemoteCallAction(_onSign);
  }

  @override
  void onClose() {
    _signature.dispose();
    super.onClose();
  }
}
