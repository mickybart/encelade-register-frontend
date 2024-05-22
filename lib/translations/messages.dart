import 'package:encelade/translations/en_ca/en_ca.dart';
import 'package:encelade/translations/fr_ca/fr_ca.dart';
import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_CA': enCA(),
    'fr_CA': frCA(),
  };
}