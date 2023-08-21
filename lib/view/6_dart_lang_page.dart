import 'package:b612_flutter_presentation/component/custom_text_field_widget.dart';
import 'package:b612_flutter_presentation/component/prev_page_floating_button.dart';
import 'package:b612_flutter_presentation/const/colors.dart';
import 'package:b612_flutter_presentation/layout/title_body_layout.dart';
import 'package:b612_flutter_presentation/view/5_flutter_engine.dart';
import 'package:flutter/material.dart';

class DartLangPage extends StatelessWidget {
  static String get routeName => 'dartLangPage';

  const DartLangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TitleBodyLayout(
      prevPageFloatingActionButton:
          PrevPageFloatingButton(routeName: FlutterEnginePage.routeName),
      title: 'Dart Language',
      subTitle: 'Dart 언어의 특징',
      image: Image.asset('assets/images/dart_logo.png', height: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTextField(
            width: MediaQuery.of(context).size.width * 0.48,
            title: '모든 것이 객체로 이루어져 있다',
            text: 'Dart 언어는 모든 것이 객체로 이루어져 있습니다.\n'
                '심지어 int, double, bool 등의 Primitive Type 역시 객체로 이루어져 있습니다.\n'
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
    );
  }
}
