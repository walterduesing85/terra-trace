import 'package:flutter/material.dart';

class Impressum extends StatelessWidget {
  const Impressum({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('Impressum',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('Angaben gemäß § 5 TMG'),
          Text('Walter Düsing'),
          Text('Sonnenallee 71'),
          Text('12045 Berlin'),
          Text('Kontakt:'),
          Text('E-Mail: wealter@terratrace.ai')
        ],
      ),
    );
  }
}
