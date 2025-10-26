// lib/home_page.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rosterflowweb/l10n/app_localizations.dart';
import 'dart:html' as html;
// Importamos los nuevos widgets
import 'package:rosterflowweb/widgets/feature_section.dart';
import 'package:rosterflowweb/widgets/image_slider.dart'; // <-- Nuestro nuevo slider
import 'package:google_fonts/google_fonts.dart';
import 'package:rosterflowweb/pricing_screen.dart'; // <-- El nuevo archivo
import 'package:provider/provider.dart';
import 'package:rosterflowweb/localization_provider.dart';
// ... tus otros imports
import 'package:rosterflowweb/widgets/youtube_presenter.dart'; // <-- AÑADE ESTA


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _navigateTo(String route) {
    // Redirige al navegador a la URL estática (Términos, FAQ, etc.)
    html.window.location.href = route;
  }

  void _navigateToApp() {
    // Redirige al subdominio de la app web
    html.window.location.href = 'https://app.rosterflowapp.com';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
    title: Text(l10n.appTitle),
    actions: [
      // --- INICIO DE LA ACTUALIZACIÓN ---
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        // Usamos un Consumer para escuchar los cambios del provider
        child: Consumer<LocalizationProvider>(
          builder: (context, provider, child) {
            return DropdownButton<String>(
              value: provider.currentLanguageName, // El idioma actual
              icon: const Icon(Icons.language),
              underline: Container(),
              // Generamos la lista de idiomas desde el Provider
              items: provider.supportedLanguageNames.map((String languageName) {
                return DropdownMenuItem<String>(
                  value: languageName,
                  child: Text(languageName),
                );
              }).toList(),
              // Al cambiar, llamamos al método del Provider
              onChanged: (String? newLanguageName) {
                if (newLanguageName != null) {
                  provider.setLocale(newLanguageName);
                }
              },
            );
          },
        ),
      ),
      // --- FIN DE LA ACTUALIZACIÓN ---
    ],
  ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Text(
                l10n.appName,
                style: const TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.login, color: Colors.blue),
              title: Text(
                l10n.accessApp,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              onTap: _navigateToApp,
            ),

            // --- INICIO DEL NUEVO BOTÓN ---
            ListTile(
              leading: const Icon(Icons.price_change_outlined, color: Colors.blue),
              title: Text(
                l10n.pricing,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                // Navegación interna de Flutter (no recarga la web)
                Navigator.pop(context); // Cierra el drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PricingScreen()),
                );
              },
            ),
            // --- FIN DEL NUEVO BOTÓN ---
            const Divider(),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: Text(l10n.privacyPolicy),
              onTap: () => _navigateTo('privacy_policy.html'),
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: Text(l10n.termsAndConditions),
              onTap: () => _navigateTo('terms_and_conditions.html'),
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: Text(l10n.faq),
              onTap: () => _navigateTo('faq.html'),
            ),
            ListTile(
              leading: const Icon(Icons.support),
              title: Text(l10n.support),
              onTap: () => _navigateTo('support.html'),
            ),
          ],
        ),
      ),
      // --- EL "WALL" SCROLLABLE ---
      // --- EL "WALL" SCROLLABLE ---
     // --- EL "WALL" SCROLLABLE ---
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            // --- INICIO DEL NUEVO CONTENEDOR DE CABECERA ---
            // --- INICIO DEL NUEVO CONTENEDOR DE CABECERA ---
        Container(
          color: Colors.white, // <-- ¡El nuevo fondo blanco!
          child: Column(
            children: [

              // --- SECCIÓN 2: TEXTO DE INTRODUCCIÓN (VA PRIMERO) ---
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 64, bottom: 48, left: 24, right: 24), 
                child: ConstrainedBox(
                  // ... (Tu ConstrainedBox con el Logo y el Texto de Intro) ...
                  // ... (Esto no cambia) ...
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, 
                    children: [
                      // --- Logo + Título ---
                      Row(
                        mainAxisSize: MainAxisSize.min, 
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logotipo.png',
                            height: 50, 
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error_outline, color: Colors.red, size: 40);
                            },
                          ),
                          const SizedBox(width: 16),
                          Text(
                            l10n.introTitle,
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // --- Texto de Introducción ---
                      Text(
                        l10n.introText,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // --- ¡NUEVO! SECCIÓN DE VÍDEO YOUTUBE ---
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: YoutubePresenter(
                  // CAMBIA ESTA ID por la de tu vídeo
                  videoId: 'NcI4c4nb1V4', 
                ),
              ),
              // --- FIN DE LA SECCIÓN DE VÍDEO ---


              // --- SECCIÓN 1: SLIDER (AHORA VA TERCERO) ---
              const Padding(
                // Le damos más espacio
                padding: EdgeInsets.only(top: 48, bottom: 24.0), 
                child: ImageSlider(), 
              ),

            ],
          ),
        ),
        // --- FIN DEL NUEVO CONTENEDOR DE CABECERA ---
            // --- FIN DEL NUEVO CONTENEDOR DE CABECERA ---
            // --- FIN DEL NUEVO CONTENEDOR DE CABECERA ---

            
            // --- SECCIONES DE FEATURES (VÍDEOS) ---
            // (Aquí empieza el resto de tu contenido, que ya quedará
            // sobre el fondo gris claro del Scaffold)
            // --- TEMA: MODO INDEPENDIENTE ---
            _buildSectionTitle(context, l10n.sectionTitleIndependent), // Título de sección

            FeatureSection(
              videoPath: 'assets/videos/1.mp4',
              title: l10n.feature1Title,
              description: l10n.feature1Description,
              videoOnLeft: true,
            ),
            FeatureSection(
              videoPath: 'assets/videos/2.mp4',
              title: l10n.feature2Title,
              description: l10n.feature2Description,
              videoOnLeft: false,
            ),
            FeatureSection(
              videoPath: 'assets/videos/3.mp4',
              title: l10n.feature3Title,
              description: l10n.feature3Description,
              videoOnLeft: true,
            ),
             FeatureSection(
              videoPath: 'assets/videos/5.mp4',
              title: l10n.feature4Title,
              description: l10n.feature4Description,
              videoOnLeft: false,
            ),

            // --- TEMA: MODO EMPRESA (OWNER) ---
            _buildSectionTitle(context, l10n.sectionTitleManager), // Título de sección

            FeatureSection(
              videoPath: 'assets/videos/6.mp4',
              title: l10n.feature5Title,
              description: l10n.feature5Description,
              videoOnLeft: true,
            ),
            FeatureSection(
              videoPath: 'assets/videos/7.mp4',
              title: l10n.feature6Title,
              description: l10n.feature6Description,
              videoOnLeft: false,
            ),
            FeatureSection(
              videoPath: 'assets/videos/8.mp4',
              title: l10n.feature7Title,
              description: l10n.feature7Description,
              videoOnLeft: true,
            ),
            FeatureSection(
              videoPath: 'assets/videos/11.mp4',
              title: l10n.feature8Title,
              description: l10n.feature8Description,
              videoOnLeft: false,
            ),
            FeatureSection(
              videoPath: 'assets/videos/10.mp4',
              title: l10n.feature9Title,
              description: l10n.feature9Description,
              videoOnLeft: true,
            ),
            FeatureSection(
              videoPath: 'assets/videos/9.mp4',
              title: l10n.feature10Title,
              description: l10n.feature10Description,
              videoOnLeft: false,
            ),
                        FeatureSection(
              videoPath: 'assets/videos/1.mp4', // Aquí usamos el vídeo 12
              title: l10n.feature12Title,
              description: l10n.feature12Description,
              videoOnLeft: false,
            ),
            
            // --- TEMA: MODO EMPLEADO ---
            _buildSectionTitle(context, l10n.sectionTitleEmployee), // Título de sección
            
            FeatureSection(
              videoPath: 'assets/videos/12.mp4',
              title: l10n.feature11Title,
              description: l10n.feature11Description,
              videoOnLeft: false,
            ),
            
            // --- TEMA: FUNCIONES GLOBALES ---
            

           Container(
              alignment: Alignment.center,
              // Le damos un fondo blanco para destacarlo
              color: Colors.white, 
              padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, 
                  children: [
                    Text(
                      l10n.feature13Title, // "Una App Verdaderamente Global"
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      l10n.feature13Description, // "Hecha para el mundo..."
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // --- SECCIÓN DE DESCARGA ---
            _buildDownloadSection(context, l10n),
            
            // --- FOOTER ---
            _buildFooter(context, l10n),
          ],
        ),
      ),


    );
  }

  // --- Widget para Títulos de Sección (ej. "Para el Autónomo") ---
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 64.0, bottom: 24.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // --- Widget para la sección de Descarga ---
  Widget _buildDownloadSection(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      alignment: Alignment.center,
      color: Colors.grey[200], // Un color de fondo diferente
      child: Column(
        children: [
          Text(
            l10n.downloadTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.downloadSubtitle,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black54,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- INICIO DE LA ACTUALIZACIÓN ---

              // Botón de Google Play
              _StoreBadge(
                imagePath: 'assets/images/googlebadge.png',
                // CAMBIA ESTO por tu URL real
                storeUrl: 'https://play.google.com/store/apps/details?id=com.tu.paquete', 
              ),
              const SizedBox(width: 16),
              // Botón de Apple App Store
              _StoreBadge(
                imagePath: 'assets/images/applebadge.png',
                // CAMBIA ESTO por tu URL real
                storeUrl: 'https://apps.apple.com/app/tu-app/id1234567890',
              ),

              // --- FIN DE LA ACTUALIZACIÓN ---
            ],
          ),
        ],
      ),
    );
  }

  // --- Widget para el Footer ---
  Widget _buildFooter(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: Colors.black.withOpacity(0.9), // Fondo negro
      width: double.infinity,
      // --- INICIO DE LA ACTUALIZACIÓN ---
      child: Text(
        l10n.footerText('RosterFlow'),
        textAlign: TextAlign.center,
        // Aplicamos la fuente aquí también
        style: GoogleFonts.openSans( 
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      // --- FIN DE LA ACTUALIZACIÓN ---
    );
  }

  
}

// --- Widget Auxiliar para los Botones de las Tiendas ---

class _StoreBadge extends StatelessWidget {
  final String imagePath;
  final String storeUrl;

  const _StoreBadge({required this.imagePath, required this.storeUrl});

  // Función para abrir el enlace de la tienda
  Future<void> _launchStoreURL() async {
    final Uri uri = Uri.parse(storeUrl);
    if (await canLaunchUrl(uri)) {
      // Abre el enlace en una nueva pestaña/app de tienda
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print('No se pudo abrir la URL: $storeUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchStoreURL, // Para que sea clicable
      child: Image.asset(
        imagePath,
        height: 50, // <-- Altura fija de 50 para ambas, como pediste
        errorBuilder: (context, error, stackTrace) {
          // Un fallback por si la imagen no carga (ej. error en pubspec.yaml)
          return Container(
            height: 50,
            width: 150,
            color: Colors.grey[300],
            child: const Center(
              child: Text('Error', style: TextStyle(color: Colors.red)),
            ),
          );
        },
      ),
    );
  }
}