import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'package:terra_trace_home_page/components/back_side_feature.dart';
import 'package:terra_trace_home_page/components/features.dart';
import 'package:terra_trace_home_page/constants/layout.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';
import 'package:terra_trace_home_page/text/back_feature_text.dart';

class FeatureContainer extends StatefulWidget {
  final double constraints;

  const FeatureContainer({Key? key, required this.constraints})
      : super(key: key);

  @override
  State<FeatureContainer> createState() => _FeatureContainerState();
}

bool selected = false;

class _FeatureContainerState extends State<FeatureContainer> {
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
      } else if (widget.constraints < 650) {
        widthMultiplier = 0.8;
      } else if (widget.constraints < 800) {
        widthMultiplier = 0.9;
      } else {
        widthMultiplier = 1.0; // Reset to default if not below 600 or 400
      }
    });
  }

  @override
  void didUpdateWidget(covariant FeatureContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.constraints != oldWidget.constraints) {
      updateWidthMultiplier();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rounded Container
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(paddingEyebrowHeader),
                child: Text(
                  'FEATURES',
                  style: topBoxTextStyle,
                ),
              ),
            ),

            // Heading
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'What TerraTrace AI has to offer',
                style: heading,
              ),
            ),

            // Responsive Row or Column based on screen width
            widget.constraints < 1450
                ? // If screen width is less than 600, show features in a column
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Features(
                            constraints: widget.constraints,
                            imageUrl: 'images/satelite_01.png',
                            text: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: features.copyWith(
                                  fontSize: 24 * widthMultiplier,
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Real-time access to ',
                                  ),
                                  TextSpan(
                                    text: 'satellite data',
                                    style: featuresBold.copyWith(
                                      fontSize: 24 * widthMultiplier,
                                    ),
                                  ),
                                  const TextSpan(
                                    text:
                                        ' such as digital elevation models and spectral imagery',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = !selected;
                              });
                            },
                            child: FlipCard(
                              back: BackSideFeatures(
                                  imageUrl: 'images/satelite_backside.png',
                                  text: sateliteBackSide,
                                  constraints: widget.constraints),
                              fill: Fill
                                  .fillBack, // Fill the back side of the card to make in the same size as the front.
                              direction: FlipDirection.HORIZONTAL, // default
                              side: CardSide.FRONT,
                              front: Features(
                                constraints: widget.constraints,
                                imageUrl: 'images/share.png',
                                text: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: features.copyWith(
                                      fontSize: 24 * widthMultiplier,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Live data sharing',
                                        style: featuresBold.copyWith(
                                          fontSize: 24 * widthMultiplier,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            ' with team members for collaborative projects',
                                        style: features.copyWith(
                                          fontSize: 24 * widthMultiplier,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Features(
                            constraints: widget.constraints,
                            imageUrl: 'images/histo.png',
                            text: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: features
                                    .copyWith(
                                      fontSize: 24 * widthMultiplier,
                                    )
                                    .copyWith(
                                      fontSize: 24 * widthMultiplier,
                                    ),
                                children: [
                                  TextSpan(
                                    text: 'Hands-on ',
                                    style: features.copyWith(
                                      fontSize: 24 * widthMultiplier,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'data visualization ',
                                    style: featuresBold.copyWith(
                                      fontSize: 24 * widthMultiplier,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'and processing',
                                    style: features.copyWith(
                                      fontSize: 24 * widthMultiplier,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Features(
                            constraints: widget.constraints,
                            imageUrl: 'images/icon_01.png',
                            text: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: features.copyWith(
                                  fontSize: 24 * widthMultiplier,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'More reliable and reproducible data with',
                                    style: features.copyWith(
                                      fontSize: 24 * widthMultiplier,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' AI-driven uncertainty estimation',
                                    style: featuresBold.copyWith(
                                      fontSize: 24 * widthMultiplier,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Add more Features widgets as needed
                        ],
                      ),
                    ],
                  )
                : // If screen width is 600 or more, show features in a row
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Features(
                        constraints: widget.constraints,
                        imageUrl: 'images/satelite_01.png',
                        text: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: features.copyWith(
                              fontSize: 24 * widthMultiplier,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Real-time access to ',
                              ),
                              TextSpan(
                                text: 'satellite data',
                                style: featuresBold.copyWith(
                                  fontSize: 24 * widthMultiplier,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    ' such as digital elevation models and spectral imagery',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Features(
                        constraints: widget.constraints,
                        imageUrl: 'images/share.png',
                        text: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: features.copyWith(
                              fontSize: 24 * widthMultiplier,
                            ),
                            children: [
                              TextSpan(
                                text: 'Live data sharing',
                                style: featuresBold.copyWith(
                                    fontSize: 24 * widthMultiplier),
                              ),
                              TextSpan(
                                  text:
                                      ' with team members for collaborative projects',
                                  style: features.copyWith(
                                    fontSize: 24 * widthMultiplier,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Features(
                        constraints: widget.constraints,
                        imageUrl: 'images/histo.png',
                        text: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: features.copyWith(
                              fontSize: 24 * widthMultiplier,
                            ),
                            children: [
                              TextSpan(
                                text: 'Hands-on ',
                                style: features
                                    .copyWith(
                                      fontSize: 24 * widthMultiplier,
                                    )
                                    .copyWith(fontSize: 24 * widthMultiplier),
                              ),
                              TextSpan(
                                text: 'data visualization ',
                                style: featuresBold.copyWith(
                                    fontSize: 24 * widthMultiplier),
                              ),
                              TextSpan(
                                  text: 'and processing',
                                  style: features.copyWith(
                                    fontSize: 24 * widthMultiplier,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Features(
                        constraints: widget.constraints,
                        imageUrl: 'images/icon_01.png',
                        text: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: features.copyWith(
                              fontSize: 24 * widthMultiplier,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    'More reliable and reproducible data with',
                                style: features
                                    .copyWith(
                                      fontSize: 24 * widthMultiplier,
                                    )
                                    .copyWith(fontSize: 24 * widthMultiplier),
                              ),
                              TextSpan(
                                text: ' AI-driven uncertainty estimation',
                                style: featuresBold.copyWith(
                                    fontSize: 24 * widthMultiplier),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Add more Features widgets as needed
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
