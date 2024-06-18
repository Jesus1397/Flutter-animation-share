import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShareButtonWidget extends StatefulWidget {
  final Function onTap;
  final double width;

  const ShareButtonWidget(
      {super.key, required this.onTap, required this.width});

  @override
  State<ShareButtonWidget> createState() => _ShareButtonWidgetState();
}

class _ShareButtonWidgetState extends State<ShareButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: widget.width,
        height: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffE04B7D),
              Color(0xff8B53C2),
            ],
          ),
        ),
        child: const Center(
          child: FaIcon(
            FontAwesomeIcons.shareNodes,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
