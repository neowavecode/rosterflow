// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get webTitle => 'RosterFlow';

  @override
  String get inicio => 'Inicio';

  @override
  String get politicasPrivacidad => 'Políticas de privacidad';

  @override
  String get terminosCondiciones => 'Términos y condiciones';

  @override
  String get faq => 'FAQ';

  @override
  String get soporte => 'Soporte';

  @override
  String derechosReservados(Object year) {
    return '© $year RosterFlow. Todos los derechos reservados.';
  }
}
