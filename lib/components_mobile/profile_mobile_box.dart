import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileMobileBox extends StatelessWidget {
  final String imageUrl;
  final String text;
  final String name;
  final String role;
  final String? linkedinUrl;

  const ProfileMobileBox({
    Key? key,
    required this.imageUrl,
    required this.text,
    required this.name,
    required this.role,
    this.linkedinUrl,
  }) : super(key: key);

  void _launchLinkedIn() async {
    if (linkedinUrl != null) {
      final Uri url = Uri.parse(linkedinUrl!);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: linkedinUrl != null ? _launchLinkedIn : null,
      child: MouseRegion(
        cursor: linkedinUrl != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: Container(
          constraints: const BoxConstraints(maxHeight: 110),
          padding: const EdgeInsets.all(1),
          child: Row(
            children: [
              // Align the image vertically at the center
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 90.0,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      role.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: 'InputMonoNew',
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        fontFamily: 'Fabric-sans-regular',
                        fontSize: 14,
                        height: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Adjust the height as needed
                    Text(
                      text,
                      style: const TextStyle(
                        fontFamily: 'Fabric-sans-regular',
                        fontSize: 14,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
