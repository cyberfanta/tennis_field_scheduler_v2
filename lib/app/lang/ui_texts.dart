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

  String get reserve {
    if (_locale.languageCode == 'es') {
      return UiTextEs().reserve;
    }

    return UiTextEn().reserve;
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

  String get goSignUp3 {
    if (_locale.languageCode == 'es') {
      return UiTextEs().goSignUp3;
    }

    return UiTextEn().goSignUp;
  }

  String get hintName {
    if (_locale.languageCode == 'es') {
      return UiTextEs().hintName;
    }

    return UiTextEn().hintName;
  }

  String get nameError {
    if (_locale.languageCode == 'es') {
      return UiTextEs().nameError;
    }

    return UiTextEn().nameError;
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

  String get emailError {
    if (_locale.languageCode == 'es') {
      return UiTextEs().emailError;
    }

    return UiTextEn().emailError;
  }

  String get pass {
    if (_locale.languageCode == 'es') {
      return UiTextEs().pass;
    }

    return UiTextEn().pass;
  }

  String get confirmPass {
    if (_locale.languageCode == 'es') {
      return UiTextEs().confirmPass;
    }

    return UiTextEn().confirmPass;
  }

  String get hintPass {
    if (_locale.languageCode == 'es') {
      return UiTextEs().hintPass;
    }

    return UiTextEn().hintPass;
  }

  String get passError1 {
    if (_locale.languageCode == 'es') {
      return UiTextEs().passError1;
    }

    return UiTextEn().passError1;
  }

  String get passError2 {
    if (_locale.languageCode == 'es') {
      return UiTextEs().passError2;
    }

    return UiTextEn().passError2;
  }

  String get confirmPassError {
    if (_locale.languageCode == 'es') {
      return UiTextEs().confirmPassError;
    }

    return UiTextEn().confirmPassError;
  }

  String get hintPhone {
    if (_locale.languageCode == 'es') {
      return UiTextEs().hintPhone;
    }

    return UiTextEn().hintPhone;
  }

  String get phoneError {
    if (_locale.languageCode == 'es') {
      return UiTextEs().phoneError;
    }

    return UiTextEn().phoneError;
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

  String get youHaveAccount {
    if (_locale.languageCode == 'es') {
      return UiTextEs().youHaveAccount;
    }

    return UiTextEn().youHaveAccount;
  }

  String get warning {
    if (_locale.languageCode == 'es') {
      return UiTextEs().warning;
    }

    return UiTextEn().warning;
  }

  String get info {
    if (_locale.languageCode == 'es') {
      return UiTextEs().info;
    }

    return UiTextEn().info;
  }

  String get closeAppContext {
    if (_locale.languageCode == 'es') {
      return UiTextEs().closeAppContext;
    }

    return UiTextEn().closeAppContext;
  }

  String get yes {
    if (_locale.languageCode == 'es') {
      return UiTextEs().yes;
    }

    return UiTextEn().yes;
  }

  String get no {
    if (_locale.languageCode == 'es') {
      return UiTextEs().no;
    }

    return UiTextEn().no;
  }

  String get notImplementedContext {
    if (_locale.languageCode == 'es') {
      return UiTextEs().notImplementedContext;
    }

    return UiTextEn().notImplementedContext;
  }

  String get ok {
    return UiTextEn().ok;
  }

  String get nameEmpty {
    if (_locale.languageCode == 'es') {
      return UiTextEs().nameEmpty;
    }

    return UiTextEn().nameEmpty;
  }

  String get emailEmpty {
    if (_locale.languageCode == 'es') {
      return UiTextEs().emailEmpty;
    }

    return UiTextEn().emailEmpty;
  }

  String get phoneEmpty {
    if (_locale.languageCode == 'es') {
      return UiTextEs().phoneEmpty;
    }

    return UiTextEn().phoneEmpty;
  }

  String get passEmpty {
    if (_locale.languageCode == 'es') {
      return UiTextEs().passEmpty;
    }

    return UiTextEn().passEmpty;
  }

  String get noData {
    if (_locale.languageCode == 'es') {
      return UiTextEs().noData;
    }

    return UiTextEn().noData;
  }

  String get wrongCredential {
    if (_locale.languageCode == 'es') {
      return UiTextEs().wrongCredential;
    }

    return UiTextEn().wrongCredential;
  }

  String get fields {
    if (_locale.languageCode == 'es') {
      return UiTextEs().fields;
    }

    return UiTextEn().fields;
  }

  String get hello {
    if (_locale.languageCode == 'es') {
      return UiTextEs().hello;
    }

    return UiTextEn().hello;
  }

  String get scheduledReserves {
    if (_locale.languageCode == 'es') {
      return UiTextEs().scheduledReserves;
    }

    return UiTextEn().scheduledReserves;
  }

  String get scheduleReserve {
    if (_locale.languageCode == 'es') {
      return UiTextEs().scheduleReserve;
    }

    return UiTextEn().scheduleReserve;
  }

  String get myReserves {
    if (_locale.languageCode == 'es') {
      return UiTextEs().myReserves;
    }

    return UiTextEn().myReserves;
  }

  String get myFavorites {
    if (_locale.languageCode == 'es') {
      return UiTextEs().myFavorites;
    }

    return UiTextEn().myFavorites;
  }

  String get fieldA {
    if (_locale.languageCode == 'es') {
      return UiTextEs().fieldA;
    }

    return UiTextEn().fieldA;
  }

  String get fieldB {
    if (_locale.languageCode == 'es') {
      return UiTextEs().fieldB;
    }

    return UiTextEn().fieldB;
  }

  String get fieldC {
    if (_locale.languageCode == 'es') {
      return UiTextEs().fieldC;
    }

    return UiTextEn().fieldC;
  }

  String get available {
    if (_locale.languageCode == 'es') {
      return UiTextEs().available;
    }

    return UiTextEn().available;
  }

  String get notAvailable {
    if (_locale.languageCode == 'es') {
      return UiTextEs().notAvailable;
    }

    return UiTextEn().notAvailable;
  }

  String get perHour {
    if (_locale.languageCode == 'es') {
      return UiTextEs().perHour;
    }

    return UiTextEn().perHour;
  }

  String get addTeacher {
    if (_locale.languageCode == 'es') {
      return UiTextEs().addTeacher;
    }

    return UiTextEn().addTeacher;
  }

  String get dateTime {
    if (_locale.languageCode == 'es') {
      return UiTextEs().dateTime;
    }

    return UiTextEn().dateTime;
  }

  String get date {
    if (_locale.languageCode == 'es') {
      return UiTextEs().date;
    }

    return UiTextEn().date;
  }

  String get initHour {
    if (_locale.languageCode == 'es') {
      return UiTextEs().initHour;
    }

    return UiTextEn().initHour;
  }

  String get endHour {
    if (_locale.languageCode == 'es') {
      return UiTextEs().endHour;
    }

    return UiTextEn().endHour;
  }

  String get addComment {
    if (_locale.languageCode == 'es') {
      return UiTextEs().addComment;
    }

    return UiTextEn().addComment;
  }
}
