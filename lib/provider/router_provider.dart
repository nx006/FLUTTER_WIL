import 'package:b612_flutter_presentation/view/3_why_flutter.dart';
import 'package:b612_flutter_presentation/view/4_flutter_structure.dart';
import 'package:b612_flutter_presentation/view/5_flutter_engine.dart';
import 'package:b612_flutter_presentation/view/6_dart_lang_page.dart';
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
  GoRoute(
    path: '/why_flutter',
    name: WhyFlutterPage.routeName,
    builder: (context, state) => const WhyFlutterPage(),
  ),
  GoRoute(
    path: '/flutter_structure',
    name: FlutterStructurePage.routeName,
    builder: (context, state) => const FlutterStructurePage(),
  ),
  GoRoute(
    path: '/flutter_engine',
    name: FlutterEnginePage.routeName,
    builder: (context, state) => const FlutterEnginePage(),
  ),
  GoRoute(
    path: '/edge_of_flutter',
    name: DartLangPage.routeName,
    builder: (context, state) => const DartLangPage(),
  ),
];
