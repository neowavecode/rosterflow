// lib/widgets/feature_section.dart

import 'package:flutter/material.dart';
import 'package:rosterflowweb/widgets/video_mockup_player.dart';

class FeatureSection extends StatelessWidget {
  final String videoPath;
  final String title;
  final String description;
  final bool videoOnLeft;

  const FeatureSection({
    super.key,
    required this.videoPath,
    required this.title,
    required this.description,
    this.videoOnLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    // Usamos LayoutBuilder para detectar si estamos en móvil o escritorio
    return LayoutBuilder(
      builder: (context, constraints) {
        // Definimos un punto de corte. Si la pantalla es más ancha, es "desktop"
        const double breakpoint = 900.0;
        final bool isDesktop = constraints.maxWidth > breakpoint;

        // 1. El Widget de Vídeo (con tamaño)
        final videoWidget = SizedBox(
          // Damos un tamaño al contenedor del vídeo
          width: isDesktop ? 300 : 300, 
          height: 533, // Proporción 16:9 (300 * 16 / 9)
          child: VideoMockupPlayer(videoPath: videoPath),
        );

        // 2. El Widget de Texto
        final textWidget = Expanded(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: isDesktop ? TextAlign.left : TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Texto negro
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  textAlign: isDesktop ? TextAlign.left : TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.black54, // Texto gris oscuro
                        height: 1.5, // Interlineado
                      ),
                ),
              ],
            ),
          ),
        );

        // 3. La Tarjeta contenedora
        return Container(
          // Centramos la tarjeta en la página
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: ConstrainedBox(
            // Limitamos el ancho máximo de la tarjeta
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Card(
              elevation: 4,
              shadowColor: Colors.black.withOpacity(0.1),
              color: Colors.white,
              clipBehavior: Clip.antiAlias, // Para que el contenido respete los bordes
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: isDesktop
                  // VISTA DESKTOP (Row)
                  ? IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: videoOnLeft
                            ? [videoWidget, textWidget]
                            : [textWidget, videoWidget],
                      ),
                    )
                  // VISTA MÓVIL (Column)
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: videoWidget,
                        ),
                        textWidget,
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}