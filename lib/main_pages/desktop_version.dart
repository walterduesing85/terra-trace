import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:terra_trace_home_page/constants/layout.dart';
import 'package:terra_trace_home_page/constants/text_styles.dart';
import 'package:terra_trace_home_page/components/contact_us.dart';
import 'package:terra_trace_home_page/components/feature_container.dart';
import 'package:terra_trace_home_page/components/innovation_container.dart';
import 'package:terra_trace_home_page/components/team_container.dart';
import 'package:terra_trace_home_page/components/technology_container.dart';
import 'package:terra_trace_home_page/constants/layout.dart';
import 'package:terra_trace_home_page/components/photo_slideshow.dart';
import 'package:terra_trace_home_page/components/partners_container.dart';

class DesktopVersion extends StatefulWidget {
  const DesktopVersion({Key? key}) : super(key: key);

  @override
  DesktopVersionState createState() => DesktopVersionState();
}

class DesktopVersionState extends State<DesktopVersion> {
  ScrollController scrollController = ScrollController();
  bool shouldHideLogo = false;
  bool _imagesPreloaded = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset > 80 && !shouldHideLogo) {
        setState(() {
          shouldHideLogo = true;
        });
      } else if (scrollController.offset <= 79 && shouldHideLogo) {
        setState(() {
          shouldHideLogo = false;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_imagesPreloaded) {
      _preloadImages();
      _imagesPreloaded = true;
    }
  }

  void _preloadImages() {
    // Preload critical images
    precacheImage(const AssetImage('images/background_01.png'), context);
    precacheImage(const AssetImage('images/vulcano_chamber.jpeg'), context);
    precacheImage(const AssetImage('images/ai_network.png'), context);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
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
                      maxHeight: MediaQuery.of(context).size.height),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/background_01.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(
                      padding,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Turning invisible emissions into actionable data',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Fabric-sans-regular',
                          fontSize: 0.07 * MediaQuery.of(context).size.width,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -2.33,
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
                    minWidth: 800,
                    maxWidth: 1366.0,
                    maxHeight:
                        MediaQuery.of(context).size.width > 900 ? 854.0 : 1200,
                  ),     decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/vulcano_chamber.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                 // color: const Color.fromRGBO(213, 255, 111, 1),
                  child: Container(
                    padding: const EdgeInsets.all(padding),
                    child: MediaQuery.of(context).size.width < 900
                        ? Column(
                            children: [
                              TechnologyContainer(
                                constraints: MediaQuery.of(context).size.width,
                              ),
                            ],
                        )
                        : Row(
                            children: [
                              Expanded(
                                  child: TechnologyContainer(
                                constraints: MediaQuery.of(context).size.width,
                              )),
                              const SizedBox(width: 16),
                            ],
                          ),
                  ),
                ),
              ),
              //Feature Sliver
              SliverToBoxAdapter(
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: 800,
                    maxWidth: 1300,
                    maxHeight:
                        MediaQuery.of(context).size.width < 1450 ? 1500 : 850,
                  ),
                  color: const Color.fromRGBO(213, 255, 111, 1),
                  child: Container(
                    padding: const EdgeInsets.all(padding),
                    child: Row(
                      children: [
                        Expanded(
                          child: FeatureContainer(
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
                          maxHeight: MediaQuery.of(context).size.width < 1200
                              ? 1200
                              : 845),
                      color: const Color.fromRGBO(213, 255, 111, 1),
                      padding: const EdgeInsets.all(padding),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width,
                              maxHeight:
                                  MediaQuery.of(context).size.width < 1200
                                      ? 1200
                                      : 845),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/ai_network.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    InnovationContainer(
                      constraints: MediaQuery.of(context).size.width,
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
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      color: const Color.fromRGBO(153, 168, 143, 1),
                      padding: EdgeInsets.all(
                        43 * MediaQuery.of(context).size.width / 1366,
                      ),
                    ),
                    TeamContainer(
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
                  padding: const EdgeInsets.only(left: padding, right: padding, top: padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                         Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(paddingEyebrowHeader),
                child: Text(
                  'GALLERY',
                  style: topBoxTextStyle,
                ),
              ),
            ),
                      const SizedBox(height: 16),
                      PhotoSlideshow(
                        constraints: MediaQuery.of(context).size.width,
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
              // Partners Section
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  color: const Color.fromRGBO(153, 168, 143, 1),
                  child: PartnersContainer(
                    constraints: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              //Get in touch
              SliverToBoxAdapter(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: 500,
                  ),
                  color: const Color.fromRGBO(41, 37, 41, 1),
                  padding: EdgeInsets.all(
                    43 * MediaQuery.of(context).size.width / 1366,
                  ),
                  child: ContactUs(
                    constraints: MediaQuery.of(context).size.width,
                  ),
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
                            padding: const EdgeInsets.all(45.0),
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 244,
                                maxHeight: 38.5,
                              ),
                              child: SvgPicture.asset(
                                'images/terratrace_logo.svg',
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
