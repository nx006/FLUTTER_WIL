import 'package:b612_flutter_presentation/component/prev_page_floating_button.dart';
import 'package:b612_flutter_presentation/const/font_styles.dart';
import 'package:b612_flutter_presentation/layout/default_layout.dart';
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
                Container(
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '이준선',
                        style: titleTextStyle,
                      ),
                      Text(
                        'Github: https://github.com/nx006',
                        style: bodyTextStyle,
                      ),
                      Text(
                        'Blog: https://nx006.tistory.com/',
                        style: bodyTextStyle,
                      ),
                      Text(
                        'B612 Mobile session',
                        style: bodyTextStyle,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
