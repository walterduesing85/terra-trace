import 'package:flutter/material.dart';

class FeatureMobile extends StatefulWidget {
  final String imageUrl;
  final RichText text;
  final double constraints;

  const FeatureMobile({
    Key? key,
    required this.imageUrl,
    required this.text,
    required this.constraints,
  }) : super(key: key);

  @override
  FeatureMobileState createState() => FeatureMobileState();
}

class FeatureMobileState extends State<FeatureMobile> {
  double widthMultiplier = 1.0;

  @override
  void initState() {
    super.initState();
    updateWidthMultiplier();
  }

  void updateWidthMultiplier() {
    setState(() {
      if (widget.constraints < 350) {
        widthMultiplier = 0.7;
      } else if (widget.constraints < 370) {
        widthMultiplier = 0.85;
      } else if (widget.constraints < 400) {
        widthMultiplier = 0.9;
      } else {
        widthMultiplier = 1.0; // Reset to default if not below 600 or 400
      }
    });
  }

  @override
  void didUpdateWidget(covariant FeatureMobile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.constraints != oldWidget.constraints) {
      updateWidthMultiplier();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 170 * widthMultiplier,
        height: 300 * widthMultiplier,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 238, 238, 233),
            width: 5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
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
                  top: 33 * widthMultiplier,
                  bottom: 8 * widthMultiplier),
              child: ClipOval(
                child: Container(
                  width: 135 * widthMultiplier,
                  height: 135 * widthMultiplier,
                  color: const Color.fromRGBO(153, 168, 143, 1),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(
                        15 * widthMultiplier,
                      ),
                      child: Container(
                        width: 120 * widthMultiplier,
                        height: 120 * widthMultiplier,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(widget.imageUrl),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10 * widthMultiplier),
              child: widget.text,
            ),
          ],
        ),
      ),
    );
  }
}
