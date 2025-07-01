import 'package:flutter/material.dart';
import 'package:terra_trace_home_page/components/team_column.dart';
import 'package:terra_trace_home_page/constants/layout.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';
import 'package:terra_trace_home_page/team_members/team_members.dart';

class TeamContainer extends StatelessWidget {
  TeamContainer({Key? key, required this.constraints}) : super(key: key);

  final double constraints;
  final coreMembers = TeamMembers().coreMembers;
  final scienceTeam = TeamMembers().scienceTeam;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(153, 168, 143, 1),
      padding:
          const EdgeInsets.only(left: padding, right: padding, top: padding),
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
                  'OUR TEAM',
                  style: topBoxTextStyle,
                ),
              ),
            ),

            // Heading
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Combined Knowledge',
                style: heading,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            constraints < 1200
                ?
                // If screen width is less than 900, show features in a column
                Column(
                    children: [
                      TeamColumn(
                        teamMembers: coreMembers,
                        teamType: 'Core Team',
                        constraints: constraints,
                      ),
             
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            TeamColumn(
                              teamMembers: coreMembers,
                              teamType: 'Core Team',
                              constraints: constraints / 2,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
       
                    ],
                  ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
