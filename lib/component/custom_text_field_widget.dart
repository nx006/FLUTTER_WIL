// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:b612_flutter_presentation/const/colors.dart';
import 'package:b612_flutter_presentation/const/font_styles.dart';

/// [title]: 텍스트 위젯의 제목 (없으면 표시하지 않음)
/// [text]: 텍스트 위젯의 내용
/// [bodyColor]: 텍스트 위젯의 색상 (없으면 기본 색상)
///
class CustomTextField extends StatelessWidget {
  final String? title;
  final String text;
  final Color? bodyColor;
  final double? height;
  final double? width;

  const CustomTextField({
    Key? key,
    this.title,
    required this.text,
    this.bodyColor,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: bodyColor ?? kBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Text(
                title!,
                style: titleTextStyle,
              ),
            const SizedBox(height: 5),
            Text(
              text,
              style: bodyTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
