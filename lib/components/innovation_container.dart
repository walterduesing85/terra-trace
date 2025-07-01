import 'package:flutter/material.dart';
import 'package:terra_trace_home_page/constants/layout.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';

class InnovationContainer extends StatelessWidget {
  final double constraints;

  const InnovationContainer({Key? key, required this.constraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(padding),
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
                  'INNOVATION',
                  style: topBoxTextStyle,
                ),
              ),
            ),

            // Heading
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Powered by AI', style: heading),
            ),

            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 252,
                    width: 520,
                    child: RichText(
                      text: const TextSpan(
                        style: paragraph,
                        children: [
                          TextSpan(
                            text: 'TerraTrace uses an AI-driven ',
                          ),
                          TextSpan(
                            text: 'earth respiration model',
                            style: paragraphBold,
                          ),
                          TextSpan(
                            text:
                                ' which combines atmospheric and satellite data with soil gas monitoring and survey data to predict the accuracy of measurements at any location or time.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 128,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 252,
                    width: 520,
                    child: Text(
                        'This allows researchers to study soil gas emissions more efficiently and accurately.',
                        style: paragraph),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
