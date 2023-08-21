import 'package:b612_flutter_presentation/component/next_page_floating_button.dart';
import 'package:b612_flutter_presentation/component/prev_page_floating_button.dart';
import 'package:b612_flutter_presentation/const/font_styles.dart';
import 'package:b612_flutter_presentation/layout/default_layout.dart';
import 'package:b612_flutter_presentation/view/3_why_flutter.dart';
import 'package:b612_flutter_presentation/view/homepage.dart';
import 'package:flutter/material.dart';

class ExplainMePage extends StatelessWidget {
  static String get routeName => 'explainMePage';

  const ExplainMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        prevPageFloatingActionButton:
            PrevPageFloatingButton(routeName: HomePage.routeName),
        nextPageFloatingActionButton:
            NextPageFloatingButton(routeName: WhyFlutterPage.routeName),
        child: Center(
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/cocktail.png',
                  width: 400,
                ),
                // const SizedBox(width: 20),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '이준선',
                      style: titleTextStyle,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Github: https://github.com/nx006\n'
                      'Blog: https://nx006.tistory.com/\n'
                      'B612 Mobile session\n\n'
                      '칵테일 좋아합니다',
                      style: bodyTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
