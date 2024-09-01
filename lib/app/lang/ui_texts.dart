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
}
