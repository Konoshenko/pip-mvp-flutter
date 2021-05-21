class Validator {
  static String? validateEmail(String? value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(pattern);

    return (!regex.hasMatch(value!)) ? 'Please enter valid email' : null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value == '') return 'Enter password';
    if (value.length < 6) return 'Enter min 6 alphanumeric characters';

    return null;
  }
}
