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
  // Ya no necesitamos 'async' ni 'ensureInitialized' si solo ejecutamos runApp
  runApp(
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
      // Tema de la aplicación
      theme: ThemeData(
        
        // --- 1. DEFINIMOS EL NUEVO COLOR "CEMENTO" CLARO ---
        scaffoldBackgroundColor: const Color(0xFFEAEAEA), // Este es tu nuevo gris cemento

        // Mantenemos tu fuente Open Sans
        textTheme: GoogleFonts.balsamiqSansTextTheme(
          Theme.of(context).textTheme,
        ).apply( 
          bodyColor: Colors.black87,
          displayColor: Colors.black,
        ),

        appBarTheme: AppBarTheme(
          // --- 2. EL APPBAR USA EL MISMO COLOR ---
          backgroundColor: const Color(0xFFEAEAEA), 
          iconTheme: const IconThemeData(color: Colors.black), 
          systemOverlayStyle: SystemUiOverlayStyle.dark, 
          titleTextStyle: GoogleFonts.balsamiqSans( 
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          // --- 3. SIN SOMBRA, PARA QUE SE FUNDA CON EL FONDO ---
          elevation: 0, 
        ),

        // 4. LAS TARJETAS (BLANCAS) AHORA RESALTARÁN MUCHO MÁS
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
            textStyle: GoogleFonts.balsamiqSans( 
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
  home: const HomePage(), // <-- ASEGÚRATE DE QUE ESTA LÍNEA ESTÉ DESCOMENTADA
  ); // Cierre del MaterialApp
}
}