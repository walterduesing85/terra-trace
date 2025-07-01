import 'package:flutter/material.dart';

import 'package:terra_trace_home_page/components_mobile/feature_mobile.dart';
import 'package:terra_trace_home_page/constants/layout.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';

class FeatureMobileContainer extends StatelessWidget {
  final double constraints;

  const FeatureMobileContainer({Key? key, required this.constraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize() {
      if (constraints < 350) {
        return 10;
      } else if (constraints < 400) {
        return 12;
      }
      return 14;
    }

    return Container(
      padding: const EdgeInsets.all(2),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rounded Container
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(paddingEyebrowHeaderMobile),
                child: Text(
                  'FEATURES',
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'InputMonoNew',
                  ),
                ),
              ),
            ),

            // Heading
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child:
                  Text('What TerraTrace AI has to offer', style: headingMobile),
            ),

            // Responsive Row or Column based on screen width
            // If screen width is less than 600, show features in a column
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FeatureMobile(
                        constraints: constraints,
                        imageUrl: 'images/satelite_01.png',
                        text: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                          
                              TextSpan(
                                text: 'Real-time satellite & ground data:',
                                style: featuresBoldMobile.copyWith(
                                  fontSize: fontSize(),
                                ),
                              ),
                              TextSpan(
                                style: featuresMobile.copyWith(
                                  fontSize: fontSize(),
                                ),
                                text:
                                    ' Access satellite imagery and elevation models.',
                              ),
                            ],
                          ),
                        ),
                      ),
                      FeatureMobile(
                        constraints: constraints,
                        imageUrl: 'images/share.png',
                        text: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Live data sharing',
                                style: featuresBoldMobile.copyWith(
                                  fontSize: fontSize(),
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' Sync fluxmeter and app data instantly across teams while you are in the field.',
                                style: featuresMobile.copyWith(
                                  fontSize: fontSize(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FeatureMobile(
                        constraints: constraints,
                        imageUrl: 'images/histo.png',
                        text: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: featuresMobile.copyWith(
                              fontSize: fontSize(),
                            ),
                            children: [
                         
                              TextSpan(
                                text: 'Field-ready visualisation:',
                                style: featuresBoldMobile.copyWith(
                                  fontSize: fontSize(),
                                ),
                              ),
                              TextSpan(
                                text: ' Visualise emissions trends directly on the app.',

                                style: featuresMobile.copyWith(
                                  fontSize: fontSize(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FeatureMobile(
                        constraints: constraints,
                        imageUrl: 'images/icon_01.png',
                        text: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: featuresMobile.copyWith(
                              fontSize: fontSize(),
                            ),
                            children: [
                         
                              TextSpan(
                                text: 'Reliable, AI-enhanced insights:',
                                style: featuresBoldMobile.copyWith(
                                  fontSize: fontSize(),
                                ),
                              ),
                                TextSpan(
                                text:
                                    'Get more accurate results with real-time uncertainty estimation.',
                                style: featuresMobile.copyWith(
                                  fontSize: fontSize(),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
