class Validation {
  static isPhone(String phone) {
    final rgxPhone = RegExp(r'^[0-9]+$');

    return rgxPhone.hasMatch(phone);
  }

  static isPassValid(String password) {
    return password.length >= 6;
  }

  static isDisaplayNameValid(String displayName) {
    return displayName.length > 5;
  }
}
