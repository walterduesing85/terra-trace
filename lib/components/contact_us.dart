import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:terra_trace_home_page/common_widgets/impressum.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  final double constraints;
  const ContactUs({Key? key, required this.constraints}) : super(key: key);

  @override
  ContactUsState createState() => ContactUsState();
}

class ContactUsState extends State<ContactUs> {
  bool isHovering = false;

  void email() async {
    String email = Uri.encodeComponent("info@terratrace.ai");
    String subject = Uri.encodeComponent("let me know about Terra Trace");
    String body = Uri.encodeComponent(
        "Hi I am interested in Terra Trace, please tell me all about it!");

    var url = Uri.parse("mailto:$email?subject=$subject&body=$body");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showImpressumDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color.fromRGBO(41, 37, 41, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 600,
              maxHeight: 700,
            ),
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Impressum',
                        style: TextStyle(
                          fontFamily: 'Fabric-sans-regular',
                          fontSize: 24,
                          letterSpacing: 0.1,
                          color: Color.fromRGBO(238, 238, 224, 1),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.close,
                          color: Color.fromRGBO(238, 238, 224, 1),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Angaben gemäß § 5 TMG\n\n'
                    'Dr. Walter Düsing\n'
                    'Sonnenallee 71\n'
                    '12045 Berlin\n'
                    'Deutschland\n\n'
                    'E-Mail: info@terratrace.ai\n'
                    'Verantwortlich für den Inhalt nach § 55 Abs. 2 RStV:\n'
                    'Dr. Walter Düsing\n\n'
                    'Die Gründung der TerraTrace GmbH ist in Vorbereitung.\n'
                    'Bis zur Eintragung wird diese Website durch Dr. Walter Düsing als Einzelunternehmer betrieben.',
                    style: TextStyle(
                      fontFamily: 'InputMonoNew',
                      fontSize: 14,
                      color: Color.fromRGBO(238, 238, 224, 1),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () => launchUrl(Uri.parse('https://www.onckwest.com')),
                    child: const Text(
                      'Design by OnckWest\nwww.onckwest.com',
                      style: TextStyle(
                        fontFamily: 'InputMonoNew',
                        fontSize: 14,
                        color: Color.fromRGBO(238, 238, 224, 1),
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () => launchUrl(Uri.parse(
                        'https://unsplash.com/photos/forest-under-gray-sky-JlRdnoeaitk')),
                    child: const Text(
                      'Cover image by Jonathan Larson\nunsplash.com/photos/forest-under-gray-sky-JlRdnoeaitk',
                      style: TextStyle(
                        fontFamily: 'InputMonoNew',
                        fontSize: 14,
                        color: Color.fromRGBO(238, 238, 224, 1),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image container at the top
            Container(
              constraints: BoxConstraints(
                maxWidth: widget.constraints < 800 ? 122 : 244,
                maxHeight: widget.constraints < 800 ? 19.25 : 38.5,
              ),
              child: SvgPicture.asset(
                'images/terratrace_logo.svg',
                color: const Color.fromRGBO(213, 255, 111, 1),
                fit: BoxFit.contain,
              ),
            ),
            // Spacer to push "Contact Us" and email address to the bottom
            const Spacer(),
            // Contact Us text
            const Text(
              'Contact us',
              style: TextStyle(
                fontFamily: 'Fabric-sans-regular',
                fontSize: 20,
                letterSpacing: 0.1,
                color: Color.fromRGBO(238, 238, 224, 1),
              ),
            ),
            const SizedBox(height: 10),
            // Email address
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isHovering = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isHovering = false;
                    });
                  },
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: email,
                    child: Transform.translate(
                      offset: const Offset(0, -10),
                      child: Text(
                        'info@terratrace.ai',
                        style: TextStyle(
                          fontFamily: 'Fabric-sans-regular',
                          fontWeight: FontWeight.bold,
                          height: 1,
                          fontSize: 20,
                          letterSpacing: 0.1,
                          color: isHovering
                              ? const Color.fromRGBO(183, 221, 38, 1)
                              : const Color.fromRGBO(213, 255, 111, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // Spacer
        //const SizedBox(width: 10),
        // Copyright text
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Copyright since 2024. All rights reserved.',
                style: TextStyle(
                  fontFamily: 'InputMonoNew',
                  fontSize: 13,
                  color: Color.fromRGBO(238, 238, 224, 1),
                ),
              ),
            ),
          ),
        ),
        // Spacer

        // Impressum widget - now triggers popup
        Padding(
          padding: const EdgeInsets.only(right: 45),
          child: GestureDetector(
            onTap: _showImpressumDialog,
            child: const Text(
              'Imprint',
              style: TextStyle(
                fontFamily: 'InputMonoNew',
                fontSize: 13,
                color: Color.fromRGBO(238, 238, 224, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
