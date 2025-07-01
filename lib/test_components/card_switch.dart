import 'dart:math';

import 'package:flutter/material.dart';

class SwitcherTest extends StatefulWidget {
  final TestFeature frontWidget;
  final TestFeature backWidget;
  const SwitcherTest(
      {super.key, required this.frontWidget, required this.backWidget});

  @override
  SwitcherTestState createState() => SwitcherTestState();
}

class SwitcherTestState extends State<SwitcherTest> {
  bool isShowingFront = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animations')),
      body: switcherWidget(),
    );
  }

  Widget switcherWidget() {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: isShowingFront ? 0.0 : pi),
      duration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      builder: (context, double value, child) {
        final isShowingBack = value > pi / 2.0;
        final toDisplay =
            isShowingBack ? widget.backWidget : widget.frontWidget;
        return Transform(
          transform: Matrix4.identity()
            ..scale(0.7, 0.7)
            ..rotateY(value),
          alignment: Alignment.center,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(isShowingBack ? pi : 0.0),
            child: toDisplay,
          ),
        );
      },
    );
  }
}

class TestFeature extends StatelessWidget {
  final String imageUrl;
  final RichText text;
  //final Face face;
  final VoidCallback onTapped;

  const TestFeature({
    Key? key,
    required this.imageUrl,
    required this.text,
    //required this.face,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthMultiplier = 1.0;

    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 350) {
      widthMultiplier = 0.42;
    } else if (screenWidth < 500) {
      widthMultiplier = 0.5;
    } else if (screenWidth < 600) {
      widthMultiplier = 0.8;
    }

    return GestureDetector(
      onTap: onTapped,
      child: Padding(
        padding: EdgeInsets.only(right: 20 * widthMultiplier),
        child: Container(
          margin: const EdgeInsets.only(top: 40, left: 0),
          width: 243.2 * widthMultiplier,
          height: 428 * widthMultiplier,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(238, 238, 224, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 8 * widthMultiplier,
                  right: 8 * widthMultiplier,
                  top: 40 * widthMultiplier,
                  bottom: 8 * widthMultiplier,
                ),
                child: ClipOval(
                  child: Container(
                    width: 200 * widthMultiplier,
                    height: 200 * widthMultiplier,
                    color: const Color.fromRGBO(153, 168, 143, 1),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(15 * widthMultiplier),
                        child: Container(
                          width: 180 * widthMultiplier,
                          height: 180 * widthMultiplier,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(imageUrl),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20 * widthMultiplier,
              ),
              Padding(
                padding: EdgeInsets.all(16 * widthMultiplier),
                child: text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
