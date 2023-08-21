// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:b612_flutter_presentation/const/font_styles.dart';
import 'package:flutter/material.dart';

import 'package:b612_flutter_presentation/layout/default_layout.dart';

class TitleBodyLayout extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget? nextPageFloatingActionButton;
  final Widget? prevPageFloatingActionButton;
  final Widget child;

  /// image asset
  final Image? image;

  const TitleBodyLayout({
    Key? key,
    required this.title,
    this.subTitle,
    this.nextPageFloatingActionButton,
    this.prevPageFloatingActionButton,
    required this.child,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      nextPageFloatingActionButton: nextPageFloatingActionButton,
      prevPageFloatingActionButton: prevPageFloatingActionButton,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle(),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (image != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: image!,
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: bigTitleTextStyle,
            ),
            if (subTitle != null)
              Text(
                subTitle!,
                style: bodyTextStyle,
              )
          ],
        ),
      ],
    );
  }
}
