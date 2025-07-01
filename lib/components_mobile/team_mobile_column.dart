import 'package:flutter/material.dart';
import 'package:terra_trace_home_page/components/profile_box.dart';
import 'package:terra_trace_home_page/components/team_member.dart';
import 'package:terra_trace_home_page/components_mobile/profile_mobile_box.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';

class TeamMobileColumn extends StatelessWidget {
  final List<TeamMember> teamMembers;
  final String teamType;
  final double constraints;

  const TeamMobileColumn({
    Key? key,
    required this.teamMembers,
    required this.teamType,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: SizedBox(
            height: 20,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                teamType.toUpperCase(),
                style: teamTypeTextMobile,
              ),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Color.fromRGBO(213, 255, 111, 1)),
            ),
          ),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: teamMembers.map((member) {
                        return ProfileMobileBox(
                          role: member.role,
                          name: member.name,
                          imageUrl: member.imageUrl,
                          text: member.text,
                          linkedinUrl: member.linkedinUrl,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
