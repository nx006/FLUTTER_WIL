// ignore_for_file: file_names

import 'package:b612_flutter_presentation/component/next_page_floating_button.dart';
import 'package:b612_flutter_presentation/component/prev_page_floating_button.dart';
import 'package:b612_flutter_presentation/const/font_styles.dart';
import 'package:b612_flutter_presentation/layout/title_body_layout.dart';
import 'package:b612_flutter_presentation/view/4_flutter_structure.dart';
import 'package:b612_flutter_presentation/view/6_dart_lang_page.dart';
import 'package:flutter/material.dart';

class FlutterEnginePage extends StatelessWidget {
  static String get routeName => 'flutterEngine';

  const FlutterEnginePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TitleBodyLayout(
      title: 'Flutter Engine',
      prevPageFloatingActionButton: PrevPageFloatingButton(
        routeName: FlutterStructurePage.routeName,
      ),
      nextPageFloatingActionButton: NextPageFloatingButton(
        routeName: DartLangPage.routeName,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContent(
            image: Image.asset(
              'assets/images/skia_logo.png',
              width: MediaQuery.of(context).size.width * 0.45,
            ),
            title: 'Skia Engine',
            body: 'C/C++로 만들어진 2D 그래픽 렌더링 엔진\n'
                '현재 iOS를 제외한 모든 플랫폼이 SKIA를 채용 중',
          ),
          _buildContent(
            image: Image.asset(
              'assets/images/impeller.png',
              width: MediaQuery.of(context).size.width * 0.45,
            ),
            title: 'Impeller Engine',
            body: 'Flutter 3.10부터 도입된, 차세대 3D 그래픽 렌더링 엔진\n'
                'iOS에 Stable Release되어 Default로 적용\n'
                '이후 Android 등의 플랫폼에서도 Impeller로 변경될 예정',
          ),
        ],
      ),
    );
  }

  Widget _buildContent({
    required Image image,
    String? title,
    String? body,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        image,
        if (title != null)
          Text(
            title,
            style: titleTextStyle,
          ),
        if (body != null)
          Text(
            body,
            style: bodyTextStyle,
          ),
      ],
    );
  }
}
