import 'package:b612_flutter_presentation/view/explain_me_page.dart';
import 'package:b612_flutter_presentation/view/homepage.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: _routes,
    initialLocation: '/',
    debugLogDiagnostics: true,
  );
});

List<GoRoute> _routes = [
  GoRoute(
    path: '/',
    builder: (_, __) => const HomePage(),
    name: HomePage.routeName,
  ),
  GoRoute(
    path: '/introduce',
    name: ExplainMePage.routeName,
    builder: (_, __) => const ExplainMePage(),
  ),
];
