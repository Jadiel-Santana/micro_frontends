import '../../validation.dart';

class ValidatorBuilder {
  final List<Validator> validators = [];

  ValidatorBuilder required() {
    validators.add(RequiredFieldValidator());
    return this;
  }

  ValidatorBuilder email() {
    validators.add(EmailValidator());
    return this;
  }

  MultiValidator build() => MultiValidator(validators: validators);
}
