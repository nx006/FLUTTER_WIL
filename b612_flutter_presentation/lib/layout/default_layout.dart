import 'package:flutter/material.dart';

import 'package:b612_flutter_presentation/const/colors.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final String? title;
  final Widget? bottomNavigationBar;
  final Widget? nextPageFloatingActionButton;
  final Widget? prevPageFloatingActionButton;

  const DefaultLayout({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.title,
    this.bottomNavigationBar,
    this.nextPageFloatingActionButton,
    this.prevPageFloatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? kBackgroundColor,
      appBar: renderAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          child,
          if (prevPageFloatingActionButton != null)
            Align(
              alignment: Alignment.bottomLeft,
              child: prevPageFloatingActionButton!,
            ),
          if (nextPageFloatingActionButton != null)
            Align(
              alignment: Alignment.bottomRight,
              child: nextPageFloatingActionButton!,
            ),
        ]),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  AppBar? renderAppBar() {
    return title == null
        ? null
        : AppBar(
            backgroundColor: Colors.white,
            elevation: 0, // 앞으로 튀어나온 효과 제거, 최신 트렌드임
            title: Text(
              title!,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            foregroundColor: Colors.black, // 글자 색상
          );
  }
}
