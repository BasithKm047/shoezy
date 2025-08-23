class Commonfunctions {
  static String? usernameValidator(String? value) {
    try {
      if (value == null || value.trim().isEmpty) {
        return 'Please Enter username';
      } else if (value.length < 3) {
        return 'username should be morethan 3 character';
      } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
        return 'Username can only contain letters and numbers';
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static String? emailValidator(String? value) {
    try {
      if (value == null ||value.trim().isEmpty) {
        return 'Please enter an email address';
      } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value.trim()))  {
        return 'Please enter a valid email address';
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password should be at least 6 characters';
    }
    final pattern = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).+$',
    );
    if (!pattern.hasMatch(value)) {
      return 'Password must contain uppercase, lowercase, number, and special character';
    }
    return null;
  }
}
