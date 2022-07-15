import 'package:validators/validators.dart';

class StringUtility {
  StringUtility._();

  static bool isEmail(String? string) {
    if (string == null) return false;
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(string);
  }
  static bool isUserName(String? string){
    if (string == null) return false;
    return isAlpha(string);
  }
  static bool isAlphaString(String? string) {
    if (string == null) return false;
    List<String> s = string.split(' ');
    for (String e in s) {
      if (!isAlpha(e)) return false;
    }
    return true;
  }

  static bool isLengthShorterOrEqual(
      String? string,int? length) {
    int strLength;
    if (string == null) {
      strLength = 0;
    } else {
      strLength = string.length;
    }
    return strLength <= length!;
  }

  static bool isLengthLongerOrEqual(
      String? string,int? length) {
    int strLength;
    if (string == null) {
      strLength = 0;
    } else {
      strLength = string.length;
    }
    return strLength >= length!;
  }

  static bool isNumber(String? string) {
    if (string == null) return false;
    return (string.isNotEmpty && num.tryParse(string) != null);
  }


  static bool isPhoneNumber(String? string) {
    if (string == null) return false;
    return (string.isNotEmpty && int.tryParse(string) != null && string.length == 8);
  }


  static bool isInteger(String? string) {
    if (string == null) return false;
    return (string.isNotEmpty && int.tryParse(string) != null);
  }

  ///check weather or not string is a number before using this
  ///it will return 0 if it's not a number which might not be the intended output
  static num getNumber(String? string) => (num.tryParse(string ?? '') ?? 0);
}
