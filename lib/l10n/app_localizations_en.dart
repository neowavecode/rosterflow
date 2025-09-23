// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get webTitle => 'RosterFlow';

  @override
  String get inicio => 'Home';

  @override
  String get politicasPrivacidad => 'Privacy Policy';

  @override
  String get terminosCondiciones => 'Terms and Conditions';

  @override
  String get faq => 'FAQ';

  @override
  String get soporte => 'Support';

  @override
  String derechosReservados(Object year) {
    return '© $year RosterFlow. All rights reserved.';
  }
}
