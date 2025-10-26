// lib/widgets/responsive_layout.dart

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ResponsiveLayout extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const ResponsiveLayout({
    super.key,
    required this.child,
    this.maxWidth = 800.0, // Este es el ancho por defecto
  });

  @override
  Widget build(BuildContext context) {
    // Si la plataforma es web, centramos y limitamos el ancho.
    // Si no (móvil), devolvemos el widget hijo sin modificarlo.
    if (kIsWeb) {
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      );
    } else {
      // En móvil, simplemente devolvemos el hijo (pantalla completa)
      return child;
    }
  }
}