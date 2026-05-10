import 'package:demy_teachers/features/settings/presentation/pages/settings_page.dart';
import 'package:demy_teachers/shared/widgets/main_scaffold.dart';
import 'package:go_router/go_router.dart';

final settingsRoutes = [
  GoRoute(
    path: '/settings',
    name: 'settings',
    builder: (context, state) => const MainScaffold(
      currentIndex: 2,
      child: SettingsPage(),
    ),
  ),
];
