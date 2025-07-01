import 'package:flutter/material.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';
import 'package:terra_trace_home_page/constants/layout.dart';

class PartnersContainer extends StatelessWidget {
  final double constraints;

  const PartnersContainer({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Partners Header
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
                'PARTNERS',
                style: topBoxTextStyle,
              ),
            ),
          ),
          const SizedBox(height: 40),
          
          // Partners Logos
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // C13 Partner
              Expanded(
                child: Container(
                  height: 120,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.transparent,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      'images/partners_c13.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              
              // Florenz Partner
              Expanded(
                child: Container(
                  height: 120,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.transparent,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      'images/partners_florenz.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              
              // GFZ Partner
              Expanded(
                child: Container(
                  height: 180,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.transparent,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      'images/partners_gfz.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 40),
        ],
      ),
    );
  }
} 