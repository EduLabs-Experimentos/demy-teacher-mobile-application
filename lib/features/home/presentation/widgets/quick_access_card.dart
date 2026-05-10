import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuickAccessCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const QuickAccessCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
  
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      // Padding vertical ajustado para centrar el diseño
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0), 
        child: Column(
          // Centramos los elementos verticalmente
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            // Círculo de Ícono: Ajustado visualmente a 55x55
            Container(
              width: 55, 
              height: 55, 
              decoration: BoxDecoration(
                // Fondo lila muy suave (similar al surface del mockup)
                color: colorScheme.primary.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon, 
                size: 28, // Ícono ajustado al contenedor
                color: colorScheme.primary, // Ícono color principal (azul/morado)
              ),
            ),
            
            // Espaciado entre el ícono y el texto
            const SizedBox(height: 8), 
            
            // Texto de la Tarjeta (Ajuste para legibilidad y compresión)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2, 
                overflow: TextOverflow.visible, // Permitimos que el texto use el espacio que necesite
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                      fontSize: 13, 
                      height: 1.1, // Compresión de línea
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}