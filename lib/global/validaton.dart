import 'global_messages.dart';

class Validation {
  Validation();
  bool isNumeric(String str) {
    try {
      var value = int.parse(str);
    } on FormatException {
      return false;
    }
    return true;
  }

  String? validateEmail(String? value) {
    (value) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = RegExp(pattern.toString());
      if (value!.isEmpty) {
        return GlobalMessages.emptyMessage + 'phone number or email';
      }
      if (isNumeric(value)) {
        if (value.length != 10) {
          return GlobalMessages.emptyMessage + 'valid phone number';
        }
      } else if (!regex.hasMatch(value)) {
        return 'Enter valid Email.';
      }
    };
    return null;
  }

    String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return GlobalMessages.emptyMessage + 'password field';
    } else {
      var passwordLength = value.length;
      if (passwordLength < 6) {
        return 'Please enter password must be at least 6 characters.';
      }
    }
    return null;
  }
}
