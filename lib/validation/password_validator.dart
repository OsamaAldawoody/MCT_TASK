import 'validator.dart';

class PasswordValidator extends Validator {
  PasswordValidator(String text) : super(text);

  @override
  String? validate({int? min = 6, int? max = 50}) {
    if (text.isEmpty) {
      return 'this field is required';
    }

    return null;
  }
}
