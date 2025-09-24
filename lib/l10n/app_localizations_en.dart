// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'RosterFlow';

  @override
  String get appName => 'RosterFlow';

  @override
  String get home => 'Home';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsAndConditions => 'Terms and Conditions';

  @override
  String get faq => 'FAQ';

  @override
  String get support => 'Support';

  @override
  String get underConstruction => 'WEBSITE UNDER CONSTRUCTION';

  @override
  String footerText(Object appName) {
    return '© $appName 2025 all rights reserved';
  }
}
