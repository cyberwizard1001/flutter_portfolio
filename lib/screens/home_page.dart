
/// HomePage.dart - Home Page of the website
///
/// This file implements the main landing page of the portfolio website.
/// The HomePage widget includes the following sections:
/// - LandingSection: Introduces the portfolio and provides a brief intro
/// - ProjectsSection: Showcases key projects
/// - AboutSection: Describes the developer and their journey
/// - SkillsSection: Highlights professional skills
/// - ConnectSection: Provides contact and social media links
///
/// The page is responsive and handles different layouts for desktop and
/// mobile views. Smooth scrolling, sticky headers, and navigation are
/// implemented for an enhanced user experience.
///
/// Author: Nirmal Karthikeyan
library;


import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/colors.dart';
import 'package:flutter_portfolio/widgets/home/terminal_interface_widget.dart';
import 'package:flutter_portfolio/widgets/top_navigation.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'dart:html' as html;
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';


import '../utils/responsive.dart';
import '../widgets/projects/projects_card.dart';
import '../widgets/projects/skill_card.dart';



class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  void toTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SiteColors.backgroundDark,
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
        backgroundColor: SiteColors.backgroundDark,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 8.w, right: 10.w),
        child: LayoutBuilder(builder: (context, constraints) {
          return CustomScrollView(
            controller: _scrollController,
              slivers: [
            SliverStickyHeader(
              header: Responsive.isDesktop(context) ? const TopNavigation() : null,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(height: 6.h),
                    const LandingSection(),
                    SizedBox(
                      height: 25.h,
                    ),
                    ProjectsSection(),
                    SizedBox(
                      height: 25.h,
                    ),
                    const AboutSection(),
                    SizedBox(
                      height: 25.h,
                    ),
                    SkillsSection(),
                    SizedBox(
                      height: 25.h,
                    ),
                    const ConnectSection(),

                    //Add more sections here
                  ],
                ),
              ),
            ),
          ]);
        }),
      ),
      floatingActionButton: Visibility(
        visible: _scrollController.hasClients && _scrollController.offset > 100,
        child: FloatingActionButton(
          onPressed: toTop,
          tooltip: 'To Top',
          child: const Icon(Icons.arrow_upward),
        ),
      ),
    );
  }
}

class LandingSection extends StatelessWidget {
  const LandingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // border: Border.all(color: SiteColors.primaryDark),
        color: SiteColors.backgroundDark,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              RichText(
                text: TextSpan(
                    text: 'Weaving dreams into ',
                    style: GoogleFonts.lato(
                      color: SiteColors.primaryDark,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w300,
                      letterSpacing: -1.0,
                    ),
                    children: [
                      TextSpan(
                          text: 'digital realities',
                          style: GoogleFonts.lato(
                            color: SiteColors.primaryDark,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w600,
                          ))
                    ]),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Align(
            alignment: Alignment.topLeft,
            child: MaterialButton(
              color: SiteColors.primaryDark,
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
              ),
              onPressed: () {
                // context.push('/cv');
                html.window.open('/assets/pdfs/Nirmal_Karthikeyan.pdf', 'new tab');
              },
              child: Text(
                'View CV',
                style: GoogleFonts.lato(
                    color: SiteColors.primaryInverseDark,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Let\'s talk',
                      style: GoogleFonts.lato(
                        color: SiteColors.primaryDark,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //email address
                    Text('nirmalkarthikeyan1@gmail.com',
                        style: GoogleFonts.lato(
                          color: SiteColors.secondaryDark,
                          fontSize: 12.sp,
                        )),
                  ],
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 1,
                child: Text(
                  "Hello! I’m Nirmal. I’m a developer turned designer with an eye for detail and a very varied list of interests.",
                  textAlign: TextAlign.end,
                  style: GoogleFonts.lato(
                    color: SiteColors.primaryDark,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<ProjectsCard> items = [
    const ProjectsCard(
      projectID: 0,
    ),
    const ProjectsCard(
      projectID: 1,
    ),
    const ProjectsCard(
      projectID: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Projects',
                  style: GoogleFonts.lato(
                      fontSize: 20.sp, color: SiteColors.primaryDark),
                ),
                Text(
                  'This is some text here that explains what I have in the projects section and is this long and wide',
                  style: GoogleFonts.lato(color: SiteColors.primaryDark),
                )
              ],
            ),
            MaterialButton(
              onPressed: () {
                //context.go('/projects');
              },
              child: Row(
                children: [
                  Text(
                    'More',
                    style: GoogleFonts.lato(color: SiteColors.primaryDark),
                  ),
                  const Icon(
                    Icons.arrow_right_alt_rounded,
                    color: SiteColors.primaryDark,
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 5.h),
        LayoutBuilder(builder: (context, constraints) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (MediaQuery.sizeOf(context).width > 420)
                  ? 2
                  : 1, // number of items in each row
              mainAxisSpacing: 25.0, // spacing between rows
              crossAxisSpacing: 25.0, // spacing between columns
              childAspectRatio: 1.0, // aspect ratio of each item (width/height
            ),
            padding: const EdgeInsets.all(8.0),
            // padding around the grid
            itemCount: items.length,
            // total number of items
            itemBuilder: (context, index) {
              return items[index];
            },
          );
        })
      ],
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: GoogleFonts.lato(
                    color: SiteColors.primaryDark,
                    fontSize: 20.sp,
                  ),
                ),
                Text(
                  'Nirmal /ˈnɪr.məl/',
                  style: GoogleFonts.lato(
                    color: SiteColors.primaryDark,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 40.w,
              child: Text(
                'I\'m a digital designer and developer on a mission to bring visionary ideas to life. My journey began with lines of code and a dream, and today, I strive to craft digital landscapes that are so intuitive, the technology disappears into the experience.',
                textAlign: TextAlign.end,
                style: GoogleFonts.lato(
                  color: SiteColors.primaryDark,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 7.h),
        const TerminalInterfaceWidget()
      ],
    );
  }
}

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});

  final List<SkillCard> skills = [
    const SkillCard(
      alignment: Alignment.center,
      imageLocation: '',
      skill: 'UX Design',
    ),
    const SkillCard(
      alignment: Alignment.center,
      imageLocation: '',
      skill: 'User Research',
    ),
    const SkillCard(
      alignment: Alignment.center,
      imageLocation: '',
      skill: 'Figma',
    ),
    const SkillCard(
      alignment: Alignment.center,
      imageLocation: '',
      skill: 'Analytics',
    ),
    const SkillCard(
      alignment: Alignment.center,
      imageLocation: '',
      skill: 'Website builders',
    ),
    const SkillCard(
      alignment: Alignment.center,
      imageLocation: '',
      skill: 'Flutter',
    ),
    const SkillCard(
      alignment: Alignment.center,
      imageLocation: '',
      skill: 'AWS',
    ),
    const SkillCard(
      alignment: Alignment.center,
      imageLocation: '',
      skill: 'CRMs',
    ),
    const SkillCard(
      alignment: Alignment.center,
      imageLocation: '',
      skill: 'CI/CD',
    ),
    const SkillCard(
      alignment: Alignment.center,
      imageLocation: '',
      skill: 'Linux',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Professional skills',
        style: GoogleFonts.lato(
          color: SiteColors.primaryDark,
          fontSize: 20.sp,
        ),
      ),
      SizedBox(height: 5.h),
      LayoutBuilder(builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (MediaQuery.sizeOf(context).width > 420)
                ? 4
                : 3, // number of items in each row
            mainAxisSpacing: 20.0, // spacing between rows
            crossAxisSpacing: 20.0, // spacing between columns
            childAspectRatio: 0.95, // aspect ratio of each item (width/height
          ),
          padding: const EdgeInsets.all(8.0),
          // padding around the grid
          itemCount: skills.length,
          // total number of items
          itemBuilder: (context, index) {
            return skills[index];
          },
        );
      })
    ]);
  }
}

class ConnectSection extends StatelessWidget {
  const ConnectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri mediumUrl = Uri.parse('https://nirmalkarthikeyan.medium.com/');
    final Uri repositoryUrl =
        Uri.parse('https://github.com/cyberwizard1001/flutter_portfolio');
    final Uri linkedInUrl =
        Uri.parse('https://www.linkedin.com/in/nirmal-karthikeyan/');

    Future<void> customLaunchUrl(Uri url) async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        'Let\'s talk!',
        style: GoogleFonts.lato(
          color: SiteColors.primaryDark,
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 5.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('hello@nirmalk.co',
              style: GoogleFonts.lato(
                color: SiteColors.primaryDark,
                fontSize: 15.sp,
              )),
          const Icon(
            Icons.arrow_outward_rounded,
            color: SiteColors.primaryDark,
          )
        ],
      ),
      SizedBox(height: 15.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('2023 © - Designed and developed by Nirmal Karthikeyan',
              style: GoogleFonts.lato(
                color: SiteColors.secondaryDark,
                fontSize: 10.sp,
              )),
          SizedBox(
            width: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    customLaunchUrl(repositoryUrl);
                  },
                  child: Text(
                    'Portfolio site repository',
                    style: GoogleFonts.lato(
                      color: SiteColors.primaryDark,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    customLaunchUrl(linkedInUrl);
                  },
                  child: Text(
                    'View my CV',
                    style: GoogleFonts.lato(
                      color: SiteColors.primaryDark,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 5.h),
    ]);
  }
}
