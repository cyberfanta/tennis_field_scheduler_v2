import 'package:bloc/bloc.dart';

import '../../../utils/validators.dart';

class LoginViewData {
  final bool emailHasError;
  final String emailText;
  final bool passHasError;
  final String passText;
  final bool rememberPass;
  final bool buttonAllowed;

  LoginViewData({
    required this.emailHasError,
    required this.emailText,
    required this.passHasError,
    required this.passText,
    required this.rememberPass,
    required this.buttonAllowed,
  });

  @override
  String toString() {
    return "LoginViewData ("
        "emailHasError: $emailHasError,"
        " emailText: \"$emailText\","
        " passHasError: $passHasError,"
        " passText: \"$passText\","
        " rememberPass: $rememberPass,"
        " buttonAllowed: $buttonAllowed"
        ")";
  }
}

LoginViewData _default = LoginViewData(
  emailHasError: false,
  emailText: "",
  passHasError: false,
  passText: "",
  rememberPass: false,
  buttonAllowed: false,
);

class LoginViewCubit extends Cubit<LoginViewData> {
  LoginViewCubit() : super(_default);

  void setEmail(String value){
    emit(LoginViewData(
      emailHasError: false,
      emailText: value,
      passHasError: state.passHasError,
      passText: state.passText,
      rememberPass: false,
      buttonAllowed: false,
    ));
  }

  void setPass(String value){
    emit(LoginViewData(
      emailHasError: state.emailHasError,
      emailText: state.emailText,
      passHasError: false,
      passText: value,
      rememberPass: true,
      buttonAllowed: true,
    ));
  }

  void removePass(){
    emit(LoginViewData(
      emailHasError: state.emailHasError,
      emailText: state.emailText,
      passHasError: false,
      passText: "",
      rememberPass: false,
      buttonAllowed: false,
    ));
  }

  bool validateEmail(String value) {
    if (!isValidEmail(value)) {
      emit(LoginViewData(
        emailHasError: true,
        emailText: value,
        passHasError: state.passHasError,
        passText: state.passText,
        rememberPass: state.rememberPass,
        buttonAllowed: false,
      ));
      return false;
    }

    if (state.passHasError || state.passText.isEmpty) {
      emit(LoginViewData(
        emailHasError: false,
        emailText: value,
        passHasError: state.passHasError,
        passText: state.passText,
        rememberPass: state.rememberPass,
        buttonAllowed: false,
      ));
      return false;
    }

    _allOk();
    return true;
  }

  bool validatePass(String value) {
    if (value.length < 3) {
      emit(LoginViewData(
        emailHasError: state.emailHasError,
        emailText: state.emailText,
        passHasError: true,
        passText: value,
        rememberPass: state.rememberPass,
        buttonAllowed: false,
      ));
      return false;
    }

    if (state.emailHasError || state.emailText.isEmpty) {
      emit(LoginViewData(
        emailHasError: state.emailHasError,
        emailText: state.emailText,
        passHasError: false,
        passText: value,
        rememberPass: state.rememberPass,
        buttonAllowed: false,
      ));
      return false;
    }

    _allOk();
    return true;
  }

  void _allOk() {
    emit(LoginViewData(
      emailHasError: false,
      emailText: state.emailText,
      passHasError: false,
      passText: state.passText,
      rememberPass: state.rememberPass,
      buttonAllowed: true,
    ));
  }

  void toggleRememberPass() {
    emit(LoginViewData(
      emailHasError: state.emailHasError,
      emailText: state.emailText,
      passHasError: state.passHasError,
      passText: state.passText,
      rememberPass: !state.rememberPass,
      buttonAllowed: state.buttonAllowed,
    ));
  }

  bool getRememberPass() {
    return state.rememberPass;
  }

  void reset() {
    emit(_default);
  }
}
