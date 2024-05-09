import 'package:encelade/controller/interfaces/i_remote_register_controller.dart';
import 'package:encelade/model/types/record.dart';

abstract class IRecordController extends IRemoteRegisterController {
  final Record record;
  
  IRecordController(super.remoteRegisterProvider, this.record);
  
  String get id => record.id;
}