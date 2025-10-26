// lib/localization_provider.dart

import 'package:flutter/material.dart';

class LocalizationProvider with ChangeNotifier {
  // El idioma por defecto será 'en' (inglés)
  Locale _locale = const Locale('en', '');

  Locale get locale => _locale;

  // Mapa de idiomas soportados (Nombre para mostrar, Código)
  // ¡Aquí añadirás tus 30 idiomas!
 final Map<String, String> _supportedLanguages = {
    'English': 'en',
    'Español': 'es',
    'Chinese (Simplified)': 'zh',
    'Hindi': 'hi',
    'Portuguese': 'pt',
    'German': 'de',
    'French': 'fr',
    'Japanese': 'ja',
    'Russian': 'ru',
    'Arabic': 'ar',
    'Korean': 'ko',
    'Indonesian': 'id',
    'Italian': 'it',
    'Turkish': 'tr',
    'Dutch': 'nl',
    'Bengali': 'bn',
    'Urdu': 'ur',
    'Vietnamese': 'vi',
    'Thai': 'th',
    'Polish': 'pl',
    'Ukrainian': 'uk',
    'Romanian': 'ro',
    'Swedish': 'sv',
    'Greek': 'el',
    'Czech': 'cs',
    'Hungarian': 'hu',
    'Filipino': 'fil',
    'Malay': 'ms',
    'Persian': 'fa',
    'Hebrew': 'he',
  };

  // Método para obtener la lista de Locales que soporta la app
  List<Locale> get supportedLocales {
    return _supportedLanguages.values.map((code) => Locale(code, '')).toList();
  }

  // Método para obtener los nombres de los idiomas para el menú
  List<String> get supportedLanguageNames {
    return _supportedLanguages.keys.toList();
  }

  // Método para cambiar el idioma
  void setLocale(String languageName) {
    final String? languageCode = _supportedLanguages[languageName];
    if (languageCode != null) {
      _locale = Locale(languageCode, '');
      // Notifica a la app que el idioma ha cambiado para que se reconstruya
      notifyListeners();
    }
  }

  // Método para obtener el nombre actual (para el Dropdown)
  String get currentLanguageName {
    return _supportedLanguages.entries
        .firstWhere((entry) => entry.value == _locale.languageCode,
            orElse: () => _supportedLanguages.entries.first)
        .key;
  }
}