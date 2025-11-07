// lib/home_page.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rosterflowweb/l10n/app_localizations.dart';
import 'dart:html' as html;
// Importamos los nuevos widgets
import 'package:rosterflowweb/widgets/feature_section.dart';
import 'package:rosterflowweb/widgets/image_slider.dart'; // <-- Nuestro nuevo slider
import 'package:google_fonts/google_fonts.dart';
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
        // 1. Reemplazamos el 'title' por un 'Row'
        title: Row(
          mainAxisSize: MainAxisSize.min, // Para que el Row no ocupe todo el espacio
          children: [
            // 2. Añadimos tu logotipo
            Image.asset(
              'assets/images/logotipo.png',
              // 3. Ajustamos la altura para que coincida con el texto (fontSize: 20)
              //    Un buen punto de partida es 36. ¡Ajusta este valor!
              height: 36, 
              errorBuilder: (context, error, stackTrace) {
                // Fallback por si el logo no carga
                return const Icon(Icons.error_outline, color: Colors.red, size: 24);
              },
            ),
            const SizedBox(width: 8), // Un pequeño espacio
            
            // 4. El texto del título
            Text(l10n.appTitle),
          ],
        ),
        
        // 5. Tus 'actions' (el selector de idioma) se quedan exactamente igual
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
      // --- INICIO DEL NUEVO BODY CON FONDO "GLOW" ---
      body: Stack(
        children: [
          
          // --- CAPA 1: LOS "BLOOMS" DE FONDO (SÓLO GLOW, SIN CÍRCULO SÓLIDO) ---
          Positioned(
            top: -300, // Arriba del todo, casi fuera de la pantalla
            left: -300, // Izquierda del todo, casi fuera de la pantalla
            child: Container(
              width: 600, // Tamaño de la "fuente" de luz (aumentado un poco)
              height: 600,
              decoration: BoxDecoration(
                // Establecemos el color del contenedor como transparente
                color: Colors.transparent, 
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    // El color del resplandor (Azul Caribe)
                    color: Colors.cyan.withOpacity(0.15), 
                    blurRadius: 400,  // ¡Más difuminado aún!
                    spreadRadius: 300, // ¡Más expansión!
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -300, // Abajo del todo, casi fuera de la pantalla
            right: -300, // Derecha del todo, casi fuera de la pantalla
            child: Container(
              width: 700, // Tamaño de la "fuente" de luz (aumentado un poco)
              height: 700,
              decoration: BoxDecoration(
                // Establecemos el color del contenedor como transparente
                color: Colors.transparent, 
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    // El color del resplandor (Verde Planta)
                    color: Colors.lightGreen.withOpacity(0.10), // Un poco más de opacidad para que se note
                    blurRadius: 450, // ¡Más difuminado aún!
                    spreadRadius: 350, // ¡Más expansión!
                  )
                ],
              ),
            ),
          ),
          // --- FIN DE LA CAPA DE "BLOOMS" ---


          // --- CAPA 2: TU "WALL" SCROLLABLE (VA ENCIMA DE LOS BLOBS) ---
          // (Esta parte es tu código, no cambia)
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                // --- INICIO DEL NUEVO CONTENEDOR DE CABECERA ---
                Container(
                  // 1. REEMPLAZAMOS EL COLOR POR TU IMAGEN
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/fondoweb.png'), 
                      fit: BoxFit.cover, // Para que la imagen cubra todo el área
                    ),
                  ),
                  child: Column(
                    children: [

                      // --- SECCIÓN 2: TEXTO DE INTRODUCCIÓN (VA PRIMERO) ---
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 64, bottom: 48, left: 24, right: 24), 
                        child: ConstrainedBox(
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
                          videoId: 'NSqewAybgVk', 
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
                
                // --- SECCIONES DE FEATURES (VÍDEOS) ---
                _buildSectionTitle(context, l10n.sectionTitleIndependent), 

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
                _buildSectionTitle(context, l10n.sectionTitleManager), 

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
                  videoPath: 'assets/videos/13.mp4', 
                  title: l10n.feature12Title,
                  description: l10n.feature12Description,
                  videoOnLeft: true,
                ),
                
                // --- TEMA: MODO EMPLEADO ---
                _buildSectionTitle(context, l10n.sectionTitleEmployee), 
                
                FeatureSection(
                  videoPath: 'assets/videos/12.mp4',
                  title: l10n.feature11Title,
                  description: l10n.feature11Description,
                  videoOnLeft: false,
                ),
                
                // --- TEMA: FUNCIONES GLOBALES ---
                Container(
                  alignment: Alignment.center,
                  // 2. USAMOS EL MISMO COLOR DEL SCAFFOLD
                  color: Theme.of(context).scaffoldBackgroundColor, 
                  padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center, 
                      children: [
                        Text(
                          l10n.feature13Title, 
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          l10n.feature13Description, 
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
        ],
      ),
      // --- FIN DEL NUEVO BODY ---


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
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
      alignment: Alignment.center,
      color: const Color.fromARGB(255, 192, 192, 192), // Un color de fondo diferente
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
        style: GoogleFonts.balsamiqSans( 
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
      borderRadius: BorderRadius.circular(8.0), // Redondea el "splash"
      child: Container( // <-- 1. ENVOLVEMOS LA IMAGEN EN UN CONTAINER
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
          boxShadow: [ // <-- 2. AÑADIMOS LA SOMBRA
            BoxShadow(
              color: Colors.black.withOpacity(0.50), // Color de la sombra
              blurRadius: 20, // Difuminado
              offset: const Offset(0, 0), // Desplazamiento (hacia abajo)
            ),
          ],
        ),
        child: ClipRRect( // <-- 3. USAMOS CLIPRRECT PARA QUE LA IMAGEN RESPETE LOS BORDES
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imagePath,
            height: 50, // <-- Altura fija de 50
            errorBuilder: (context, error, stackTrace) {
              // Un fallback por si la imagen no carga
              return Container(
                height: 50,
                width: 150,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: const Center(
                  child: Text('Error', style: TextStyle(color: Colors.red)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}