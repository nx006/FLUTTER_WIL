// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:b612_flutter_presentation/view/4_flutter_structure.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:b612_flutter_presentation/component/next_page_floating_button.dart';
import 'package:b612_flutter_presentation/component/prev_page_floating_button.dart';
import 'package:b612_flutter_presentation/const/font_styles.dart';
import 'package:b612_flutter_presentation/layout/default_layout.dart';
import 'package:b612_flutter_presentation/view/explain_me_page.dart';

class WhyFlutterPage extends StatelessWidget {
  static String get routeName => 'whyFlutterPage';

  const WhyFlutterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final innerController = ScrollController();

    return DefaultLayout(
      prevPageFloatingActionButton:
          PrevPageFloatingButton(routeName: ExplainMePage.routeName),
      nextPageFloatingActionButton:
          NextPageFloatingButton(routeName: FlutterStructurePage.routeName),
      child: Center(
        child: Expanded(
          child: Listener(
            onPointerSignal: (event) {
              if (event is PointerScrollEvent) {
                final offset = event.scrollDelta.dy;
                innerController.jumpTo(innerController.offset + offset);
              }
            },
            child: SingleChildScrollView(
              controller: innerController,
              physics: const ClampingScrollPhysics(
                  parent: NeverScrollableScrollPhysics()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/flutter/icon_flutter/icon_flutter.png',
                        width: 100,
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Why Flutter?',
                            style: titleTextStyle,
                          ),
                          Text(
                            '왜 Flutter인가',
                            style: bodyTextStyle,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const _Content(
                          title: Text(
                            'Cross Platform Framework',
                            style: titleTextStyle,
                          ),
                          body: Text(
                            'Available on Android, iOS, Web, Windows, macOS, Linux, Rasberry Pi\n(Stable Release)\n\n'
                            '한 개의 코드 베이스로 다양한 플랫폼(특히 안드로이드와 iOS)을 동시에 지원할 수 있다.\n\n'
                            'Flutter Engine(Skia, Impeller)가 각 플랫폼에 빌트인되어 화면을 그려낸다',
                            style: bodyTextStyle,
                          ),
                        ),
                        _Content(
                          title: Row(
                            children: [
                              const Text('Dart Language',
                                  style: titleTextStyle),
                              const SizedBox(width: 10),
                              Image.asset(
                                'assets/images/dart_logo.png',
                                height: 40,
                              )
                            ],
                          ),
                          body: const Text(
                            'Dart 언어는 2011년 구글에서 개발된, JavaScript를 대체하기 위한 모던 프로그래밍 언어\n\n'
                            'OOP, Funtional, Async 등을 완벽히 지원하며, 100% Sound Null Safety를 지원하는 매우 현대적이고 세련된 언어\n\n'
                            'Flutter는 Dart 언어를 사용하여 개발한다\n\n'
                            'AOT, JIT 컴파일을 지원하며, 특히 JIT는 Flutter의 핵심 기능인 Hot Reload를 가능하게 한다.'
                            '현재 Dart 3가 Stable Release됨',
                            style: bodyTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _Content(
                          title: Text(
                            'Google Support & Open Source',
                            style: titleTextStyle,
                          ),
                          body: Text(
                            '100% 오픈소스로 개발되어, 누구나 Flutter의 발전에 기여할 수 있다\n\n'
                            'Google에서 매우 공을 들이는 프로젝트이자 Framework\n\n'
                            '이미 많은 구글 제품들이 Flutter로 마이그레이션되었다\n\n'
                            '현재 Flutter 3.10 버전이 Stable Release됨\n\n'
                            '구글의 Zircon 기반 차세대 OS Fushia의 공식 UI Framework로 채택될 예정',
                            style: bodyTextStyle,
                          ),
                        ),
                        _Content(
                          title: Text(
                            'Hot Reload & Hot Restart',
                            style: titleTextStyle,
                          ),
                          body: Text(
                            'Flutter의 빠른 개발 속도와 DX의 핵심은 Hot Reload와 Hot Restart\n\n'
                            'DX를 저하시키는 요인인, 코드를 수정하고, 이를 다시 컴파일하여 시뮬레이터/에뮬레이터에 밀어넣고, 앱을 다시 시작하는 번거로운 과정을 거치지 않아도 된다\n\n'
                            'Dart 언어의 JIT 컴파일 기술을 이용해서, 수정된 변경 사항을 기존의 코드에 빠르게 Injection할 수 있다',
                            style: bodyTextStyle,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final Widget title;
  final Widget body;

  const _Content({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            const SizedBox(height: 20),
            body,
          ],
        ),
      ),
    );
  }
}
