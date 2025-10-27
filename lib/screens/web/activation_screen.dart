import 'package:flutter/material.dart';
import 'package:rosterflowweb/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
// Importa l10n si quieres mensajes internacionalizados
// import 'package:rosterflow/l10n/app_localizations.dart';

class ActivationScreen extends StatefulWidget {
  final String? token; // Recibirá el token de la URL

  const ActivationScreen({super.key, required this.token});

  @override
  State<ActivationScreen> createState() => _ActivationScreenState();
}

class _ActivationScreenState extends State<ActivationScreen> {
  String _statusMessage = "Validando y redirigiendo al pago..."; // Mensaje inicial
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _validateAndRedirect(); // Inicia el proceso al cargar la pantalla
  }

  Future<void> _validateAndRedirect() async {
    // final l10n = AppLocalizations.of(context)!; // Descomenta si usas l10n

    if (widget.token == null || widget.token!.isEmpty) {
      if (mounted) {
        setState(() {
          _statusMessage = "Error: Token no encontrado en la URL.";
          _hasError = true;
        });
      }
      return;
    }

    try {
      // Llamamos a la función de Supabase (¡recuerda desplegarla sin JWT!)
      final result = await supabase.functions.invoke(
        'validate-activation-token',
        body: {'token': widget.token},
      );

      if (!mounted) return; // Comprueba si el widget sigue vivo

      if (result.data == null || result.data['checkoutUrl'] == null) {
        throw Exception(result.data?['error'] ?? 'No se recibió la URL de pago.');
      }

      final checkoutUrl = result.data['checkoutUrl'];
      final uri = Uri.parse(checkoutUrl);

      // Redirigimos al usuario a Stripe
      // Usamos launchUrl que funciona tanto en móvil como en web
      if (await canLaunchUrl(uri)) {
        // En web, esto simplemente cambiará la URL del navegador
        await launchUrl(uri, webOnlyWindowName: '_self');
      } else {
        throw Exception('No se pudo abrir la URL de pago.');
      }
      // Si la redirección tiene éxito, esta pantalla ya no será visible
    } catch (e) {
      if (mounted) {
        String errorMessage;
        // Check if it's a FunctionException and try to get the specific error
        if (e is FunctionException && e.details is Map && (e.details as Map).containsKey('error')) {
          errorMessage = (e.details as Map)['error'].toString();
        } else {
          // Otherwise, use the general error message
          errorMessage = e.toString();
        }
        setState(() {
          _statusMessage = "Error: $errorMessage";
          _hasError = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Una UI simple de carga o error
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // <-- Correct position
            // crossAxisAlignment: CrossAxisAlignment.stretch, // Optional: Keep if you want items stretched horizontally
            children: [ // <-- Children list starts AFTER properties
              if (!_hasError) const CircularProgressIndicator(),
              if (_hasError) Icon(Icons.error_outline, color: Colors.red, size: 60),
              const SizedBox(height: 24),
              Text(
                _statusMessage,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: _hasError ? Colors.red : null,
                ),
              ),
              if (_hasError) ...[
                const SizedBox(height: 20),
                Text(
                  "Por favor, vuelve a la aplicación e inténtalo de nuevo.", // O usa l10n
                  textAlign: TextAlign.center,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}