import 'package:flutter/material.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';

class Innovation extends StatelessWidget {
  final double constraints;

  const Innovation({Key? key, required this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(16),
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
                  child: const Text(
                    'FEATURES',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Fabric-sans-regular',
                    ),
                  ),
                ),

                // Heading
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Powered by AI',
                    style: paragraphBold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 1366 * constraints / 1366,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/ai_network.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 252,
                    margin: const EdgeInsets.only(top: 16),
                    child: const Text(
                      'TerraTrace uses an AI-driven earth respiration model which combines atmospheric and satellite data with soil gas monitoring and survey data to predict the accuracy of measurements at any location or time.',
                      style: TextStyle(
                        fontFamily: 'Fabric-sans-regular',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 252,
                    child: Text(
                      'This allows researchers to study soil gas emissions more efficiently and accurately.',
                      style: TextStyle(
                        fontFamily: 'Fabric-sans-regular',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
