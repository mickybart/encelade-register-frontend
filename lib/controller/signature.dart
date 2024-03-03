import 'dart:convert';
import 'dart:io';

import 'package:encelade/model/remote_register_provider.dart';
import 'package:encelade/model/types/record.dart';
import 'package:encelade/model/types/record_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart' as sign;

class SignatureController extends GetxController {
  final RemoteRegisterProvider _remoteRegisterProvider;
  final Record _record;
  final _name = TextEditingController();
  final _signature = sign.SignatureController(
    penStrokeWidth: 1.0,
    exportBackgroundColor: Colors.transparent,
    exportPenColor: Colors.black,
  );
  final canSign = false.obs;

  SignatureController(this._remoteRegisterProvider, this._record) {
    _name.addListener(
      () {
        canSign.value = _name.text.isNotEmpty && _signature.isNotEmpty;
      },
    );

    _signature.addListener(
      () {
        canSign.value = _name.text.isNotEmpty && _signature.isNotEmpty;
      },
    );
  }

  String get title {
    switch (_record.state) {
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
    switch (_record.state) {
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

  String get id => _record.id;

  void onGoBack() {
    Get.back();
  }

  Future<void> onSign() async {
    final svg = _signature.toRawSVG();
    if (svg == null) throw Exception('The signature is empty !');

    final signature = base64.encode(
      gzip.encode(
        utf8.encode(svg),
      ),
    );

    switch (_record.state) {
      case RecordState.collectClientInside:
        /*
         * next step: client signature to collect
         */
        return await _remoteRegisterProvider.collectClientSignature(
          _record.id,
          _name.text,
          signature,
        );
      case RecordState.collectClientOutside:
        /*
         * next step: pqrs signature to collect
         */
        return await _remoteRegisterProvider.collectPqrsSignature(
          _record.id,
          _name.text,
          signature,
        );
      case RecordState.returnClientInside:
        /*
         * next step: client signature to return
         */
        return await _remoteRegisterProvider.returnClientSignature(
          _record.id,
          _name.text,
          signature,
        );
      case RecordState.returnClientOutside:
        /*
         * next step: pqrs signature to return
         */
        return await _remoteRegisterProvider.returnPqrsSignature(
          _record.id,
          _name.text,
          signature,
        );
      default:
        throw Exception('not allowed for this record state !');
    }
  }

  @override
  void onClose() {
    _signature.dispose();
    super.onClose();
  }
}
