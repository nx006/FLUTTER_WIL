import 'package:flutter/material.dart';
import 'package:webtoon/common/layout/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "오늘의 웹툰",
      child: Center(child: Text('Hello World')),
    );
  }
}
