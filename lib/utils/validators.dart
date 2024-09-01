bool isValidEmail(String input) {
  final RegExp regex =
      RegExp(r'^[a-zA-Z0-9.a-zA-Z0-9_%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,20}$');
  return regex.hasMatch(input);
}

bool isValidUSPhoneNumber(String input) {
  final RegExp regex =
      RegExp(r'^1?-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');
  return regex.hasMatch(input);
}

bool isValidPassword(String input) {
  final RegExp regex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&_])[A-Za-z\d@$!%*?&_]{8,}$');
  return regex.hasMatch(input);
}
