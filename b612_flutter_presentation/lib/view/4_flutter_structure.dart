import 'package:b612_flutter_presentation/component/custom_text_field_widget.dart';
import 'package:b612_flutter_presentation/component/next_page_floating_button.dart';
import 'package:b612_flutter_presentation/component/prev_page_floating_button.dart';
import 'package:b612_flutter_presentation/layout/title_body_layout.dart';
import 'package:b612_flutter_presentation/view/3_why_flutter.dart';
import 'package:b612_flutter_presentation/view/5_flutter_engine.dart';
import 'package:b612_flutter_presentation/view/cross_platform_page.dart';
import 'package:flutter/material.dart';

class FlutterStructurePage extends StatelessWidget {
  static String get routeName => 'flutterStructurePage';

  const FlutterStructurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TitleBodyLayout(
      title: 'Flutter Structure',
      subTitle: 'Flutter의 구조 알아보기',
      prevPageFloatingActionButton: PrevPageFloatingButton(
        routeName: CrossPlatformPage.routeName,
      ),
      nextPageFloatingActionButton: NextPageFloatingButton(
        routeName: FlutterEnginePage.routeName,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Contents
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/archdiagram.png',
                      width: MediaQuery.of(context).size.width * 0.5),
                  SingleChildScrollView(
                    physics: const ClampingScrollPhysics(
                        parent: NeverScrollableScrollPhysics()),
                    child: Column(
                      children: [
                        CustomTextField(
                          width: MediaQuery.of(context).size.width * 0.45,
                          title: 'Framework',
                          text:
                              'Framework 단은 Dart 언어로 Flutter framework를 이용해서 UI와 비즈니스 로직 등을 구현하는 곳입니다.\n\n'
                              'Flutter 개발을 한다고 했을 때 이곳에서 개발이 이루어집니다. 다양한 Flutter Widget들을 사용할 수 있습니다.',
                        ),
                        CustomTextField(
                          width: MediaQuery.of(context).size.width * 0.45,
                          title: 'Engine',
                          text: '모든 것을 Dart 언어로 개발할 수는 없습니다.'
                              '1초에 60번 화면을 렌더링해야 임무를 가진 Flutter의 핵심 엔진은 고성능 프로그래밍 언어인 C/C++로 개발이 되어 있습니다.\n\n'
                              'Engine 계층은 Flutter의 위젯 트리를 실제 눈에 보이는 화면으로 그려내는데 핵심이 되는 계층입니다.'
                              '이곳에서 Flutter의 모든 프레임들을 실제로 그려내는 역할을 수행합니다.\n\n'
                              'dart:ui 라이브러리를 통해서 Primitive 코드를 래핑하는 Dart 코드를 직접 확인해볼 수 있습니다.',
                        ),
                        CustomTextField(
                          width: MediaQuery.of(context).size.width * 0.45,
                          title: 'Embedder',
                          text: '플랫폼에 맞추어서 실제 네이티브 코드를 실행하는 층입니다.'
                              'Engine 계층에서 Embedder 계층으로 어떻게 화면을 그려내야 할 지를 명령하면,'
                              '각 플랫폼에 맞추어서 개발이 된 Embedder에서 화면을 그려냅니다. ',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
