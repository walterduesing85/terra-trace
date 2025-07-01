import 'package:flutter/material.dart';

class Features extends StatefulWidget {
  final String imageUrl;
  final RichText text;
  final double constraints;

  const Features({
    Key? key,
    required this.imageUrl,
    required this.text,
    required this.constraints,
  }) : super(key: key);

  @override
  FeaturesState createState() => FeaturesState();
}

class FeaturesState extends State<Features> {
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
      } else if (widget.constraints < 650) {
        widthMultiplier = 0.7;
      } else if (widget.constraints < 800) {
        widthMultiplier = 0.8;
      } else {
        widthMultiplier = 1.0; // Reset to default if not below 600 or 400
      }
    });
  }

  @override
  void didUpdateWidget(covariant Features oldWidget) {
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
        width: 304 * widthMultiplier,
        height: 535 * widthMultiplier,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 238, 238, 233),
            width: 5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
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
                  top: 40 * widthMultiplier,
                  bottom: 8 * widthMultiplier),
              child: ClipOval(
                child: Container(
                  width: 200 * widthMultiplier,
                  height: 200 * widthMultiplier,
                  color: const Color.fromRGBO(153, 168, 143, 1),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(
                        15 * widthMultiplier,
                      ),
                      child: Container(
                        width: 180 * widthMultiplier,
                        height: 180 * widthMultiplier,
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
            SizedBox(
              height: 20 * widthMultiplier,
            ),
            Padding(
              padding: EdgeInsets.all(16 * widthMultiplier),
              child: widget.text,
            ),
          ],
        ),
      ),
    );
  }
}
