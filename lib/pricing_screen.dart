// lib/pricing_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rosterflowweb/l10n/app_localizations.dart';
import 'package:rosterflowweb/widgets/responsive_layout.dart';
import 'package:url_launcher/url_launcher.dart'; // <-- 1. Importamos url_launcher
import 'package:http/http.dart' as http; // <-- 1. Importar HTTP
import 'dart:convert'; // <-- 2. Importar JSON converter

class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  // --- 4. AÑADIR UN ESTADO PARA GUARDAR LOS PRECIOS ---
  late Future<Map<String, dynamic>> _pricesFuture;

  // --- RELLENA ESTOS MARCADORES DE POSICIÓN ---
  final String _supabaseFunctionUrl = 'https://yssonpnesxtkmzganklq.supabase.co/functions/v1/get-plan-details';
  final String _priceIdFounderMonthly = 'price_1SIA2UQnm3Czwtmf5rWUK2Ig';
  final String _priceIdFounderYearly = 'price_1SIA6CQnm3CzwtmfIfxqYL7O';
  final String _priceIdProfessional = 'price_1SIVPRQnm3CzwtmfCG3S3iqj';

  @override
  void initState() {
    super.initState();
    // --- 5. LLAMAR A LA FUNCIÓN AL INICIAR LA PANTALLA ---
    _pricesFuture = _fetchPrices();
  }

  // --- 6. FUNCIÓN PARA LLAMAR A TU SUPABASE FUNCTION ---
  Future<Map<String, dynamic>> _fetchPrices() async {
    try {
      final response = await http.post(
        Uri.parse(_supabaseFunctionUrl),
        headers: {
          'Content-Type': 'application/json',
          // Si tu función de Supabase requiere autenticación (API Key), añádela aquí:
          // 'Authorization': 'Bearer [TU_SUPABASE_ANON_KEY]', 
        },
        body: jsonEncode({
          'price_ids': [
            _priceIdFounderMonthly,
            _priceIdFounderYearly,
            _priceIdProfessional,
          ]
        }),
      );

      if (response.statusCode == 200) {
        // La función devolvió los precios
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        // La función devolvió un error
        throw Exception('Error al cargar precios: ${response.body}');
      }
    } catch (e) {
      // Error de red
      throw Exception('Error de red: ${e.toString()}');
    }
  }

  // --- 7. FUNCIÓN PARA FORMATEAR EL PRECIO (ej. 10.0, "EUR" -> "10€") ---
 String _formatPrice(dynamic priceData) {
    if (priceData == null || priceData is! Map) return '...'; // Muestra '...' mientras carga
    try {
      final double amount = (priceData['amount'] as num).toDouble();
      
      // Formateo simple: Muestra el número entero con '$' delante
      final String amountString = amount.toStringAsFixed(0); // Muestra 10 en lugar de 10.00
      
      return '\$$amountString'; // <-- Siempre mostramos el símbolo $

    } catch (e) {
      print('Error formateando precio: $e'); // Log del error
      return 'Error'; // Muestra 'Error' si algo falla
    }
  }

  Future<void> _launchAppUrl() async {
    final Uri uri = Uri.parse('https://app.rosterflowapp.com');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.pricingTitle), 
      ),
      body: SingleChildScrollView(
        // --- 8. USAMOS UN FUTUREBUILDER PARA MOSTRAR LA CARGA ---
        child: FutureBuilder<Map<String, dynamic>>(
          future: _pricesFuture,
          builder: (context, snapshot) {
            
            // --- ESTADO DE CARGA ---
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                heightFactor: 10,
                child: CircularProgressIndicator(),
              );
            }

            // --- ESTADO DE ERROR ---
            if (snapshot.hasError || !snapshot.hasData) {
              return Center(
                heightFactor: 10,
                child: Text(
                  'Error al cargar los precios. Inténtalo más tarde.',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
            
            // --- ESTADO DE ÉXITO (DATOS CARGADOS) ---
            final prices = snapshot.data!;

            return ResponsiveLayout(
              maxWidth: 1400,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      l10n.pricingTitle,
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.pricingSubtitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 48),
                    
                    Wrap(
                      spacing: 24.0,
                      runSpacing: 24.0,
                      alignment: WrapAlignment.center,
                      children: [
                        
                        // --- Tarjeta 1: Independiente (Gratis) ---
                        _PricingCard(
                          title: l10n.pricingIndependentTitle,
                          subtitle: l10n.pricingIndependentSubtitle,
                          price: l10n.pricingIndependentPrice, // "Gratis"
                          per: l10n.pricingIndependentPer,
                          buttonText: l10n.pricingIndependentButton,
                          onTap: _launchAppUrl,
                          features: [
                            l10n.pricingIndependentFeature1,
                            l10n.pricingIndependentFeature2,
                            l10n.pricingIndependentFeature3,
                            l10n.pricingIndependentFeature4,
                            l10n.pricingIndependentFeature5,
                          ],
                        ),

                        // --- Tarjeta 2: Fundador Mensual (Dinámica) ---
                        _PricingCard(
                          title: l10n.pricingFounderTitle,
                          subtitle: l10n.pricingFounderSubtitle,
                          // 9. USAMOS EL PRECIO DE LA API
                          price: _formatPrice(prices[_priceIdFounderMonthly]),
                          per: l10n.pricingFounderMonthlyPer,
                          buttonText: l10n.pricingFounderButton,
                          onTap: _launchAppUrl,
                          features: [
                            l10n.pricingFounderFeature1,
                            l10n.pricingFounderFeature2,
                            l10n.pricingFounderFeature3,
                            l10n.pricingFounderFeature4,
                            l10n.pricingFounderFeature5,
                          ],
                        ),

                        // --- Tarjeta 3: Fundador Anual (Dinámica y Destacada) ---
                        _PricingCard(
                          title: l10n.pricingFounderTitle,
                          subtitle: l10n.pricingFounderSubtitle,
                          // 9. USAMOS EL PRECIO DE LA API
                          price: _formatPrice(prices[_priceIdFounderYearly]),
                          per: l10n.pricingFounderYearlyPer,
                          buttonText: l10n.pricingFounderButton,
                          onTap: _launchAppUrl,
                          features: [
                            l10n.pricingFounderFeature1,
                            l10n.pricingFounderFeature2,
                            l10n.pricingFounderFeature3,
                            l10n.pricingFounderFeature4,
                            l10n.pricingFounderFeature5,
                          ],
                          isHighlighted: true,
                          highlightText: l10n.pricingFounderYearlySave,
                        ),

                        // --- Tarjeta 4: Profesional (Dinámica) ---
                        _PricingCard(
                          title: l10n.pricingProfessionalTitle,
                          subtitle: l10n.pricingProfessionalSubtitle,
                          // 9. USAMOS EL PRECIO DE LA API
                          price: _formatPrice(prices[_priceIdProfessional]),
                          per: l10n.pricingProfessionalPer,
                          buttonText: l10n.pricingProfessionalButton,
                          onTap: _launchAppUrl,
                          features: [
                            l10n.pricingProfessionalFeature1,
                            l10n.pricingProfessionalFeature2,
                            l10n.pricingProfessionalFeature3,
                            l10n.pricingProfessionalFeature4,
                            l10n.pricingProfessionalFeature5,
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// --- WIDGET DE TARJETA REUTILIZABLE ---
// (No necesita cambios, pégalo tal cual estaba)
class _PricingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String per;
  final String buttonText;
  final List<String> features;
  final VoidCallback onTap;
  final bool isHighlighted;
  final String? highlightText;

  const _PricingCard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.per,
    required this.buttonText,
    required this.features,
    required this.onTap,
    this.isHighlighted = false,
    this.highlightText,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = isHighlighted
        ? ElevatedButton.styleFrom(backgroundColor: Colors.blue)
        : Theme.of(context).elevatedButtonTheme.style;
    
    final cardColor = isHighlighted ? Colors.grey[100] : Colors.white;

    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        border: isHighlighted
            ? Border.all(color: Colors.blue, width: 2)
            : Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isHighlighted ? 0.15 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: GoogleFonts.openSans(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.openSans(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        per,
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: onTap,
                  child: Text(buttonText),
                ),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 16),
                ...features.map((feature) => _FeatureItem(text: feature)),
              ],
            ),
          ),
          if (highlightText != null)
            Positioned(
              top: -15,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  highlightText!,
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// --- Widget de Item de Característica (para el check) ---
class _FeatureItem extends StatelessWidget {
  final String text;
  const _FeatureItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.blue, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.openSans(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}