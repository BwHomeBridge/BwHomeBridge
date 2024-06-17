class McValidators {
  McValidators._();

  static bool isNull(String? str) {
    return str == null;
  }

  static String? isNotEmpty(String? str) {
    if (str!.isEmpty || isNull(str)) {
      return 'Cannot be empty!';
    }

    return null;
  }

  static String? email(String? str) {
    var notEmpty = isNotEmpty(str);
    if (notEmpty != null) return notEmpty;

    if (!str!.contains('@')) return 'Must be a valid email';

    /// todo :email vaildation regex

    return null;
  }

  static String? isNumeric(String? str) {
    if (str == null) return null;
    if (str.isEmpty) return null;

    if (double.tryParse(str) != null) return null;

    return 'Must be a valid number';
  }

  static String? isNonNullNumeric(String? str) {
    if (str == null) {
      return 'Cannot be empty!';
    }
    if (double.tryParse(str) != null) return null;

    return 'Must be a valid number';
  }

  static String? isGreaterThanZero(String? str) {
    var warning = 'Must be a greater than 0';
    if (str == null) return warning;

    if (double.tryParse(str) == null) return warning;

    if (double.tryParse(str)! <= 0) return warning;

    return null;
  }

  static String? password(String? str) {
    var notEmpty = isNotEmpty(str);
    if (notEmpty != null) return notEmpty;

    if (str!.length < 8) {
      return 'Must be atleast 8 characters';
    }

    /// todo: more password validation

    return null;
  }

  static String? confirmPassword(String? password, String? confirmPassword) {
    if (password!.isEmpty) return null;

    if (password != confirmPassword) {
      return 'Does not match password';
    }

    return null;
  }
}
