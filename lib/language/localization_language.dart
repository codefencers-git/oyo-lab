import 'package:get/get.dart';

class LanguageLocaleString extends Translations {
  LanguageLocaleString();

  @override
  Map<String, Map<String, String>> get keys => {
         'en_US': {
          'contact_us_key': 'Contact Us',
          'skip_us_key': 'SKIP',
         'find_a_lab_key': 'Find A Lab',
        },
        // 'hi_IN': {
        //   'hello': 'नमस्ते दुनिया',
        // }
      };
}
