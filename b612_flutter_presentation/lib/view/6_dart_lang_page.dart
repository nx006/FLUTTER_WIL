// ignore_for_file: file_names

import 'package:b612_flutter_presentation/component/custom_text_field_widget.dart';
import 'package:b612_flutter_presentation/component/next_page_floating_button.dart';
import 'package:b612_flutter_presentation/component/prev_page_floating_button.dart';
import 'package:b612_flutter_presentation/layout/title_body_layout.dart';
import 'package:b612_flutter_presentation/view/5_flutter_engine.dart';
import 'package:b612_flutter_presentation/view/homepage.dart';
import 'package:flutter/material.dart';

class DartLangPage extends StatelessWidget {
  static String get routeName => 'dartLangPage';

  const DartLangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TitleBodyLayout(
      prevPageFloatingActionButton:
          PrevPageFloatingButton(routeName: FlutterEnginePage.routeName),
      nextPageFloatingActionButton: NextPageFloatingButton(
        routeName: HomePage.routeName,
      ),
      title: 'Dart Language',
      subTitle: 'Dart 언어의 특징',
      image: Image.asset('assets/images/dart_logo.png', height: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                width: MediaQuery.of(context).size.width * 0.48,
                title: 'Everything is an Object',
                text: 'Dart 언어는 모든 것이 객체로 이루어져 있습니다.\n\n'
                    '심지어 int, double, bool 등의 Primitive Type 역시 객체로 이루어져 있습니다.\n'
                    '따라서 Primitive 타입을 사용할 때에도 미리 정의된 메소드를 바로 이용할 수 있습니다.\n\n'
                    'Dart에서 객체가 아닌 것은 단 하나, null 뿐입니다.',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    width: MediaQuery.of(context).size.width * 0.48,
                    title: '100% Sound Null Safety',
                    text:
                        'Dart는 100% Sound Null Safety를 지원하여, null 관련 실수를 철저히 방지합니다.\n'
                        '만약에 Null을 Dart에서 사용하고 싶다면, `?`를 붙여서 nullable type 임을 명시해야 합니다.',
                  ),
                  CustomTextField(
                    bodyColor: Colors.blueGrey.shade100,
                    text: 'String? name = null; /// Can be null',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                width: MediaQuery.of(context).size.width * 0.48,
                title: 'Functional',
                text: 'Dart는 함수형 프로그래밍을 지원합니다.\n'
                    'Dart에서 함수는 일급 객체로 취급되며, Funcional에 필요한 모든 기능을 지원합니다.\n',
              ),
              CustomTextField(
                width: MediaQuery.of(context).size.width * 0.48,
                title: 'final & const',
                text: 'Dart는 타입 추론 기능을 지원합니다(var, final, const).\n\n'
                    '또한 Dart는 Immutable programming을 권장하기 때문에 final을 사용합니다.\n'
                    'final은 타 언어에서 const로 사용되는 키워드입니다.\n\n'
                    'const는 컴파일 상수로, C++의 `constexpr`과 같은 키워드입니다.\n\n',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
