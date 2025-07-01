import 'package:flutter/material.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';
import 'package:terra_trace_home_page/constants/layout.dart';

class PartnersMobileContainer extends StatelessWidget {
  final double constraints;

  const PartnersMobileContainer({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
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
              padding: EdgeInsets.all(paddingEyebrowHeaderMobile),
              child: Text(
                'PARTNERS',
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'InputMonoNew',
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Partners Logos - Vertical layout for mobile
          Column(
            children: [
              // C13 Partner
              Container(
                height: 180,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
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
              
              // Florenz Partner
              Container(
                height: 180,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
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
              
              // GFZ Partner
              Container(
                height: 270,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
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
            ],
          ),
          
          const SizedBox(height: 24),
        ],
      ),
    );
  }
} 