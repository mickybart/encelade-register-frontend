import 'dart:convert';

import 'package:archive/archive_io.dart';
import 'package:encelade/controller/interfaces/i_record_controller.dart';
import 'package:encelade/model/types/record_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        return 'sc_client_signature'.tr;
      case RecordState.collectClientOutside:
      case RecordState.returnClientOutside:
        /*
         * next step: pqrs is ready to sign.
         */
        return 'sc_pqrs_signature'.tr;
      default:
        throw Exception('sc_not_allowed'.tr);
    }
  }

  String get nameLabel {
    switch (record.state) {
      case RecordState.collectClientInside:
      case RecordState.returnClientInside:
        /*
         * next step: client is ready to sign.
         */
        return 'sc_client_name'.tr;
      case RecordState.collectClientOutside:
      case RecordState.returnClientOutside:
        /*
         * next step: pqrs is ready to sign.
         */
        return 'sc_pqrs_name'.tr;
      default:
        throw Exception('sc_not_allowed'.tr);
    }
  }

  TextEditingController get nameController => _name;
  sign.SignatureController get signatureController => _signature;

  Future<void> _onSign() async {
    final svg = _signature.toRawSVG();
    if (svg == null) throw Exception('sc_svg_error'.tr);

    final gzipSvg = GZipEncoder().encode(
      utf8.encode(svg),
    );
    if (gzipSvg == null) throw Exception('sc_gzip_error'.tr);

    final signature = base64.encode(
      gzipSvg,
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
        throw Exception('sc_not_allowed'.tr);
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
