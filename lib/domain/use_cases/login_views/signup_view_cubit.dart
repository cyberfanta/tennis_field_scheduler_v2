import 'package:bloc/bloc.dart';
import 'package:tennis_field_scheduler_v2/utils/stamp.dart';

import '../../../utils/validators.dart';

class SignUpViewData {
  final bool nameHasError;
  final String nameText;
  final bool emailHasError;
  final String emailText;
  final bool phoneHasError;
  final String phoneText;
  final bool passHasError;
  final String passText;
  final bool confirmPassHasError;
  final String confirmPassText;
  final bool buttonAllowed;

  SignUpViewData({
    required this.nameHasError,
    required this.nameText,
    required this.emailHasError,
    required this.emailText,
    required this.phoneHasError,
    required this.phoneText,
    required this.passHasError,
    required this.passText,
    required this.confirmPassHasError,
    required this.confirmPassText,
    required this.buttonAllowed,
  });

  @override
  String toString() {
    return "SignUpViewData ("
        "nameHasError: $nameHasError,"
        " nameText: \"$nameText\","
        " emailHasError: $emailHasError,"
        " emailText: \"$emailText\","
        " phoneHasError: $phoneHasError,"
        " phoneText: \"$phoneText\","
        " passHasError: $passHasError,"
        " passText: \"$passText\","
        " confirmPassHasError: $confirmPassHasError,"
        " confirmPassText: \"$confirmPassText\","
        " buttonAllowed: $buttonAllowed"
        ")";
  }
}

SignUpViewData _default = SignUpViewData(
  nameHasError: false,
  nameText: "",
  emailHasError: false,
  emailText: "",
  phoneHasError: false,
  phoneText: "",
  passHasError: false,
  passText: "",
  confirmPassHasError: false,
  confirmPassText: "",
  buttonAllowed: false,
);

class SignUpViewCubit extends Cubit<SignUpViewData> {
  SignUpViewCubit() : super(_default);

  bool validateName(String value) {
    if (value.length < 3) {
      emit(SignUpViewData(
        nameHasError: true,
        nameText: value,
        emailHasError: state.emailHasError,
        emailText: state.emailText,
        phoneHasError: state.phoneHasError,
        phoneText: state.phoneText,
        passHasError: state.passHasError,
        passText: state.passText,
        confirmPassHasError: state.confirmPassHasError,
        confirmPassText: state.confirmPassText,
        buttonAllowed: false,
      ));
      return false;
    }

    if (state.emailHasError ||
        state.emailText.isEmpty ||
        state.phoneHasError ||
        state.phoneText.isEmpty ||
        state.passHasError ||
        state.passText.isEmpty ||
        state.confirmPassHasError ||
        state.confirmPassText.isEmpty) {
      emit(SignUpViewData(
        nameHasError: false,
        nameText: value,
        emailHasError: state.emailHasError,
        emailText: state.emailText,
        phoneHasError: state.phoneHasError,
        phoneText: state.phoneText,
        passHasError: state.passHasError,
        passText: state.passText,
        confirmPassHasError: state.confirmPassHasError,
        confirmPassText: state.confirmPassText,
        buttonAllowed: false,
      ));
      return false;
    }

    _allOk();
    return true;
  }

  bool validateEmail(String value) {
    if (!isValidEmail(value)) {
      emit(SignUpViewData(
        nameHasError: state.nameHasError,
        nameText: state.nameText,
        emailHasError: true,
        emailText: value,
        phoneHasError: state.phoneHasError,
        phoneText: state.phoneText,
        passHasError: state.passHasError,
        passText: state.passText,
        confirmPassHasError: state.confirmPassHasError,
        confirmPassText: state.confirmPassText,
        buttonAllowed: false,
      ));
      return false;
    }

    if (state.nameHasError ||
        state.nameText.isEmpty ||
        state.phoneHasError ||
        state.phoneText.isEmpty ||
        state.passHasError ||
        state.passText.isEmpty ||
        state.confirmPassHasError ||
        state.confirmPassText.isEmpty) {
      emit(SignUpViewData(
        nameHasError: state.nameHasError,
        nameText: state.nameText,
        emailHasError: false,
        emailText: value,
        phoneHasError: state.phoneHasError,
        phoneText: state.phoneText,
        passHasError: state.passHasError,
        passText: state.passText,
        confirmPassHasError: state.confirmPassHasError,
        confirmPassText: state.confirmPassText,
        buttonAllowed: false,
      ));
      return false;
    }

    _allOk();
    return true;
  }

  bool validatePhone(String value) {
    if (!isValidVenezuelaPhoneNumber(value)) {
      emit(SignUpViewData(
        nameHasError: state.nameHasError,
        nameText: state.nameText,
        emailHasError: state.emailHasError,
        emailText: state.emailText,
        phoneHasError: true,
        phoneText: value,
        passHasError: state.passHasError,
        passText: state.passText,
        confirmPassHasError: state.confirmPassHasError,
        confirmPassText: state.confirmPassText,
        buttonAllowed: false,
      ));
      return false;
    }

    if (state.nameHasError ||
        state.nameText.isEmpty ||
        state.emailHasError ||
        state.emailText.isEmpty ||
        state.passHasError ||
        state.passText.isEmpty ||
        state.confirmPassHasError ||
        state.confirmPassText.isEmpty) {
      emit(SignUpViewData(
        nameHasError: state.nameHasError,
        nameText: state.nameText,
        emailHasError: state.emailHasError,
        emailText: state.emailText,
        phoneHasError: false,
        phoneText: value,
        passHasError: state.passHasError,
        passText: state.passText,
        confirmPassHasError: state.confirmPassHasError,
        confirmPassText: state.confirmPassText,
        buttonAllowed: false,
      ));
      return false;
    }

    _allOk();
    return true;
  }

  bool validatePass(String value) {
    stamp("tag", "value: $value");
    stamp("tag", "!isValidPassword($value): ${!isValidPassword(value)}");

    if (!isValidPassword(value)) {
      emit(SignUpViewData(
        nameHasError: state.nameHasError,
        nameText: state.nameText,
        emailHasError: state.emailHasError,
        emailText: state.emailText,
        phoneHasError: state.phoneHasError,
        phoneText: state.phoneText,
        passHasError: true,
        passText: value,
        confirmPassHasError: state.confirmPassHasError,
        confirmPassText: state.confirmPassText,
        buttonAllowed: false,
      ));
      return false;
    }

    if (state.nameHasError ||
        state.nameText.isEmpty ||
        state.emailHasError ||
        state.emailText.isEmpty ||
        state.phoneHasError ||
        state.phoneText.isEmpty ||
        state.confirmPassHasError ||
        state.confirmPassText.isEmpty) {
      emit(SignUpViewData(
        nameHasError: state.nameHasError,
        nameText: state.nameText,
        emailHasError: state.emailHasError,
        emailText: state.emailText,
        phoneHasError: state.phoneHasError,
        phoneText: state.phoneText,
        passHasError: false,
        passText: value,
        confirmPassHasError: state.confirmPassHasError,
        confirmPassText: state.confirmPassText,
        buttonAllowed: false,
      ));
      return false;
    }

    _allOk();
    return true;
  }

  bool validateConfirmPass(String value) {
    if (value != state.passText) {
      emit(SignUpViewData(
        nameHasError: state.nameHasError,
        nameText: state.nameText,
        emailHasError: state.emailHasError,
        emailText: state.emailText,
        phoneHasError: state.phoneHasError,
        phoneText: state.phoneText,
        passHasError: state.passHasError,
        passText: state.passText,
        confirmPassHasError: true,
        confirmPassText: value,
        buttonAllowed: false,
      ));
      return false;
    }

    if (state.nameHasError ||
        state.nameText.isEmpty ||
        state.emailHasError ||
        state.emailText.isEmpty ||
        state.phoneHasError ||
        state.phoneText.isEmpty ||
        state.passHasError ||
        state.passText.isEmpty) {
      emit(SignUpViewData(
        nameHasError: state.nameHasError,
        nameText: state.nameText,
        emailHasError: state.emailHasError,
        emailText: state.emailText,
        phoneHasError: state.phoneHasError,
        phoneText: state.phoneText,
        passHasError: state.passHasError,
        passText: state.passText,
        confirmPassHasError: false,
        confirmPassText: value,
        buttonAllowed: false,
      ));
      return false;
    }

    _allOk();
    return true;
  }

  void _allOk() {
    emit(SignUpViewData(
      nameHasError: false,
      nameText: state.nameText,
      emailHasError: false,
      emailText: state.emailText,
      phoneHasError: false,
      phoneText: state.phoneText,
      passHasError: false,
      passText: state.passText,
      confirmPassHasError: false,
      confirmPassText: state.confirmPassText,
      buttonAllowed: true,
    ));
  }

  void reset() {
    emit(_default);
  }
}
