// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Swift as \nThought`
  String get swiftAsThought {
    return Intl.message(
      'Swift as \nThought',
      name: 'swiftAsThought',
      desc: '',
      args: [],
    );
  }

  /// `Experience the next generation of logistics. Fast, secure, and effortlessly simple delivery at your fingertips.`
  String get onboardingDescription {
    return Intl.message(
      'Experience the next generation of logistics. Fast, secure, and effortlessly simple delivery at your fingertips.',
      name: 'onboardingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Experience Speed.`
  String get experienceSpeed {
    return Intl.message(
      'Experience Speed.',
      name: 'experienceSpeed',
      desc: '',
      args: [],
    );
  }

  /// `Join the fastest delivery network in the city. Enter your phone number to get started.`
  String get joinFastestNetwork {
    return Intl.message(
      'Join the fastest delivery network in the city. Enter your phone number to get started.',
      name: 'joinFastestNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Please enter your phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number (must be at least 10 digits)`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid phone number (must be at least 10 digits)',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `By proceeding, you agree to our`
  String get byProceeding {
    return Intl.message(
      'By proceeding, you agree to our',
      name: 'byProceeding',
      desc: '',
      args: [],
    );
  }

  /// ` Terms of Service`
  String get termsOfService {
    return Intl.message(
      ' Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// ` and`
  String get and {
    return Intl.message(' and', name: 'and', desc: '', args: []);
  }

  /// ` Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      ' Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get sendCode {
    return Intl.message('Send Code', name: 'sendCode', desc: '', args: []);
  }

  /// `OTP Verification`
  String get otpVerification {
    return Intl.message(
      'OTP Verification',
      name: 'otpVerification',
      desc: '',
      args: [],
    );
  }

  /// `We've sent a 6-digit verification code to your registered mobile number.`
  String get otpDescription {
    return Intl.message(
      'We\'ve sent a 6-digit verification code to your registered mobile number.',
      name: 'otpDescription',
      desc: '',
      args: [],
    );
  }

  /// `Phone number verified successfully!`
  String get phoneVerifiedSuccess {
    return Intl.message(
      'Phone number verified successfully!',
      name: 'phoneVerifiedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Please enter the full 6-digit code`
  String get enterFullCode {
    return Intl.message(
      'Please enter the full 6-digit code',
      name: 'enterFullCode',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get noResultsFound {
    return Intl.message(
      'No results found',
      name: 'noResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Search location`
  String get searchLocation {
    return Intl.message(
      'Search location',
      name: 'searchLocation',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `ROUTE INFO`
  String get routeInfo {
    return Intl.message('ROUTE INFO', name: 'routeInfo', desc: '', args: []);
  }

  /// `Distance`
  String get distance {
    return Intl.message('Distance', name: 'distance', desc: '', args: []);
  }

  /// `Expected Time`
  String get expectedTime {
    return Intl.message(
      'Expected Time',
      name: 'expectedTime',
      desc: '',
      args: [],
    );
  }

  /// `km`
  String get km {
    return Intl.message('km', name: 'km', desc: '', args: []);
  }

  /// `mins`
  String get mins {
    return Intl.message('mins', name: 'mins', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
