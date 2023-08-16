// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:b612_flutter_presentation/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Color? backgroundColor;
  final String routeName;
  final VoidCallback? onPressed;
  final IconData icon;

  const CustomFloatingActionButton({
    Key? key,
    this.backgroundColor,
    required this.routeName,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed ??
          () {
            context.goNamed(routeName);
          },
      elevation: 0,
      backgroundColor: backgroundColor ?? kBackgroundColor,
      child: Icon(icon),
    );
  }
}
