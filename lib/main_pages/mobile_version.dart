import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:terra_trace_home_page/components_mobile/contact_us_mobile.dart';
import 'package:terra_trace_home_page/components_mobile/feature_mobile_container.dart';
import 'package:terra_trace_home_page/components_mobile/innovation_mobile_container.dart';
import 'package:terra_trace_home_page/components_mobile/team_mobile_container.dart';
import 'package:terra_trace_home_page/components_mobile/technology_mobile.dart';
import 'package:terra_trace_home_page/components/photo_slideshow.dart';
import 'package:terra_trace_home_page/constants/layout.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';
import 'package:terra_trace_home_page/components_mobile/partners_mobile_container.dart';

class MobileVersion extends StatefulWidget {
  const MobileVersion({Key? key}) : super(key: key);

  @override
  MobileVersionState createState() => MobileVersionState();
}

class MobileVersionState extends State<MobileVersion> {
  ScrollController scrollController = ScrollController();
  bool shouldHideLogo = false;
  bool _impressumExpanded = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset > 125 && !shouldHideLogo) {
        setState(() {
          shouldHideLogo = true;
        });
      } else if (scrollController.offset <= 124 && shouldHideLogo) {
        setState(() {
          shouldHideLogo = false;
        });
      }
    });
  }

  void _onImpressumStateChanged(bool isExpanded) {
    setState(() {
      _impressumExpanded = isExpanded;
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            slivers: [
              // First Sliver with Background Image
              SliverToBoxAdapter(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/background_mobile.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 108,
                      left: 43 * MediaQuery.of(context).size.width / 1366,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                       'Turning invisible emissions into actionable data',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Fabric-sans-regular',
                          fontSize:
                              52 * MediaQuery.of(context).size.width / 430,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1.25,
                          color: const Color.fromRGBO(213, 255, 111, 1),
                          height: 1,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Technology Sliver
              SliverToBoxAdapter(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: 854.0,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/vulcano_chamber.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: TechnologyMobile(
                      constraints: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
              ),
              //Feature Sliver
              SliverToBoxAdapter(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.width > 390
                        ? 800
                        : (MediaQuery.of(context).size.width > 350 ? 750 : 700),
                  ),
                  color: const Color.fromRGBO(213, 255, 111, 1),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(
                          child: FeatureMobileContainer(
                            constraints: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //Innovation
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                          maxHeight: 700),
                      color: const Color.fromRGBO(213, 255, 111, 1),
                      padding: EdgeInsets.all(
                        43 * MediaQuery.of(context).size.width / 1366,
                      ),
                    ),
                    InnovationMobileContainer(
                      constraints: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      bottom: 30,
                      left: -50,
                      right: -80,
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 4,
                            maxHeight: 854.0 *
                                MediaQuery.of(context).size.width /
                                800),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/ai_network.png'),
                            scale: 10,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Combinde3d Knowledge
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width),
                      color: const Color.fromRGBO(153, 168, 143, 1),
                      padding: EdgeInsets.all(
                        43 * MediaQuery.of(context).size.width / 1366,
                      ),
                    ),
                    TeamMobileContainer(
                      constraints: MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
              ),
              // Gallery Section
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  color: const Color.fromRGBO(153, 168, 143, 1),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 19.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(paddingEyebrowHeaderMobile),
                            child: Text(
                              'GALLERY',
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: 'InputMonoNew',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      PhotoSlideshow(
                        constraints: MediaQuery.of(context).size.width,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              // Partners Section
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  color: const Color.fromRGBO(153, 168, 143, 1),
                  child: PartnersMobileContainer(
                    constraints: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              //Get in touch
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        maxHeight: _impressumExpanded ? 600 : 310,
                      ),
                      color: const Color.fromRGBO(41, 37, 41, 1),
                      padding: EdgeInsets.all(
                        43 * MediaQuery.of(context).size.width / 1366,
                      ),
                    ),
                    ContactUsMobile(
                      constraints: MediaQuery.of(context).size.width,
                      onImpressumStateChanged: _onImpressumStateChanged,
                    ),
                  ],
                ),
              ),
              // SliverAppBar at the bottom
            ],
          ),
          //make this disappear after the first scroll
          shouldHideLogo
              ? Container()
              : Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 13, bottom: 114.15),
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 151 * 1.2,
                                maxHeight: 24 * 1.2,
                              ),
                              child: SvgPicture.asset(
                                'images/terratrace_logo.svg', // Replace 'logo_terratrace.svg' with your SVG file path
                                color: const Color.fromRGBO(213, 255, 111, 1),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
