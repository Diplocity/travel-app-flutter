class ValidationMixin {
   validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex =  RegExp(pattern);

    if (value!.isEmpty) {
      return 'Email cannot be empty';
    }

    if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

   validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be empty';
    }

    if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }
}
