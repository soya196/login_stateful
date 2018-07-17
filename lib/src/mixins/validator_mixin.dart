class ValidatorMixin {
  String validateEmail(value) {
    if (!value.contains("@")) {
      return "Please enter valid email";
    }
    return null;
  }

  String validatePassword(value) {
    if (value.length < 4) {
      return "Password must have length more than 4 characters";
    }
    return null;
  }
}
