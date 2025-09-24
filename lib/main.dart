import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rosterflowweb/l10n/app_localizations.dart';
import 'dart:html' as html;

void main() {
  runApp(const RosterFlowApp());
}

class RosterFlowApp extends StatelessWidget {
  const RosterFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título de la aplicación en el navegador
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      // Configuración de la internacionalización
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      // Tema de la aplicación
      theme: ThemeData(
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _navigateTo(String route) {
    // Redirige al navegador a la URL estática
    html.window.location.href = route;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.appTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                l10n.appName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(l10n.home),
              onTap: () {
                Navigator.pop(context);
                _navigateTo('index.html');
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: Text(l10n.privacyPolicy),
              onTap: () {
                Navigator.pop(context);
                _navigateTo('privacy_policy.html');
              },
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: Text(l10n.termsAndConditions),
              onTap: () {
                Navigator.pop(context);
                _navigateTo('terms_and_conditions.html');
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: Text(l10n.faq),
              onTap: () {
                Navigator.pop(context);
                _navigateTo('faq.html');
              },
            ),
            ListTile(
              leading: const Icon(Icons.support),
              title: Text(l10n.support),
              onTap: () {
                Navigator.pop(context);
                _navigateTo('support.html');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Imagen de fondo en pantalla completa
          Positioned.fill(
            child: Image.network(
              'web1.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Mensaje de error si la imagen no se carga
                return const Center(
                  child: Text(
                    'Error al cargar la imagen de fondo.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
          // Contenido del home centrado
          
          // Footer
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.black.withOpacity(0.8),
              width: double.infinity,
              child: Text(
                l10n.footerText('RosterFlow'),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
