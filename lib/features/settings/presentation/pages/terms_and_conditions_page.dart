import 'package:demy_teachers/core/localization/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.termsAndConditions),
        centerTitle: true,
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título principal
            Text(
              loc.termsAndConditions,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 24),

            // Sección 1
            _buildSection(
              context,
              title: loc.termsSection1Title,
              content: loc.termsSection1Content,
            ),

            // Sección 2
            _buildSection(
              context,
              title: loc.termsSection2Title,
              content: loc.termsSection2Content,
              bulletPoints: [
                loc.termsSection2Item1,
                loc.termsSection2Item2,
                loc.termsSection2Item3,
                loc.termsSection2Item4,
                loc.termsSection2Item5,
                loc.termsSection2Item6,
              ],
            ),

            // Sección 3
            _buildSection(
              context,
              title: loc.termsSection3Title,
              content: loc.termsSection3Content,
            ),

            // Sección 4
            _buildSection(
              context,
              title: loc.termsSection4Title,
              content: loc.termsSection4Content,
              bulletPoints: [
                loc.termsSection4Item1,
                loc.termsSection4Item2,
                loc.termsSection4Item3,
                loc.termsSection4Item4,
                loc.termsSection4Item5,
              ],
            ),

            // Sección 5
            _buildSection(
              context,
              title: loc.termsSection5Title,
              content: loc.termsSection5Content,
            ),

            // Sección 6
            _buildSection(
              context,
              title: loc.termsSection6Title,
              content: loc.termsSection6Content,
            ),

            // Sección 7
            _buildSection(
              context,
              title: loc.termsSection7Title,
              content: loc.termsSection7Content,
            ),

            // Sección 8
            _buildSection(
              context,
              title: loc.termsSection8Title,
              content: loc.termsSection8Content,
            ),

            // Sección 9
            _buildSection(
              context,
              title: loc.termsSection9Title,
              content: loc.termsSection9Content,
            ),

            // Sección 10
            _buildSection(
              context,
              title: loc.termsSection10Title,
              content: loc.termsSection10Content,
            ),

            const SizedBox(height: 24),

            // Última actualización
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      loc.termsLastUpdated,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String content,
    List<String>? bulletPoints,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título de la sección
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 8),

          // Contenido
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.8),
                  height: 1.5,
                ),
          ),

          // Puntos de lista si existen
          if (bulletPoints != null && bulletPoints.isNotEmpty) ...[
            const SizedBox(height: 8),
            ...bulletPoints.map(
              (point) => Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Expanded(
                      child: Text(
                        point,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurface.withValues(alpha: 0.8),
                              height: 1.5,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}