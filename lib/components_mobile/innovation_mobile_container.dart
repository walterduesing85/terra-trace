import 'package:flutter/material.dart';
import 'package:terra_trace_home_page/constants/layout.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';

class InnovationMobileContainer extends StatelessWidget {
  final double constraints;

  const InnovationMobileContainer({
    Key? key,
    required this.constraints,
  }) : super(key: key);

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
                  'INNOVATION',
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'Fabric-sans-regular',
                  ),
                ),
              ),
            ),

            // Heading
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                'Powered by AI',
                style: headingMobile,
              ),
            ),

            // Centered Column for RichText widgets
            Container(
              constraints: const BoxConstraints(maxHeight: 300),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                        style: paragraphMobile,
                        children: [
                          TextSpan(
                            text: 'TerraTrace uses an AI-driven ',
                          ),
                          TextSpan(
                            text: 'earth respiration model',
                            style: paragraphMobileBold,
                          ),
                          TextSpan(
                            text:
                                ' which combines atmospheric and satellite data with soil gas monitoring and survey data to predict the accuracy of measurements at any location or time.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 5), // Add spacing between RichText widgets
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'This allows researchers to study soil gas emissions more efficiently and accurately.',
                      textAlign: TextAlign.left,
                      style: paragraphMobile,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
