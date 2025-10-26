// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rosterflowweb/l10n/app_localizations.dart';
import 'package:rosterflowweb/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rosterflowweb/localization_provider.dart';

void main() {
  runApp(
    // Envolvemos la app con el ChangeNotifierProvider
    ChangeNotifierProvider(
      create: (context) => LocalizationProvider(),
      child: const RosterFlowApp(),
    ),
  );
}

class RosterFlowApp extends StatelessWidget {
  const RosterFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos el color de fondo claro
    final Color backgroundColor = Color(0xFFF4F6F8);

    // --- INICIO DE LA CORRECCIÓN ---
    // Esta es la línea que faltaba. Coge el provider del contexto.
    final localizationProvider = Provider.of<LocalizationProvider>(context);
    // --- FIN DE LA CORRECCIÓN ---

   return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,

      // --- INICIO DE LOS CAMBIOS ---

      // 1. Usamos el idioma del Provider
      locale: localizationProvider.locale, // <-- Ahora 'localizationProvider' sí existe

      // 2. Usamos la lista de idiomas del Provider
      supportedLocales: localizationProvider.supportedLocales, // <-- Y aquí también
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // Tema de la aplicación
      theme: ThemeData(
    // 1. APLICAMOS LA FUENTE GLOBALMENTE
    // Esto aplica Open Sans a todos los textos (headlines, body, etc.)
    textTheme: GoogleFonts.openSansTextTheme(
      Theme.of(context).textTheme,
    ).apply( // Aseguramos que los colores base sean correctos
      bodyColor: Colors.black87,
      displayColor: Colors.black,
    ),

    // 2. ELIMINAMOS LA FUENTE 'Inter' DE AQUÍ
    scaffoldBackgroundColor: backgroundColor, 

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white, 
      iconTheme: const IconThemeData(color: Colors.black), 
      systemOverlayStyle: SystemUiOverlayStyle.dark, 
      // 3. Aplicamos la fuente específica al título del AppBar
      titleTextStyle: GoogleFonts.openSans( 
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      elevation: 1, 
    ),

    cardTheme: CardThemeData(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        // 4. Aplicamos la fuente a los botones
        textStyle: GoogleFonts.openSans( 
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ),
      home: const HomePage(),
    );
  }
}