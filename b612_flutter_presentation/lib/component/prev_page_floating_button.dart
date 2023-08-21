import 'package:b612_flutter_presentation/component/custom_floating_action_button.dart';
import 'package:b612_flutter_presentation/const/colors.dart';
import 'package:flutter/material.dart';

class PrevPageFloatingButton extends StatelessWidget {
  final String routeName;

  const PrevPageFloatingButton({
    Key? key,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFloatingActionButton(
      routeName: routeName,
      icon: Icons.arrow_back_ios,
      backgroundColor: kBackgroundColor,
    );
  }
}
