// lib/widgets/youtube_presenter.dart

import 'package:flutter/material.dart';
// 1. IMPORTAMOS EL PAQUETE ORIGINAL
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePresenter extends StatefulWidget {
  final String videoId;
  const YoutubePresenter({super.key, required this.videoId});

  @override
  State<YoutubePresenter> createState() => _YoutubePresenterState();
}

class _YoutubePresenterState extends State<YoutubePresenter> {
  // 2. USAMOS EL CONTROLADOR ORIGINAL
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // 3. USAMOS LA CONFIGURACIÓN ORIGINAL
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        strictRelatedVideos: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            // 4. USAMOS EL WIDGET ORIGINAL
            child: YoutubePlayer(
              controller: _controller,
              aspectRatio: 16 / 9,
            ),
          ),
        ),
      ),
    );
  }
}