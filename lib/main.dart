import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animationController1;
  late AnimationController animationController2;
  late Animation reduceSizeButton;
  late Animation bgColorButton;
  late Animation opacityAnim;
  late Animation bgContainer;
  late Animation buttonMoveAnim1;
  late Animation buttonMoveAnim2;
  late Animation buttonsOpacity;

  bool showOptions = false;
  double totalWidth = 280.0;
  double buttonSize = 40.0;
  double shareButton = 80.0;

  @override
  void initState() {
    super.initState();

    //Controllers
    animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    //AniamtionController1
    reduceSizeButton = Tween(begin: 80.0, end: 60.0).animate(
      CurvedAnimation(
        parent: animationController1,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    bgColorButton = Tween(begin: 80.0, end: 260.0).animate(
      CurvedAnimation(
        parent: animationController1,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    opacityAnim = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController1,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    //AniamtionController2
    bgContainer = Tween(begin: 80.0, end: 280.0).animate(
      CurvedAnimation(
        parent: animationController2,
        curve: const Interval(0.35, 0.55, curve: Curves.bounceOut),
      ),
    );
    buttonsOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController2,
        curve: const Interval(0.40, 1.0, curve: Curves.linear),
      ),
    );
    buttonMoveAnim1 = Tween(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController2,
        curve: const Interval(0.40, 1.0, curve: Curves.bounceOut),
      ),
    );
    buttonMoveAnim2 = Tween(begin: 100.0, end: 50.0).animate(
      CurvedAnimation(
        parent: animationController2,
        curve: const Interval(0.40, 1.0, curve: Curves.bounceOut),
      ),
    );

    animationController1.forward();
    animationController1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          showOptions = true;
        });
        animationController2.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: AnimatedBuilder(
        animation: animationController1,
        builder: (context, child) {
          return AnimatedBuilder(
              animation: animationController2,
              builder: (context, child) {
                return Center(
                  child: showOptions
                      ? OptionBarWidget(
                          totalWidth: totalWidth,
                          buttonSize: buttonSize,
                          animationValue1: buttonMoveAnim1.value,
                          animationValue2: buttonMoveAnim2.value,
                          bgContainer: bgContainer.value,
                          buttonsOpacity: buttonsOpacity.value,
                        )
                      : Stack(
                          children: [
                            Center(
                              child: Opacity(
                                opacity: opacityAnim.value,
                                child: Container(
                                  width: bgColorButton.value,
                                  height: bgColorButton.value,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200),
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: ShareButtonWidget(
                                onTap: () {},
                                width: reduceSizeButton.value,
                              ),
                            ),
                          ],
                        ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            showOptions = false;
          });
          animationController1.reset();
          animationController2.reset();
          animationController1.forward();
        },
      ),
    );
  }
}

class ShareButtonWidget extends StatefulWidget {


  final Function onTap;
  final double width;

  const ShareButtonWidget({super.key, required this.onTap, required this.width});

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

class OptionBarWidget extends StatefulWidget {
  final double totalWidth;
  final double buttonSize;
  final double bgContainer;
  final double animationValue1;
  final double animationValue2;
  final double buttonsOpacity;

  const OptionBarWidget({super.key, required this.totalWidth, required this.buttonSize, required this.bgContainer, required this.animationValue1, required this.animationValue2, required this.buttonsOpacity});

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
        color: Colors.grey[200],
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

class SocialButtonWidget extends StatelessWidget {


  final double buttonSize;
  final Color? color;
  final IconData icon;

  const SocialButtonWidget({super.key, required this.buttonSize, required this.color, required this.icon});

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