import 'dart:math';

import 'package:flutter/material.dart';

class SwitcherTestExample extends StatefulWidget {
  final double fontSize;
  const SwitcherTestExample({Key? key, required this.fontSize})
      : super(key: key);
  @override
  SwitcherTestExampleState createState() => SwitcherTestExampleState();
}

class SwitcherTestExampleState extends State<SwitcherTestExample> {
  bool _isShowingFront1 = true;
  bool _isShowingFront2 = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use SwitcherTest widget and pass front and back TestFeature widgets
            SwitcherTest(
              frontWidget: TestFeature(
                imageUrl: 'images/share.png',
                text: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Fabric-sans-regular',
                      fontSize: widget.fontSize,
                    ),
                    children: [
                      TextSpan(
                        text: 'Live data sharing',
                        style: TextStyle(
                          fontFamily: 'Fabric-sans-regular',
                          fontSize: widget.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' with team members for collaborative projects',
                        style: TextStyle(
                          fontFamily: 'Fabric-sans-regular',
                          fontSize: widget.fontSize,
                        ),
                      ),
                    ],
                  ),
                ),
                onTapped: () {
                  // Handle tap on the front TestFeature
                  setState(() {
                    _isShowingFront1 = false;
                  });
                },
              ),
              backWidget: TestFeature(
                imageUrl: 'images/walter_image.png',
                text: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Fabric-sans-regular',
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Live data sharing',
                        style: TextStyle(
                          fontFamily: 'Fabric-sans-regular',
                          fontSize: widget.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' with team members for collaborative projects',
                        style: TextStyle(
                          fontFamily: 'Fabric-sans-regular',
                          fontSize: widget.fontSize,
                        ),
                      ),
                    ],
                  ),
                ),
                onTapped: () {
                  // Handle tap on the back TestFeature
                  setState(() {
                    _isShowingFront1 = true;
                  });
                },
              ),
              isShowingFront: _isShowingFront1,
            ),
            SwitcherTest(
              frontWidget: TestFeature(
                imageUrl: 'images/share.png',
                text: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Fabric-sans-regular',
                      fontSize: widget.fontSize,
                    ),
                    children: [
                      TextSpan(
                        text: 'Live data sharing',
                        style: TextStyle(
                          fontFamily: 'Fabric-sans-regular',
                          fontSize: widget.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' with team members for collaborative projects',
                        style: TextStyle(
                          fontFamily: 'Fabric-sans-regular',
                          fontSize: widget.fontSize,
                        ),
                      ),
                    ],
                  ),
                ),
                onTapped: () {
                  // Handle tap on the front TestFeature
                  setState(() {
                    _isShowingFront2 = false;
                  });
                },
              ),
              backWidget: TestFeature(
                imageUrl: 'images/walter_image.png',
                text: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Fabric-sans-regular',
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Live data sharing',
                        style: TextStyle(
                          fontFamily: 'Fabric-sans-regular',
                          fontSize: widget.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' with team members for collaborative projects',
                        style: TextStyle(
                          fontFamily: 'Fabric-sans-regular',
                          fontSize: widget.fontSize,
                        ),
                      ),
                    ],
                  ),
                ),
                onTapped: () {
                  // Handle tap on the back TestFeature
                  setState(() {
                    _isShowingFront2 = true;
                  });
                },
              ),
              isShowingFront: _isShowingFront2,
            )
          ],
        ),
      ),
    );
  }
}

class SwitcherTest extends StatefulWidget {
  final TestFeature frontWidget;
  final TestFeature backWidget;
  final bool isShowingFront;

  const SwitcherTest({
    Key? key,
    required this.frontWidget,
    required this.backWidget,
    required this.isShowingFront,
  }) : super(key: key);

  @override
  SwitcherTestState createState() => SwitcherTestState();
}

class SwitcherTestState extends State<SwitcherTest> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: widget.isShowingFront ? 0.0 : 1.0),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      builder: (context, double value, child) {
        return Transform(
          transform: Matrix4.identity()..rotateY(value * pi),
          alignment: Alignment.center,
          child: value < 0.5 ? widget.frontWidget : widget.backWidget,
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
