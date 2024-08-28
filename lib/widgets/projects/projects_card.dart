import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../data/project_data.dart';


class ProjectsCard extends StatefulWidget {

  final int projectID;

   const ProjectsCard({super.key, required this.projectID,});

  @override
  State<ProjectsCard> createState() => _ProjectsCardState();
}

class _ProjectsCardState extends State<ProjectsCard> {

  late final String projectName;

  late final String projectDescription;

  late final String url;

  @override
  void initState() {
    super.initState();
    projectName = ProjectData.projects[widget.projectID].projectName;
    projectDescription = ProjectData.projects[widget.projectID].description;
    url = ProjectData.projects[widget.projectID].headingImageURL;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          debugPrint('Project card tapped');
          var route = '/projects/${widget.projectID}';
          debugPrint('Navigating to $route');
          context.push(route);
        },
        child: SizedBox(
          height: 20.h,
          width: 20.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(url != 'no')
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(url, fit: BoxFit.cover,)),
                ),
              if(url == 'no')
              Expanded(
                child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),),
              SizedBox(height: 1.h),
              Text(
                projectName,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: SiteColors.primaryDark,
                ),
              ),
              Text(
               projectDescription,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: SiteColors.primaryDark,
                ),
              ),
            ],
        )),
      ),
    );
  }
}
