import 'package:oyo_labs/global/global_messages.dart';

class Validation {
  bool isNumeric(String str) {
    try {
      var value = int.parse(str);
    } on FormatException {
      return false;
    }
    return true;
  }

  String? emailValidation(String? value) {
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
      return GlobalMessages.pleaseEnterValidEmail;
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return GlobalMessages.emptyMessage + 'password field';
    } else {
      var passwordLength = value.length;
      if (passwordLength < 6) {
        return GlobalMessages.passwordshoudbeatleat;
      }
    }
    return null;
  }

  String? phoneNumverValidation(String? value) {
    if (value!.isEmpty) {
      return GlobalMessages.emptyMessage + 'phone number';
    } else if (value.length != 10) {
      return GlobalMessages.phoneNumberinvalied;
    }
    return null;
  }

  String? nameValidation(String? value) {
        if (value!.isEmpty) {
          return GlobalMessages.emptyMessage + 'name';
        }
        if (value.length < 3) {
          return GlobalMessages.nameLengthMessage;
        }
        return null;
      }
}
