import 'package:flutter/material.dart';
import 'package:terra_trace_home_page/components/team_member.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';
import 'profile_box.dart';

class ScienceColumn extends StatelessWidget {
  final List<TeamMember> teamMembers;
  final String teamType;
  final double constraints;

  const ScienceColumn({
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 252,
                width: constraints > 900 ? 150 : 100,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    teamType.toUpperCase(),
                    style: teamTypeText,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SizedBox(
                  height: 450, // Adjust the height as needed
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: teamMembers.map((member) {
                      return SizedBox(
                        width: constraints > 900
                            ? MediaQuery.of(context).size.width / 4 - 20
                            : MediaQuery.of(context).size.width / 2 - 20,
                        child: ProfileBox(
                          role: member.role,
                          name: member.name,
                          imageUrl: member.imageUrl,
                          text: member.text,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
