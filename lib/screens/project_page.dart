import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/colors.dart';
import 'package:flutter_portfolio/widgets/home/top_navigation_single_line.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/project_data.dart';
import '../models/project_model.dart';


//URL: /#/projects

class ProjectPage extends StatefulWidget {

  final int projectID;

  const ProjectPage({
    super.key,
    required this.projectID,
  });

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final ScrollController _scrollController = ScrollController();

  late ProjectModel projectData;

  late final String projectName;
  late final String headingImageURL;
  late final String category;
  late final String description;

  late final String theChallenge;
  late final String myRole;
  late final String theOutcome;

  late final List<Widget> phaseList;

  late final List<Widget> furtherReadingItems;

  @override
  void initState(){
    super.initState();
    projectData = ProjectData.projects[widget.projectID];
    projectName = projectData.projectName;
    headingImageURL = projectData.headingImageURL;
    category = projectData.category;
    description = projectData.description;
    theChallenge = projectData.theChallenge;
    myRole = projectData.myRole;
    theOutcome = projectData.theOutcome;
    phaseList = projectData.phaseList;
    furtherReadingItems = projectData.furtherReadingItems;
  }

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
        padding: EdgeInsets.only(top: 20.0, left: 4.w, right: 4.w),
        child: LayoutBuilder(builder: (context, constraints) {
          return CustomScrollView(slivers: [
            SliverStickyHeader(
              header: const TopNavigationSingleLine(),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(height: 6.h),
                    LandingSection(
                      projectName: projectName,
                      headingImageURL: headingImageURL,
                      category: category,
                      description: description
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    ThreeKeyThings(
                      theChallenge: theChallenge,
                      myRole: myRole,
                      theOutcome: theOutcome,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Column(
                      children: phaseList
                    ),
                    SizedBox(height: 15.h,),
                    FurtherReadingComponent(furtherReadingItems: furtherReadingItems),
                    SizedBox(
                      height: 25.h,
                    ),
                    const ConnectSection(),
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
  const LandingSection(
      {super.key,
      required this.projectName,
      required this.headingImageURL,
      required this.category,
      required this.description});

  final String headingImageURL;
  final String category;
  final String description;
  final String projectName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(),
                    Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: Text(
                        category,
                        style: GoogleFonts.lato(
                          color: SiteColors.primaryDark,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  projectName,
                  style: GoogleFonts.lato(
                    color: SiteColors.primaryDark,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                SizedBox(
                  width: 40.w,
                  child: Text(
                    description,
                    style: GoogleFonts.lato(
                      color: SiteColors.primaryDark,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 5.w),
            if (headingImageURL != 'no')
              SizedBox(
                  height: 50.h,
                  width: 40.w,
                  child: Image.network(
                    headingImageURL,
                    fit: BoxFit.cover,
                  )),
            if (headingImageURL == 'no')
              Container(
                height: 50.h,
                width: 40.w,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
              ),
          ],
        )
      ],
    );
  }
}

class ThreeKeyThings extends StatelessWidget {
  const ThreeKeyThings(
      {super.key,
      required this.theChallenge,
      required this.myRole,
      required this.theOutcome});

  final String theChallenge;
  final String myRole;
  final String theOutcome;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100.w,
          decoration: BoxDecoration(
            border: Border.all(color: SiteColors.primaryDark),
          ),
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'THE CHALLENGE',
                style: GoogleFonts.lato(
                  color: SiteColors.primaryDark,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Text(
                  theChallenge,
                  style: GoogleFonts.lato(
                    color: SiteColors.primaryDark,
                    fontSize: 13.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 46.w,
              decoration: BoxDecoration(
                border: Border.all(color: SiteColors.primaryDark),
              ),
              padding: EdgeInsets.symmetric(vertical: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'MY ROLE',
                    style: GoogleFonts.lato(
                      color: SiteColors.primaryDark,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(
                      myRole,
                      style: GoogleFonts.lato(
                        color: SiteColors.primaryDark,
                        fontSize: 13.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 1.w),
            Container(
              width: 46.w,
              decoration: BoxDecoration(
                border: Border.all(color: SiteColors.primaryDark),
              ),
              padding: EdgeInsets.symmetric(vertical: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'THE OUTCOME',
                    style: GoogleFonts.lato(
                      color: SiteColors.primaryDark,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(
                      theOutcome,
                      style: GoogleFonts.lato(
                        color: SiteColors.primaryDark,
                        fontSize: 13.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class FurtherReadingComponent extends StatelessWidget {
  const FurtherReadingComponent({super.key, required this.furtherReadingItems});

  final List<Widget> furtherReadingItems;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Continue Reading',
          style: GoogleFonts.lato(
            color: SiteColors.primaryDark,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 3.h),
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
            itemCount: furtherReadingItems.length,
            // total number of items
            itemBuilder: (context, index) {
              return furtherReadingItems[index];
            },
          );
        }),
      ],
    );
  }
}

class ConnectSection extends StatelessWidget {
  const ConnectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri MediumUrl = Uri.parse('https://nirmalkarthikeyan.medium.com/');
    final Uri LinkedInUrl =
        Uri.parse('https://www.linkedin.com/in/nirmal-karthikeyan/');

    Future<void> _launchUrl(Uri _url) async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [

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
                    _launchUrl(MediumUrl);
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
                    _launchUrl(LinkedInUrl);
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
