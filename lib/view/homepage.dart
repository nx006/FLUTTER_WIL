import 'package:b612_flutter_presentation/layout/default_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = 'homePage';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: Column(children: [
          Icon(
            Icons.flutter_dash,
          )
        ]),
      ),
    );
  }
}
