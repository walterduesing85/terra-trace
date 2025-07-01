import 'package:flutter/material.dart';
import 'package:terra_trace_home_page/main_pages/desktop_version.dart';
import 'package:terra_trace_home_page/main_pages/mobile_version.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 860
        ? const MobileVersion()
        : const DesktopVersion();
  }
}
