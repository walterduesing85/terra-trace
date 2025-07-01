import 'package:flutter/material.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ImpressumMobile extends StatefulWidget {
  const ImpressumMobile({Key? key}) : super(key: key);

  @override
  ImpressumMobileState createState() => ImpressumMobileState();
}

class ImpressumMobileState extends State<ImpressumMobile> {
  bool _showImpressum = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 45),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _showImpressum = !_showImpressum;
          });
        },
        child: Container(
          constraints: const BoxConstraints(),
          child: _showImpressum
              ? _buildImpressumWidget()
              : _buildSimpleTextWidget(),
        ),
      ),
    );
  }

  Widget _buildSimpleTextWidget() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Imprint',
            style: TextStyle(
              fontFamily: 'InputMonoNew',
              fontSize: 13,
              color: Color.fromRGBO(238, 238, 224, 1),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImpressumWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Impressum',
          style: TextStyle(
            fontFamily: 'Fabric-sans-regular',
            fontSize: 20,
            letterSpacing: 0.1,
            color: Color.fromRGBO(238, 238, 224, 1),
          ),
        ),
        const SizedBox(height: 10),
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
          style: impressumText,
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () => launchUrl(Uri.parse('https://www.onckwest.com')),
          child: const Text(
            'Design by OnckWest\nwww.onckwest.com',
            style: impressumText,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => launchUrl(Uri.parse(
              'https://unsplash.com/photos/forest-under-gray-sky-JlRdnoeaitk')),
          child: const Text(
            'Cover image by Jonathan Larson\nunsplash.com/photos/forest-under-gray-sky-JlRdnoeaitk',
            style: impressumText,
          ),
        ),
      ],
    );
  }
}

// Wrapper widget that provides callback functionality
class ImpressumMobileWithCallback extends StatefulWidget {
  final Function(bool isExpanded) onStateChanged;
  
  const ImpressumMobileWithCallback({
    Key? key,
    required this.onStateChanged,
  }) : super(key: key);

  @override
  ImpressumMobileWithCallbackState createState() => ImpressumMobileWithCallbackState();
}

class ImpressumMobileWithCallbackState extends State<ImpressumMobileWithCallback> {
  bool _showImpressum = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 45),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _showImpressum = !_showImpressum;
          });
          widget.onStateChanged(_showImpressum);
        },
        child: Container(
          constraints: const BoxConstraints(),
          child: _showImpressum
              ? _buildImpressumWidget()
              : _buildSimpleTextWidget(),
        ),
      ),
    );
  }

  Widget _buildSimpleTextWidget() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Imprint',
            style: TextStyle(
              fontFamily: 'InputMonoNew',
              fontSize: 13,
              color: Color.fromRGBO(238, 238, 224, 1),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImpressumWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Impressum',
          style: TextStyle(
            fontFamily: 'Fabric-sans-regular',
            fontSize: 20,
            letterSpacing: 0.1,
            color: Color.fromRGBO(238, 238, 224, 1),
          ),
        ),
        const SizedBox(height: 10),
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
          style: impressumText,
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () => launchUrl(Uri.parse('https://www.onckwest.com')),
          child: const Text(
            'Design by OnckWest\nwww.onckwest.com',
            style: impressumText,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => launchUrl(Uri.parse(
              'https://unsplash.com/photos/forest-under-gray-sky-JlRdnoeaitk')),
          child: const Text(
            'Cover image by Jonathan Larson\nunsplash.com/photos/forest-under-gray-sky-JlRdnoeaitk',
            style: impressumText,
          ),
        ),
      ],
    );
  }
}
