import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/colors.dart';
import 'package:flutter_portfolio/widgets/terminal_interface_widget.dart';
import 'package:flutter_portfolio/widgets/top_navigation.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/projects_card.dart';

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
      body: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 8.w, right: 10.w),
        child: LayoutBuilder(builder: (context, constraints) {
          return CustomScrollView(slivers: [
            SliverStickyHeader(
              header: const TopNavigation(),
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
  const LandingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
                            color: SiteColors.focusDark,
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
              onPressed: () {},
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
              const Expanded(child: SizedBox(), flex: 1),
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
    ProjectsCard(
      projectName: 'Project 1',
      projectDescription: 'This is a project description',
      URL: 'no',
    ),
    ProjectsCard(
        projectName: 'Project 2',
        projectDescription: 'This is a project description',
        URL: 'no'),
    ProjectsCard(
        projectName: 'Project 3',
        projectDescription: 'This is a project description',
        URL: 'no'),
    ProjectsCard(
        projectName: 'Project 4',
        projectDescription: 'This is a project description',
        URL: 'no'),
    ProjectsCard(
        projectName: 'Project 5',
        projectDescription: 'This is a project description',
        URL: 'no'),
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
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    'More',
                    style: GoogleFonts.lato(color: SiteColors.primaryDark),
                  ),
                  Icon(
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
              mainAxisSpacing: 20.0, // spacing between rows
              crossAxisSpacing: 20.0, // spacing between columns
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
