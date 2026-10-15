class AppValidators{

  static String? validatorFullName(String? value){
    if (value == null || value.isEmpty){
      return "Full Name is Required.";
    }

    final fullNameRegExp = RegExp(r'^[a-zA-Z ]+$'); // space after Z allows space in name like abc xyz otherwise abc is valid abc xyz is not valid

    if (!fullNameRegExp.hasMatch(value)){
      return "Invalid Full Name";
    }

    if(value.length < 3){
      return "Full Name must be atleast 3 characters long";
    }

    return null;
  }

  static String? validateEmail(String? value){
      if (value == null || value.isEmpty){
        return "Email is Required.";
      }

      // Regular Expression For Email validation
      final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

      /*
      [\w-] → One character
      [\w-]+ → One or more characters 
      [\w-]* → Zero or more characters 
      [a-z] -> one lowecase English character
      r'...' — Raw string in Dart.
      ^ — Start of the string.
      [\w-\.]+ — One or more word characters, hyphens, or dots before @.
      @ — Requires the @ symbol.
      ([\w-]+\.)+ — Domain name followed by a dot, repeated one or more times.
      [\w-]{2,4} — Final domain extension containing 2–4 word characters or hyphens.
      $ — End of the string.
      */

      if (!emailRegExp.hasMatch(value)){
        return "Invalid email";
      }

      return null;
  }

  static String? validatePassword(String? value){
      if (value == null || value.isEmpty){
        return "Password is Required.";
      }

      // chheck for minimum pass length
      if (value.length < 8){
        return "Password must be atleast 8 characters long";
      }

      // Check for uppercase letters
      if (!value.contains(RegExp(r'[A-Z]'))) {
        return 'Password must contain at least one uppercase letter.';
      }

      // Check for numbers
      if (!value.contains(RegExp(r'[0-9]'))) {
        return 'Password must contain at least one number.';
      }

      // Check for special characters
      if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        return 'Password must contain at least one special character.';
      }

      return null;
      }

  static String? validatePhoneNumber(String? value) {
      if (value == null || value.isEmpty) {
        return 'Phone number is required.';
      }

      // Regular expression for phone number validation (assuming a 10-digit US phone number format)
      final phoneRegExp = RegExp(r'^\d{10}$');

      if (!phoneRegExp.hasMatch(value)) {
        return 'Invalid phone number format (10 digits required).';
      }

      return null;
    }

  static String? validateConfirmPassword(String? value, [String? password]) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is Required.';
    }

    // If password is provided, verify that both match
    if (password != null && password.isNotEmpty && value != password) {
      return 'Passwords do not match.';
    }

    return null;
  }


}