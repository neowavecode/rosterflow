import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rosterflowweb/l10n/app_localizations.dart';
import 'package:rosterflowweb/document_screen.dart';
import 'package:rosterflowweb/support_screen.dart';

void main() {
  runApp(const RosterFlowWebApp());
}

class RosterFlowWebApp extends StatelessWidget {
  const RosterFlowWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.webTitle,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', ''),
        Locale('en', ''),
      ],
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Colors.white),
            onPressed: () {
              // Lógica para cambiar de idioma
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'RosterFlow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(l10n.inicio),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.policy),
              title: Text(l10n.politicasPrivacidad),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DocumentScreen(
                    title: l10n.politicasPrivacidad,
                    htmlPath: 'html/privacy_policy.html',
                  )),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: Text(l10n.terminosCondiciones),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DocumentScreen(
                    title: l10n.terminosCondiciones,
                    htmlPath: 'html/terms_and_conditions.html',
                  )),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: Text(l10n.faq),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DocumentScreen(
                    title: l10n.faq,
                    htmlPath: 'html/faq.html',
                  )),
                );
              },
            ),
            
           ListTile(
  leading: const Icon(Icons.support_agent),
  title: Text(l10n.soporte),
  onTap: () {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SupportScreen()),
    );
  },
),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Fondo de la web: imagen
          Positioned.fill(
            child: Image.asset(
              'assets/images/webconstruccion.png',
              fit: BoxFit.cover,
            ),
          ),
          // Contenido principal de la web
          Center(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // El esqueleto de la web
                      
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      l10n.derechosReservados(DateTime.now().year.toString()),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}