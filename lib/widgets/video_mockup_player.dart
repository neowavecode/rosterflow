// lib/widgets/video_mockup_player.dart

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
// 1. IMPORTAMOS VISIBILITY DETECTOR
import 'package:visibility_detector/visibility_detector.dart';

class VideoMockupPlayer extends StatefulWidget {
  final String videoPath;
  const VideoMockupPlayer({super.key, required this.videoPath});

  @override
  State<VideoMockupPlayer> createState() => _VideoMockupPlayerState();
}

// 2. QUITAMOS "with AutomaticKeepAliveClientMixin" (ya no es necesario)
class _VideoMockupPlayerState extends State<VideoMockupPlayer> {
  late VideoPlayerController _controller;
  bool _isRestarting = false;
  // 3. UNA VARIABLE PARA SABER SI EL WIDGET ES VISIBLE
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        _controller.setVolume(0); // Silenciado
        // 4. YA NO HACEMOS PLAY AQUÍ, solo actualizamos
        setState(() {});
        // 5. MANTENEMOS EL LISTENER para el bucle
        _controller.addListener(_videoListener);
      });
  }

  void _videoListener() {
    // 6. El bucle ahora SOLO se activa si el vídeo es VISIBLE
    if (_controller.value.isCompleted && !_isRestarting && _isVisible && mounted) {
      setState(() => _isRestarting = true);
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted && _isVisible) { // Solo si sigue siendo visible
          _controller.seekTo(Duration.zero);
          _controller.play();
          setState(() => _isRestarting = false);
        } else {
          // Si ya no es visible cuando acaba la pausa, quitamos el seguro
          if (mounted) setState(() => _isRestarting = false);
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 7. QUITAMOS super.build(context);

    // 8. ENVOLVEMOS TODO EN UN VisibilityDetector
    return VisibilityDetector(
      key: Key(widget.videoPath), // Una clave única para cada vídeo
      // 9. LA FUNCIÓN QUE SE LLAMA CUANDO CAMBIA LA VISIBILIDAD
      onVisibilityChanged: (visibilityInfo) {
        // visibilityInfo.visibleFraction > 0 significa que al menos una parte es visible
        bool isNowVisible = visibilityInfo.visibleFraction > 0.1; // Ajusta este 0.1 si quieres

        // Si el estado de visibilidad ha cambiado
        if (isNowVisible != _isVisible) {
          setState(() {
            _isVisible = isNowVisible;
          });

          // Si ahora es visible Y el vídeo está inicializado, PLAY
          if (_isVisible && _controller.value.isInitialized) {
            _controller.play();
          }
          // Si ya no es visible Y el vídeo está inicializado, PAUSE
          else if (!_isVisible && _controller.value.isInitialized) {
            _controller.pause();
          }
        }
      },
      // 10. EL CONTENIDO DEL WIDGET (tu AspectRatio de antes)
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: _controller.value.isInitialized
            ? ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: VideoPlayer(_controller),
              )
            : const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
    );
  }
}