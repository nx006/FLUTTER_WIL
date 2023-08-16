import 'package:b612_flutter_presentation/view/homepage.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> _routes = [
  GoRoute(
    path: '/',
    builder: (_, __) => const HomePage(),
    name: HomePage.routeName,
  ),
  GoRoute(
    path: '/:id',
    routes: [],
  ),
];
