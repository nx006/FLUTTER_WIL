import 'package:b612_flutter_presentation/component/next_page_floating_button.dart';
import 'package:b612_flutter_presentation/const/font_styles.dart';
import 'package:b612_flutter_presentation/layout/default_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = 'homePage';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      floatingActionButton: NextPageFloatingButton(
        routeName: routeName,
        onPressed: () {},
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/flutter/lockup_flutter_horizontal/lockup_flutter_horizontal.png',
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Mobile 1주차 발표자료',
              style: titleTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Flutter와 Dart 언어',
              style: subtitleTextStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
