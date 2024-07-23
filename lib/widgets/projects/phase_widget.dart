import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/projects/section_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/colors.dart';

class PhaseComponent extends StatelessWidget {
  const PhaseComponent(
      {super.key,
        required this.phaseCount,
        required this.phaseHeading,
        required this.sectionComponents});

  final String phaseCount;
  final String phaseHeading;
  final List<SectionComponent> sectionComponents;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          phaseCount,
          style: GoogleFonts.lato(
            color: SiteColors.primaryDark,
            fontSize: 14.sp,
            letterSpacing: 1.5,
            fontWeight: FontWeight.normal,
          ),
        ),
        Text(
          phaseHeading,
          style: GoogleFonts.lato(
            color: SiteColors.primaryDark,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 15.h),
        Column(
          children: sectionComponents,
        ),
        SizedBox(height: 15.h),
        const Divider(
          color: SiteColors.primaryDark,
        ),
      ],
    );
  }
}
