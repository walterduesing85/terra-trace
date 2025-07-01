import 'package:flutter/material.dart';
import 'package:terra_trace_home_page/components/team_member.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';
import 'profile_box.dart';

class TeamColumn extends StatelessWidget {
  final List<TeamMember> teamMembers;
  final String teamType;
  final double constraints;

  const TeamColumn({
    Key? key,
    required this.teamMembers,
    required this.teamType,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Color.fromRGBO(213, 255, 111, 1)),
            ),
          ),
          child: Stack(
            children: [
              SizedBox(
                height: 50,
                width: constraints > 1200 ? 150 : 100,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    teamType.toUpperCase(),
                    style: teamTypeText,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: constraints > 1200 ? 180 : 150),
                  Expanded(
                    child: constraints > 1200
                        ? Wrap(
                            spacing: 24,
                            runSpacing: 24,
                            children: [
                              for (int i = 0; i < teamMembers.length; i += 2)
                                SizedBox(
                                  width: (constraints - 180 - 48) / 2,
                                  child: Column(
                                    children: [
                                      ProfileBox(
                                        role: teamMembers[i].role,
                                        name: teamMembers[i].name,
                                        imageUrl: teamMembers[i].imageUrl,
                                        text: teamMembers[i].text,
                                        linkedinUrl: teamMembers[i].linkedinUrl,
                                      ),
                                      if (i + 1 < teamMembers.length) ...[
                                        const SizedBox(height: 24),
                                        ProfileBox(
                                          role: teamMembers[i + 1].role,
                                          name: teamMembers[i + 1].name,
                                          imageUrl: teamMembers[i + 1].imageUrl,
                                          text: teamMembers[i + 1].text,
                                          linkedinUrl: teamMembers[i + 1].linkedinUrl,
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                            ],
                          )
                        : Column(
                            children: teamMembers.map((member) {
                              return ProfileBox(
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
