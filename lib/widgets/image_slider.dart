// lib/widgets/image_slider.dart

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    // Generamos la lista de rutas de las imágenes
    final List<String> imagePaths = List.generate(
      17, 
      (index) => 'assets/images/slider/${index + 1}.png'
    );

    return CarouselSlider.builder(
      itemCount: imagePaths.length,
      
      itemBuilder: (context, index, realIndex) {
        // 1. El Padding ahora va por fuera, para separar las tarjetas
        return Padding(
          // 2. Añadimos padding vertical para que la sombra no se corte
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0), 
          // 3. Este Container aplica la sombra a CADA imagen
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor, // Un fondo sólido (blanco)
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 15, // Sombra más sutil para un item pequeño
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: Center(child: Text('Error al cargar ${imagePaths[index]}')),
                  );
                },
              ),
            ),
          ),
        );
      },

      options: CarouselOptions(
        // CAMBIO: Ajustamos la altura para dar espacio a la sombra vertical
        height: 164, // (140 de la imagen + 12*2 del padding vertical)

        // --- INICIO DE LA MODIFICACIÓN ---
        clipBehavior: Clip.none, // <-- ¡SOLUCIÓN! Permite que la sombra se vea
        // --- FIN DE LA MODIFICACIÓN ---

        // Mantenemos tu configuración
        viewportFraction: 0.25, 
        enlargeCenterPage: false, 
        autoPlayCurve: Curves.fastOutSlowIn, 
        autoPlayAnimationDuration: const Duration(milliseconds: 1500), 
        autoPlay: true, 
        autoPlayInterval: const Duration(seconds: 3), 
        aspectRatio: 16 / 9, 
      ),
    );
  }
}