// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rosterflowweb/l10n/app_localizations.dart';
import 'package:rosterflowweb/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rosterflowweb/localization_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rosterflowweb/screens/web/activation_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Necesario para Supabase

  await Supabase.initialize(
    url: 'https://yssonpnesxtkmzganklq.supabase.co', // La URL de tu proyecto Supabase
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlzc29ucG5lc3h0a216Z2Fua2xxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc1ODQ3NDAsImV4cCI6MjA3MzE2MDc0MH0.yBjnQNLX13BGg5I5UY8Gd2Kgl6OgKvovuCAaOmTtQQc', // La clave anónima de tu proyecto
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => LocalizationProvider(),
      child: const RosterFlowApp(),
    ),
  );
}

// --- DEFINE LA VARIABLE GLOBALMENTE ---
// (O usa un método mejor como get_it si prefieres)
final supabase = Supabase.instance.client;

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
  onGenerateRoute: (settings) {
        // Comprobamos si la ruta es '/activate-subscription'
        if (settings.name == '/activate-subscription') {
          // Extraemos los parámetros de la URL (el token)
          final Uri uri = Uri.parse(settings.name!);
          final String? token = uri.queryParameters['token'];

          // Devolvemos la ruta a ActivationScreen, pasándole el token
          return MaterialPageRoute(
            builder: (context) => ActivationScreen(token: token),
          );
        }

        // Para cualquier otra ruta no definida, mostramos la HomePage
        // (Esto actúa como tu ruta por defecto o home)
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      },
      // Ya no necesitamos la propiedad 'home' si usamos onGenerateRoute
      // home: const HomePage(),
      // --- FIN DE LA LÓGICA DE RUTAS ---
    );
  }
}