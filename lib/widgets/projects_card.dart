import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProjectsCard extends StatelessWidget {
  final String projectName;

  final String projectDescription;

  final String URL;

   ProjectsCard({super.key, required this.projectName, required this.projectDescription, required this.URL});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      width: 20.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(URL != 'no')
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(URL, fit: BoxFit.cover,)),
            ),
          if(URL == 'no')
          Expanded(
            child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
          ),),
          SizedBox(height: 2.h),
          Text(
            projectName,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: SiteColors.primaryDark,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
           projectDescription,
            style: TextStyle(
              fontSize: 10.sp,
              color: SiteColors.primaryDark,
            ),
          ),
        ],
    ));
  }
}
