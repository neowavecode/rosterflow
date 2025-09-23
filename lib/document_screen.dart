import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_html/flutter_html.dart';

class DocumentScreen extends StatelessWidget {
  final String title;
  final String htmlPath;

  const DocumentScreen({
    super.key,
    required this.title,
    required this.htmlPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white, // <--- Añade esta línea
      ),
      body: FutureBuilder(
        future: rootBundle.loadString(htmlPath),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Html(data: snapshot.data!),
              );
            } else {
              return const Center(child: Text('No se pudo cargar el documento.'));
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}