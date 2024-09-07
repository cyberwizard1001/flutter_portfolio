import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/top_navigation_single_line.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_portfolio/utils/colors.dart';
import 'package:flutter_portfolio/utils/responsive.dart';
import 'package:flutter_portfolio/widgets/projects/projects_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/projects/connect_section.dart';


class ProjectsListingPage extends StatelessWidget {
  ProjectsListingPage({super.key});

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
          return CustomScrollView(controller: _scrollController, slivers: [
            SliverStickyHeader(
              header: const TopNavigationSingleLine(),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(height: 6.h),
                    const Header(),
                    SizedBox(height: 5.h),
                    ProjectsListGridview(),
                    SizedBox(height: 20.h),
                    const ConnectSection()
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

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Projects',
          style: GoogleFonts.lato(
            color: SiteColors.primaryDark,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          'This is some text here that explains what I have in the projects section and is this long and wide',
          style: GoogleFonts.lato(color: SiteColors.primaryDark, fontSize: 13.sp),
        )
      ],
    );
  }
}

class ProjectsListGridview extends StatelessWidget {
  ProjectsListGridview({super.key});

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
    const ProjectsCard(
      projectID: 3,
    ),
    const ProjectsCard(
      projectID: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        }),

      ]
    );
  }
}


