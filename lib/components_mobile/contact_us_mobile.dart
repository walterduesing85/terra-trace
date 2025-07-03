import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:terra_trace_home_page/common_widgets/impressum.dart';
import 'package:terra_trace_home_page/common_widgets/impressum_mobile.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsMobile extends StatefulWidget {
  final double constraints;
  final Function(bool isExpanded)? onImpressumStateChanged;
  
  const ContactUsMobile({
    Key? key, 
    required this.constraints,
    this.onImpressumStateChanged,
  }) : super(key: key);

  @override
  State<ContactUsMobile> createState() => ContactUsMobileState();
}

class ContactUsMobileState extends State<ContactUsMobile> {
  bool isHovering = false; // Added hover state

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

  void _onImpressumStateChanged(bool isExpanded) {
    widget.onImpressumStateChanged?.call(isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    (isHovering.toString());
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        constraints: const BoxConstraints(minHeight: 290),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              height: 20,
              child: SvgPicture.asset(
                'assets/images/terratrace_logo.svg', // Replace 'logo_terratrace.svg' with your SVG file path
                color: const Color.fromRGBO(213, 255, 111, 1),
                fit: BoxFit.contain,
              ),
            ),
           const SizedBox(
              height: 20,
            ),

            const Text(
              'contact us',
              style: TextStyle(
                fontFamily: 'Fabric-sans-regular',
                fontSize: 20,
                letterSpacing: 0.1,
                color: Color.fromRGBO(238, 238, 224, 1),
              ),
            ),
         
            // Email address
            GestureDetector(
              onTap: email,
              onTapDown: (_) {
                setState(() {
                  isHovering = true;
                });
              },
              onTapUp: (_) {
                setState(() {
                  isHovering = false;
                });
              },
              onTapCancel: () {
                setState(() {
                  isHovering = false;
                });
              },
              
              child: Text(
                'info@terratrace.ai',
                style: TextStyle(
                  fontFamily: 'Fabric-sans-regular',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 0.1,
                  color: isHovering
                      ? const Color.fromRGBO(183, 221, 38, 1)
                      : const Color.fromRGBO(213, 255, 111, 1),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft, 
              child: ImpressumMobileWithCallback(
                onStateChanged: _onImpressumStateChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
