// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:b612_flutter_presentation/const/colors.dart';

class NextPageFloatingButton extends StatelessWidget {
  final Color? backgroundColor;
  final String routeName;
  final VoidCallback? onPressed;

  /// gorouter 이름

  const NextPageFloatingButton({
    Key? key,
    this.backgroundColor,
    required this.routeName,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed ??
          () {
            context.goNamed(routeName);
          },
      backgroundColor: kPrimaryColor,
      child: const Icon(Icons.arrow_forward_ios),
    );
  }
}
