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
        return Padding(
          // Mantenemos un pequeño padding para que no se peguen
          padding: const EdgeInsets.symmetric(horizontal: 8.0), 
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
        );
      },
      // --- AQUÍ EMPIEZAN LAS MODIFICACIONES ---
      options: CarouselOptions(
        // CAMBIO 1: La mitad de altura
        height: 140, // <-- La bajamos de 280 a 140

        // CAMBIO 2: Para mostrar 4 imágenes a la vez
        viewportFraction: 0.25, // <-- Lo cambiamos de 0.33 a 0.25 (1 / 4)

        // Mantenemos el resto de tu configuración "Premium"
        enlargeCenterPage: false, 
        autoPlayCurve: Curves.fastOutSlowIn, 
        autoPlayAnimationDuration: const Duration(milliseconds: 1500), 
        autoPlay: true, 
        autoPlayInterval: const Duration(seconds: 3), 
        aspectRatio: 16 / 9, 
      ),
      // --- FIN DE LAS MODIFICACIONES ---
    );
  }
}