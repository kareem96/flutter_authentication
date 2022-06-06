import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'strings_en.dart';
import 'strings_id.dart';
abstract class Strings{
  final String localName;
  Strings(String locale) : localName = intl.Intl.canonicalizedLocale(locale.toString());

  static Strings? of(BuildContext context){
    return Localizations.of(context, Strings);
  }
  static const LocalizationsDelegate<Strings> delegate = _StringsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
  static const List<Locale> supportLocales = <Locale>[
    Locale("en"),
    Locale("id"),
  ];


  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Choose Date'**
  String get selectDate;

  /// No description provided for @selectTime.
  ///
  /// In en, this message translates to:
  /// **'Choose Time'**
  String get selectTime;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @pleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please Wait...'**
  String get pleaseWait;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @askRegister.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an Account?'**
  String get askRegister;

  /// No description provided for @errorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Email is not valid'**
  String get errorInvalidEmail;

  /// No description provided for @errorEmptyField.
  ///
  /// In en, this message translates to:
  /// **'Can\'t be empty'**
  String get errorEmptyField;

  /// No description provided for @passwordRepeat.
  ///
  /// In en, this message translates to:
  /// **'Repeat Password'**
  String get passwordRepeat;

  /// No description provided for @errorPasswordNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Password not match'**
  String get errorPasswordNotMatch;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Theme Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Theme Dark'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'Theme System'**
  String get themeSystem;

  /// No description provided for @chooseTheme.
  ///
  /// In en, this message translates to:
  /// **'Choose Theme'**
  String get chooseTheme;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// No description provided for @errorNoData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get errorNoData;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutDesc.
  ///
  /// In en, this message translates to:
  /// **'Do you want to logout from the app?'**
  String get logoutDesc;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;
}


class _StringsDelegate extends LocalizationsDelegate<Strings>{
  const _StringsDelegate();
  @override
  bool isSupported(Locale locale) => ["en", "id"].contains(locale.languageCode);

  @override
  Future<Strings> load(Locale locale) {
    return SynchronousFuture<Strings>(lookupStrings(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Strings> old) => false;

  Strings lookupStrings(Locale locale){
    switch(locale.languageCode){
      case "en": return StringsEn();
      case "id": return StringsId();
    }
    throw FlutterError("message");
  }

}