import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';

class BackSideFeatures extends StatefulWidget {
  final String text;
  final double constraints;
  final String imageUrl;

  const BackSideFeatures({
    Key? key,
    required this.imageUrl,
    required this.text,
    required this.constraints,
  }) : super(key: key);

  @override
  BackSideFeaturesState createState() => BackSideFeaturesState();
}

class BackSideFeaturesState extends State<BackSideFeatures> {
  double widthMultiplier = 1.0;

  @override
  void initState() {
    super.initState();
    updateWidthMultiplier();
  }

  void updateWidthMultiplier() {
    setState(() {
      if (widget.constraints < 350) {
        widthMultiplier = 0.42;
      } else if (widget.constraints < 500) {
        widthMultiplier = 0.5;
      } else if (widget.constraints < 600) {
        widthMultiplier = 0.8;
      } else {
        widthMultiplier = 1.0; // Reset to default if not below 600 or 400
      }
    });
  }

  @override
  void didUpdateWidget(covariant BackSideFeatures oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.constraints != oldWidget.constraints) {
      updateWidthMultiplier();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20 * widthMultiplier),
      child: Container(
        margin: const EdgeInsets.only(top: 40, left: 0),
        width: 243.2 * widthMultiplier,
        height: 428 * widthMultiplier,
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            invertColors: true,
            image: AssetImage(widget.imageUrl),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: const Color.fromARGB(255, 238, 238, 233),
            width: 5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
          color: const Color.fromRGBO(238, 238, 224, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  RotateAnimatedText(
                    'Share your data',
                  ),
                  RotateAnimatedText('stay updated in the field',
                      textStyle: featuresBacksideText,
                      textAlign: TextAlign.center,),
                      

                  RotateAnimatedText('always know where your team members are',
                      textStyle: featuresBacksideText,textAlign: TextAlign.center,),
                  RotateAnimatedText('get real-time updates on your project',
                      textStyle: featuresBacksideText,textAlign: TextAlign.center,),
                  RotateAnimatedText('and more...',
                      textStyle: featuresBacksideText,textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
