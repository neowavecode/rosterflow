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
        // Definimos un punto de corte.
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
              crossAxisAlignment:
                  isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
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

            // --- INICIO DE LA MODIFICACIÓN ---
            // Reemplazamos el Card por un Container para controlar la sombra
            child: Container(
              decoration: BoxDecoration(
                // Mantenemos el color blanco que teníamos del Card
                color: Theme.of(context).cardTheme.color ?? Colors.white,
                // Mantenemos los bordes redondeados
                borderRadius: BorderRadius.circular(24),
                // ¡AQUÍ ESTÁ LA SOMBRA PERSONALIZADA!
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Un color de sombra sutil
                    // offset: const Offset(X, Y)
                    // X > 0 (mueve la sombra a la DERECHA)
                    // Y > 0 (mueve la sombra hacia ABAJO)
                    offset: const Offset(7, 7),
                    blurRadius: 22, // Un difuminado suave
                    spreadRadius: 1, // Sin expansión, solo difuminado
                  ),
                ],
              ),
              // Mantenemos el ClipRRect para que los vídeos respeten los bordes
              clipBehavior: Clip.antiAlias,
              // --- FIN DE LA MODIFICACIÓN ---

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