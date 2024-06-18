import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButtonWidget extends StatelessWidget {
  final double buttonSize;
  final Color? color;
  final IconData icon;

  const SocialButtonWidget(
      {super.key,
      required this.buttonSize,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: FaIcon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
