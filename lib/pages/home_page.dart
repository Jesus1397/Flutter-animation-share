import 'package:flutter/material.dart';
import 'package:myapp/widgets/option_bar_widget.dart';
import 'package:myapp/widgets/share_button_widget.dart';

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
        curve: const Interval(0.35, 1.0, curve: Curves.bounceOut),
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
