
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/colors.dart';

class SectionComponent extends StatelessWidget {
  const SectionComponent(
      {super.key,
        required this.sectionTitle,
        required this.sectionDescription,
        required this.sectionHighlight,
        required this.sectionImageURL});

  final String sectionTitle;
  final String sectionDescription;
  final String sectionHighlight;
  final String sectionImageURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sectionTitle,
                  style: GoogleFonts.lato(
                    color: SiteColors.primaryDark,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  sectionDescription,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.lato(
                    color: SiteColors.primaryDark,
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                if (sectionHighlight != '')
                  Container(
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: SiteColors.primaryDark,
                      ),
                    ),
                    padding: EdgeInsets.all(1.w),
                    child: Text(
                      sectionHighlight,
                      style: GoogleFonts.lato(
                        color: SiteColors.primaryDark,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: 5.w),
          if (sectionImageURL != 'no')
            SizedBox(
                height: 65.h,
                width: 45.w,
                child: Image.network(
                  sectionImageURL,
                  fit: BoxFit.cover,
                )),
          if (sectionImageURL == 'no')
            Container(
              height: 65.h,
              width: 45.w,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}

