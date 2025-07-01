import 'package:flutter/material.dart';

import 'package:terra_trace_home_page/components_mobile/team_mobile_column.dart';
import 'package:terra_trace_home_page/constants/layout.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';
import 'package:terra_trace_home_page/team_members/team_members.dart';

class TeamMobileContainer extends StatelessWidget {
  TeamMobileContainer({super.key, required this.constraints});
  final double constraints;

  final coreMembers = TeamMembers().coreMembers;
  final scienceTeam = TeamMembers().scienceTeam;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(153, 168, 143, 1),
      ),
      padding: const EdgeInsets.all(16),
      child: Align(
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
                    'OUR TEAM',
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
                'Combined knowledge',
                style: headingMobile,
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            // If screen width is less than 900, show features in a column
            Column(
              children: [
                TeamMobileColumn(
                  teamMembers: coreMembers,
                  teamType: 'Core Team',
                  constraints: constraints,
                ),


              ],
            )
          ],
        ),
      ),
    );
  }
}
