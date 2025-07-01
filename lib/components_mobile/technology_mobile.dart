import 'package:flutter/material.dart';
import 'package:terra_trace_home_page/constants/layout.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';

class TechnologyMobile extends StatelessWidget {
  final double constraints;
  const TechnologyMobile({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rounded Container
          Padding(
            padding: const EdgeInsets.only(top: 19.0),
            child: Container(
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
                  'TECHNOLOGY',
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'InputMonoNew',
                  ),
                ),
              ),
            ),
          ),

          // Heading
          const Padding(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              'TerraTrace AI',
              style: headingMobile,
            ),
          ),

          // Paragraph
          SizedBox(
            width: 480,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
              ),
              child: Stack(
                children: [
                  // Bottom left blob
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment.bottomLeft,
                          radius: 1.0,
                          colors: [
                            Color.fromRGBO(255, 255, 255, 0.5), // White blob
                            Color.fromRGBO(255, 255, 255, 0.0), // Transparent
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),
                  ),
                  // Top right blob
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment.topRight,
                          radius: 1.5,
                          colors: [
                            Color.fromRGBO(255, 255, 255, 0.7), // White blob
                            Color.fromRGBO(255, 255, 255, 0.0), // Transparent
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),
                  ),
                  // Your paragraph text
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                        style: paragraph,
                        children: [
                          TextSpan(
                            text:
                                'TerraTrace is a next-generation monitoring solution combining lightweight gas flux hardware with intelligent mobile software. Designed for fast, in-field deployment, it delivers real-time insights into methane and CO₂ emissions at the soil atmosphere interface. ',
                          ),
                          TextSpan(
                            text: 'Engineered for the energy, landfill, and environmental sectors',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                ', TerraTrace supports leak detection, site monitoring, emission quantification, and spatial gas mapping—helping operators meet compliance targets and ESG goals with confidence.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
