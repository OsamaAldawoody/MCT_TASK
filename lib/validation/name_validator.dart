import 'validator.dart';

class FieldValidator extends Validator {
  FieldValidator(String text) : super(text);

  @override
  String? validate() {
    if (text.isEmpty) {
      return 'field is required';
    }
    return null;
  }
}
