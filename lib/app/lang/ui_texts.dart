import 'package:flutter/material.dart';
import 'package:tennis_field_scheduler_v2/app/lang/ui_text_en.dart';
import 'package:tennis_field_scheduler_v2/app/lang/ui_text_es.dart';

class UiTexts extends ChangeNotifier {
  UiTexts(this._locale);

  Locale _locale;

  set locale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  String get title {
    if (_locale.languageCode == 'es') {
      return UiTextEs().title;
    }

    return UiTextEn().title;
  }

  String get tennis {
    return UiTextEn().tennis;
  }

  String get court {
    return UiTextEn().court;
  }

  String get begin {
    if (_locale.languageCode == 'es') {
      return UiTextEs().begin;
    }

    return UiTextEn().begin;
  }

  String get reservations {
    if (_locale.languageCode == 'es') {
      return UiTextEs().reservations;
    }

    return UiTextEn().reservations;
  }

  String get favorites {
    if (_locale.languageCode == 'es') {
      return UiTextEs().favorites;
    }

    return UiTextEn().favorites;
  }

  String get goLogin {
    if (_locale.languageCode == 'es') {
      return UiTextEs().goLogin;
    }

    return UiTextEn().goLogin;
  }

  String get goSignUp {
    if (_locale.languageCode == 'es') {
      return UiTextEs().goSignUp;
    }

    return UiTextEn().goSignUp;
  }

  String get goSignUp2 {
    if (_locale.languageCode == 'es') {
      return UiTextEs().goSignUp2;
    }

    return UiTextEn().goSignUp;
  }

  String get email {
    if (_locale.languageCode == 'es') {
      return UiTextEs().email;
    }

    return UiTextEn().email;
  }

  String get hintEmail {
    if (_locale.languageCode == 'es') {
      return UiTextEs().hintEmail;
    }

    return UiTextEn().hintEmail;
  }

  String get pass {
    if (_locale.languageCode == 'es') {
      return UiTextEs().pass;
    }

    return UiTextEn().pass;
  }

  String get hintPass {
    if (_locale.languageCode == 'es') {
      return UiTextEs().hintPass;
    }

    return UiTextEn().hintPass;
  }

  String get rememberPass {
    if (_locale.languageCode == 'es') {
      return UiTextEs().rememberPass;
    }

    return UiTextEn().rememberPass;
  }

  String get forgotYourPass {
    if (_locale.languageCode == 'es') {
      return UiTextEs().forgotYourPass;
    }

    return UiTextEn().forgotYourPass;
  }

  String get stillNotAccount {
    if (_locale.languageCode == 'es') {
      return UiTextEs().stillNotAccount;
    }

    return UiTextEn().stillNotAccount;
  }
}
