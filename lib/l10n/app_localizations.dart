import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('cs'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fil'),
    Locale('fr'),
    Locale('he'),
    Locale('hi'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('ms'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('sv'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In es, this message translates to:
  /// **'RosterFlow'**
  String get appTitle;

  /// No description provided for @appName.
  ///
  /// In es, this message translates to:
  /// **'RosterFlow'**
  String get appName;

  /// No description provided for @footerText.
  ///
  /// In es, this message translates to:
  /// **'© {appName} 2025 todos los derechos reservados'**
  String footerText(Object appName);

  /// No description provided for @accessApp.
  ///
  /// In es, this message translates to:
  /// **'Acceder a la App'**
  String get accessApp;

  /// No description provided for @privacyPolicy.
  ///
  /// In es, this message translates to:
  /// **'Política de Privacidad'**
  String get privacyPolicy;

  /// No description provided for @termsAndConditions.
  ///
  /// In es, this message translates to:
  /// **'Términos y Condiciones'**
  String get termsAndConditions;

  /// No description provided for @faq.
  ///
  /// In es, this message translates to:
  /// **'Preguntas Frecuentes'**
  String get faq;

  /// No description provided for @support.
  ///
  /// In es, this message translates to:
  /// **'Soporte'**
  String get support;

  /// No description provided for @introTitle.
  ///
  /// In es, this message translates to:
  /// **'RosterFlow, Tu Centro de Control 3-en-1'**
  String get introTitle;

  /// No description provided for @introText.
  ///
  /// In es, this message translates to:
  /// **'La herramienta definitiva para tu negocio. Tanto si eres una Empresa gestionando un equipo, un Autónomo organizando sus finanzas o un Empleado revisando sus turnos, RosterFlow es tu solución.'**
  String get introText;

  /// No description provided for @downloadTitle.
  ///
  /// In es, this message translates to:
  /// **'Descarga la App'**
  String get downloadTitle;

  /// No description provided for @downloadSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Lleva RosterFlow contigo a todas partes. Disponible en iOS y Android.'**
  String get downloadSubtitle;

  /// No description provided for @feature1Title.
  ///
  /// In es, this message translates to:
  /// **'Tus Finanzas, Bajo Control'**
  String get feature1Title;

  /// No description provided for @feature1Description.
  ///
  /// In es, this message translates to:
  /// **'Obtén una radiografía financiera completa. Visualiza al instante tus ingresos, gastos y pagos pendientes, sigue tu beneficio neto mes a mes y descubre quiénes son tus mejores clientes.'**
  String get feature1Description;

  /// No description provided for @feature2Title.
  ///
  /// In es, this message translates to:
  /// **'Tu Agenda Profesional'**
  String get feature2Title;

  /// No description provided for @feature2Description.
  ///
  /// In es, this message translates to:
  /// **'Gestiona tu propio calendario empresarial totalmente personalizable. Añade, edita y consulta tus eventos para no perderte ni una reunión.'**
  String get feature2Description;

  /// No description provided for @feature3Title.
  ///
  /// In es, this message translates to:
  /// **'Clientes y Proyectos en un Vistazo'**
  String get feature3Title;

  /// No description provided for @feature3Description.
  ///
  /// In es, this message translates to:
  /// **'Organiza todos tus clientes y gestiona cada proyecto de forma individual. Vincula tareas a proyectos específicos y mantén todo tu trabajo bajo control.'**
  String get feature3Description;

  /// No description provided for @feature4Title.
  ///
  /// In es, this message translates to:
  /// **'Facturación Profesional, Simplificada'**
  String get feature4Title;

  /// No description provided for @feature4Description.
  ///
  /// In es, this message translates to:
  /// **'Crea facturas personalizadas con tus datos y los del cliente. Añade impuestos, firma con el dedo en pantalla y exporta a PDF en segundos. Soporta múltiples monedas para un negocio global.'**
  String get feature4Description;

  /// No description provided for @feature5Title.
  ///
  /// In es, this message translates to:
  /// **'Construye tu Equipo en Minutos'**
  String get feature5Title;

  /// No description provided for @feature5Description.
  ///
  /// In es, this message translates to:
  /// **'Invita a empleados o managers usando un código de invitación único. Gestiona sus vacaciones, ausencias y estado (activo/inactivo) desde un solo panel.'**
  String get feature5Description;

  /// No description provided for @feature6Title.
  ///
  /// In es, this message translates to:
  /// **'Horarios Inteligentes, Creación Rápida'**
  String get feature6Title;

  /// No description provided for @feature6Description.
  ///
  /// In es, this message translates to:
  /// **'Diseña horarios personalizados fácilmente. Clona turnos, añade usuarios y guarda plantillas para reutilizarlas. Publica, edita o despublica con total libertad.'**
  String get feature6Description;

  /// No description provided for @feature7Title.
  ///
  /// In es, this message translates to:
  /// **'Control Horario con GPS'**
  String get feature7Title;

  /// No description provided for @feature7Description.
  ///
  /// In es, this message translates to:
  /// **'Comprueba quién ha fichado y a qué hora. Accede a los detalles del turno, la descripción de tareas y la ubicación exacta del fichaje en el mapa.'**
  String get feature7Description;

  /// No description provided for @feature8Title.
  ///
  /// In es, this message translates to:
  /// **'Gestión de Solicitudes Centralizada'**
  String get feature8Title;

  /// No description provided for @feature8Description.
  ///
  /// In es, this message translates to:
  /// **'Recibe, aprueba o deniega las solicitudes de días libres y cambios de horario de tus empleados. Todo queda registrado en un historial central.'**
  String get feature8Description;

  /// No description provided for @feature9Title.
  ///
  /// In es, this message translates to:
  /// **'Comunica lo Importante'**
  String get feature9Title;

  /// No description provided for @feature9Description.
  ///
  /// In es, this message translates to:
  /// **'Crea anuncios para todos los miembros de tu organización. Mantén a tu equipo informado y comprueba al instante quién ha leído cada comunicado.'**
  String get feature9Description;

  /// No description provided for @feature10Title.
  ///
  /// In es, this message translates to:
  /// **'Chat de Equipo Integrado'**
  String get feature10Title;

  /// No description provided for @feature10Description.
  ///
  /// In es, this message translates to:
  /// **'Habla con toda tu organización en el chat grupal o inicia conversaciones privadas. Perfecto para una comunicación rápida, con soporte para imágenes y documentos.'**
  String get feature10Description;

  /// No description provided for @feature11Title.
  ///
  /// In es, this message translates to:
  /// **'El Portal del Empleado'**
  String get feature11Title;

  /// No description provided for @feature11Description.
  ///
  /// In es, this message translates to:
  /// **'Tu espacio para fichar, consultar tu calendario de turnos, gestionar tus solicitudes, leer anuncios y chatear con el equipo. Todo lo que necesitas, en tu bolsillo.'**
  String get feature11Description;

  /// No description provided for @feature12Title.
  ///
  /// In es, this message translates to:
  /// **'Exporta Registros a Excel'**
  String get feature12Title;

  /// No description provided for @feature12Description.
  ///
  /// In es, this message translates to:
  /// **'Genera informes de horas listos para tu gestoría. Filtra por fechas y exporta un archivo Excel con las horas planificadas, las horas fichadas y el balance total.'**
  String get feature12Description;

  /// No description provided for @feature13Title.
  ///
  /// In es, this message translates to:
  /// **'Una App Verdaderamente Global'**
  String get feature13Title;

  /// No description provided for @feature13Description.
  ///
  /// In es, this message translates to:
  /// **'Hecha para el mundo. RosterFlow está disponible en 30 idiomas y soporta más de 100 divisas para tu facturación y contabilidad. Tu negocio no tiene fronteras.'**
  String get feature13Description;

  /// No description provided for @pricing.
  ///
  /// In es, this message translates to:
  /// **'Precios'**
  String get pricing;

  /// No description provided for @pricingTitle.
  ///
  /// In es, this message translates to:
  /// **'Planes y Precios'**
  String get pricingTitle;

  /// No description provided for @pricingSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Elige el plan que se adapta a ti. 30 días de prueba gratis. Sin compromisos, cancela cuando quieras.'**
  String get pricingSubtitle;

  /// No description provided for @pricingFounderTitle.
  ///
  /// In es, this message translates to:
  /// **'Plan Fundador'**
  String get pricingFounderTitle;

  /// No description provided for @pricingFounderSubtitle.
  ///
  /// In es, this message translates to:
  /// **'¡Oferta limitada! (Cupo 250)'**
  String get pricingFounderSubtitle;

  /// No description provided for @pricingFounderMonthlyPrice.
  ///
  /// In es, this message translates to:
  /// **'10€'**
  String get pricingFounderMonthlyPrice;

  /// No description provided for @pricingFounderMonthlyPer.
  ///
  /// In es, this message translates to:
  /// **'/mes'**
  String get pricingFounderMonthlyPer;

  /// No description provided for @pricingFounderYearlyPrice.
  ///
  /// In es, this message translates to:
  /// **'100€'**
  String get pricingFounderYearlyPrice;

  /// No description provided for @pricingFounderYearlyPer.
  ///
  /// In es, this message translates to:
  /// **'/año'**
  String get pricingFounderYearlyPer;

  /// No description provided for @pricingFounderYearlySave.
  ///
  /// In es, this message translates to:
  /// **'¡Ahorra 20€!'**
  String get pricingFounderYearlySave;

  /// No description provided for @pricingFounderFeature1.
  ///
  /// In es, this message translates to:
  /// **'Hasta 20 empleados'**
  String get pricingFounderFeature1;

  /// No description provided for @pricingFounderFeature2.
  ///
  /// In es, this message translates to:
  /// **'Gestión de equipo y horarios'**
  String get pricingFounderFeature2;

  /// No description provided for @pricingFounderFeature3.
  ///
  /// In es, this message translates to:
  /// **'Fichaje con GPS y control horario'**
  String get pricingFounderFeature3;

  /// No description provided for @pricingFounderFeature4.
  ///
  /// In es, this message translates to:
  /// **'Chat, Anuncios y Solicitudes'**
  String get pricingFounderFeature4;

  /// No description provided for @pricingFounderFeature5.
  ///
  /// In es, this message translates to:
  /// **'Exportar registros a Excel'**
  String get pricingFounderFeature5;

  /// No description provided for @pricingFounderButton.
  ///
  /// In es, this message translates to:
  /// **'Empezar Prueba Gratis'**
  String get pricingFounderButton;

  /// No description provided for @pricingProfessionalTitle.
  ///
  /// In es, this message translates to:
  /// **'Plan Profesional'**
  String get pricingProfessionalTitle;

  /// No description provided for @pricingProfessionalSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Escala a tu ritmo'**
  String get pricingProfessionalSubtitle;

  /// No description provided for @pricingProfessionalPrice.
  ///
  /// In es, this message translates to:
  /// **'2€'**
  String get pricingProfessionalPrice;

  /// No description provided for @pricingProfessionalPer.
  ///
  /// In es, this message translates to:
  /// **'/mes por usuario'**
  String get pricingProfessionalPer;

  /// No description provided for @pricingProfessionalFeature1.
  ///
  /// In es, this message translates to:
  /// **'Sin límite de empleados'**
  String get pricingProfessionalFeature1;

  /// No description provided for @pricingProfessionalFeature2.
  ///
  /// In es, this message translates to:
  /// **'Gestión de equipo y horarios'**
  String get pricingProfessionalFeature2;

  /// No description provided for @pricingProfessionalFeature3.
  ///
  /// In es, this message translates to:
  /// **'Fichaje con GPS y control horario'**
  String get pricingProfessionalFeature3;

  /// No description provided for @pricingProfessionalFeature4.
  ///
  /// In es, this message translates to:
  /// **'Chat, Anuncios y Solicitudes'**
  String get pricingProfessionalFeature4;

  /// No description provided for @pricingProfessionalFeature5.
  ///
  /// In es, this message translates to:
  /// **'Exportar registros a Excel'**
  String get pricingProfessionalFeature5;

  /// No description provided for @pricingProfessionalButton.
  ///
  /// In es, this message translates to:
  /// **'Empezar Prueba Gratis'**
  String get pricingProfessionalButton;

  /// No description provided for @pricingIndependentTitle.
  ///
  /// In es, this message translates to:
  /// **'Independiente'**
  String get pricingIndependentTitle;

  /// No description provided for @pricingIndependentSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Para el profesional \'Solo\''**
  String get pricingIndependentSubtitle;

  /// No description provided for @pricingIndependentPrice.
  ///
  /// In es, this message translates to:
  /// **'Gratis'**
  String get pricingIndependentPrice;

  /// No description provided for @pricingIndependentPer.
  ///
  /// In es, this message translates to:
  /// **'(con anuncios)'**
  String get pricingIndependentPer;

  /// No description provided for @pricingIndependentFeature1.
  ///
  /// In es, this message translates to:
  /// **'Gestión Financiera'**
  String get pricingIndependentFeature1;

  /// No description provided for @pricingIndependentFeature2.
  ///
  /// In es, this message translates to:
  /// **'Gestión de clientes y proyectos'**
  String get pricingIndependentFeature2;

  /// No description provided for @pricingIndependentFeature3.
  ///
  /// In es, this message translates to:
  /// **'Facturación en PDF'**
  String get pricingIndependentFeature3;

  /// No description provided for @pricingIndependentFeature4.
  ///
  /// In es, this message translates to:
  /// **'Calendario personalizado'**
  String get pricingIndependentFeature4;

  /// No description provided for @pricingIndependentFeature5.
  ///
  /// In es, this message translates to:
  /// **'Control de gastos y más'**
  String get pricingIndependentFeature5;

  /// No description provided for @pricingIndependentButton.
  ///
  /// In es, this message translates to:
  /// **'Empezar Gratis'**
  String get pricingIndependentButton;

  /// No description provided for @sectionTitleIndependent.
  ///
  /// In es, this message translates to:
  /// **'Para el Profesional Independiente'**
  String get sectionTitleIndependent;

  /// No description provided for @sectionTitleManager.
  ///
  /// In es, this message translates to:
  /// **'Para el Gestor de Equipos'**
  String get sectionTitleManager;

  /// No description provided for @sectionTitleEmployee.
  ///
  /// In es, this message translates to:
  /// **'Para el Empleado'**
  String get sectionTitleEmployee;

  /// No description provided for @sectionTitleGlobal.
  ///
  /// In es, this message translates to:
  /// **'Potencia Global'**
  String get sectionTitleGlobal;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'cs',
    'de',
    'el',
    'en',
    'es',
    'fa',
    'fil',
    'fr',
    'he',
    'hi',
    'hu',
    'id',
    'it',
    'ja',
    'ko',
    'ms',
    'nl',
    'pl',
    'pt',
    'ro',
    'ru',
    'sv',
    'th',
    'tr',
    'uk',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fil':
      return AppLocalizationsFil();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'ms':
      return AppLocalizationsMs();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sv':
      return AppLocalizationsSv();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
