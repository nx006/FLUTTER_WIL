// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:b612_flutter_presentation/component/custom_floating_action_button.dart';
import 'package:flutter/material.dart';

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
    return CustomFloatingActionButton(
      routeName: routeName,
      icon: Icons.arrow_forward_ios,
      backgroundColor: backgroundColor,
      onPressed: onPressed,
    );
  }
}
