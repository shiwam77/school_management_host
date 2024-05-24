class FieldValidator {
  static String? checkNullEmptyValidation(String value, String fieldName,
      {required void Function(bool) hasError}) {
    if (value.isEmpty) {
      hasError(true);
      return '$fieldName is required';
    } else {
      hasError(false);
      return null;
    }
  }

  static String? validateEmail(String email,
      {required void Function(bool) hasError}) {
    if (email.isEmpty) {
      hasError(true); // Notify the calling code that there is an error
      return 'Email is required';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email)) {
      hasError(true);
      return 'Please enter a valid email';
    }

    hasError(false);
    return null; // No validation error
  }

  static String? validatePhone(String phone,
      {required void Function(bool) hasError}) {
    if (phone.isEmpty) {
      hasError(true); // Notify the calling code that there is an error
      return 'Phone number is required';
    } else if (phone.length < 10) {
      hasError(true);
      return 'Phone number must have at least 10 digits';
    }
    hasError(false);
    return null; // No validation error
  }
}
