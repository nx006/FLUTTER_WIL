import 'package:b612_flutter_presentation/component/next_page_floating_button.dart';
import 'package:b612_flutter_presentation/component/prev_page_floating_button.dart';
import 'package:b612_flutter_presentation/layout/title_body_layout.dart';
import 'package:b612_flutter_presentation/view/3_why_flutter.dart';
import 'package:b612_flutter_presentation/view/4_flutter_structure.dart';
import 'package:flutter/material.dart';

class CrossPlatformPage extends StatefulWidget {
  static String get routeName => 'crossPlatformPage';

  const CrossPlatformPage({super.key});

  @override
  State<CrossPlatformPage> createState() => _CrossPlatformPageState();
}

class _CrossPlatformPageState extends State<CrossPlatformPage> {
  int _index = 0;
  final _images = <AssetImage>[
    const AssetImage(
      'assets/images/flutter_swift_kotlin.jpeg',
    ),
    const AssetImage(
      'assets/images/cross_platform.jpeg',
    ),
  ];

  Widget showImage() {
    return Image(
      image: _images[_index],
      height: MediaQuery.of(context).size.height * 0.6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TitleBodyLayout(
        prevPageFloatingActionButton: PrevPageFloatingButton(
          routeName: WhyFlutterPage.routeName,
        ),
        nextPageFloatingActionButton: NextPageFloatingButton(
          routeName: FlutterStructurePage.routeName,
        ),
        title: 'Cross Platform Framework란?',
        child: GestureDetector(
          onTap: () {
            setState(() {
              _index >= _images.length - 1 ? _index = 0 : _index++;
            });
          },
          child: showImage(),
        ));
  }
}
