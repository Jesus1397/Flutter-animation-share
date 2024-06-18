import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/widgets/social_button_widget.dart';

class OptionBarWidget extends StatefulWidget {
  final double totalWidth;
  final double buttonSize;
  final double bgContainer;
  final double animationValue1;
  final double animationValue2;
  final double buttonsOpacity;

  const OptionBarWidget(
      {super.key,
      required this.totalWidth,
      required this.buttonSize,
      required this.bgContainer,
      required this.animationValue1,
      required this.animationValue2,
      required this.buttonsOpacity});

  @override
  State<OptionBarWidget> createState() => _OptionBarWidgetState();
}

class _OptionBarWidgetState extends State<OptionBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.bgContainer,
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 221, 0, 0),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Opacity(
        opacity: widget.buttonsOpacity,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: widget.animationValue1,
              child: SocialButtonWidget(
                icon: FontAwesomeIcons.basketball,
                color: Colors.pink[600],
                buttonSize: widget.buttonSize,
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: widget.animationValue2,
              child: SocialButtonWidget(
                buttonSize: widget.buttonSize,
                color: const Color(0xFFAB53A3),
                icon: FontAwesomeIcons.instagram,
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: widget.animationValue2,
              child: SocialButtonWidget(
                color: Colors.blue[900],
                icon: FontAwesomeIcons.facebookF,
                buttonSize: widget.buttonSize,
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: widget.animationValue1,
              child: SocialButtonWidget(
                buttonSize: widget.buttonSize,
                color: Colors.blue,
                icon: FontAwesomeIcons.twitter,
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: widget.totalWidth / 2 - widget.buttonSize / 2 - 20,
              child: SocialButtonWidget(
                buttonSize: widget.buttonSize,
                color: Colors.black,
                icon: FontAwesomeIcons.xmark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
