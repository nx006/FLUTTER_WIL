import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webtoon/common/views/home_screen.dart';
import 'package:webtoon/webtoon/view/detail_screen.dart';

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
      name: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'webtoons/:id',
          name: DetailScreen.routeName,
          builder: (context, state) {
            final id = state.pathParameters['id']!;

            return DetailScreen(id: id);
          },
        ),
      ])
];
