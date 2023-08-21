// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:b612_flutter_presentation/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final String routeName;
  final IconData icon;
  final Color? backgroundColor;

  const CustomFloatingActionButton({
    super.key,
    this.backgroundColor,
    required this.routeName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.goNamed(routeName),
      elevation: 0,
      backgroundColor: backgroundColor ?? kBackgroundColor,
      child: Icon(icon),
    );
  }
}
