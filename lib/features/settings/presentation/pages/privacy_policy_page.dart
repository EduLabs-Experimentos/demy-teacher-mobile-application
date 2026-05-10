import 'package:demy_teachers/core/localization/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.privacyPolicy),
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
              loc.privacyPolicy,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 24),

            // Sección 1
            _buildSection(
              context,
              title: loc.privacySection1Title,
              content: loc.privacySection1Content,
              bulletPoints: [
                loc.privacySection1Item1,
                loc.privacySection1Item2,
                loc.privacySection1Item3,
                loc.privacySection1Item4,
                loc.privacySection1Item5,
              ],
            ),

            // Sección 2
            _buildSection(
              context,
              title: loc.privacySection2Title,
              content: loc.privacySection2Content,
              bulletPoints: [
                loc.privacySection2Item1,
                loc.privacySection2Item2,
                loc.privacySection2Item3,
                loc.privacySection2Item4,
                loc.privacySection2Item5,
                loc.privacySection2Item6,
              ],
            ),

            // Sección 3
            _buildSection(
              context,
              title: loc.privacySection3Title,
              content: loc.privacySection3Content,
              bulletPoints: [
                loc.privacySection3Item1,
                loc.privacySection3Item2,
                loc.privacySection3Item3,
                loc.privacySection3Item4,
                loc.privacySection3Item5,
              ],
            ),

            // Sección 4
            _buildSection(
              context,
              title: loc.privacySection4Title,
              content: loc.privacySection4Content,
              bulletPoints: [
                loc.privacySection4Item1,
                loc.privacySection4Item2,
                loc.privacySection4Item3,
                loc.privacySection4Item4,
              ],
            ),

            // Sección 5
            _buildSection(
              context,
              title: loc.privacySection5Title,
              bulletPoints: [
                loc.privacySection5Item1,
                loc.privacySection5Item2,
                loc.privacySection5Item3,
                loc.privacySection5Item4,
              ],
            ),

            // Sección 6
            _buildSection(
              context,
              title: loc.privacySection6Title,
              content: loc.privacySection6Content,
              bulletPoints: [
                loc.privacySection6Item1,
                loc.privacySection6Item2,
                loc.privacySection6Item3,
                loc.privacySection6Item4,
                loc.privacySection6Item5,
                loc.privacySection6Item6,
              ],
            ),

            // Sección 7
            _buildSection(
              context,
              title: loc.privacySection7Title,
              content: loc.privacySection7Content,
            ),

            // Sección 8
            _buildSection(
              context,
              title: loc.privacySection8Title,
              content: loc.privacySection8Content,
            ),

            // Sección 9
            _buildSection(
              context,
              title: loc.privacySection9Title,
              content: loc.privacySection9Content,
            ),

            // Sección 10
            _buildSection(
              context,
              title: loc.privacySection10Title,
              content: loc.privacySection10Content,
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
                      loc.privacyLastUpdated,
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
    String? content,
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
          
          // Contenido (opcional)
          if (content != null) ...[
            const SizedBox(height: 8),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.8),
                    height: 1.5,
                  ),
            ),
          ],

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