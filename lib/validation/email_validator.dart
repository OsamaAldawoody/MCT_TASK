import 'validator.dart';

class EmailValidator extends Validator {
  EmailValidator(String text) : super(text);

  @override
  String? validate({int? min, int? max}) {
    final rgx = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!rgx.hasMatch(text)) {
      return 'Invalid email';
    }
    return null;
  }
}
