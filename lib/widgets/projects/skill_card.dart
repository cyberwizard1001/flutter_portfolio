import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SkillCard extends StatelessWidget {
  final Alignment alignment;
  final String imageLocation;
  final String skill;
  const SkillCard(
      {super.key,
      required this.alignment,
      required this.imageLocation,
      required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: SiteColors.cardBackgroundColorDark,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: SiteColors.primaryDark),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (imageLocation == 'no')
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: SiteColors.secondaryDark,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              else
                Align(
                    alignment: alignment,
                    child: Expanded(
                      child: Container(
                        height: skill == 'UX Design' ? 18.h : skill == 'User Research' ? 12.h : skill =='AWS' ? 15.h : 13.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image(
                            image: AssetImage(imageLocation),
                            fit: BoxFit.cover,
                          )),
                    )),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0,
                top: skill == 'UX Design' ? 10 : skill == 'User Research' ? 6.h : 4.h),
                child: Text(
                  skill,
                  style: GoogleFonts.lato(
                    fontSize: 12.sp,
                    color: SiteColors.primaryDark,
                  ),
                ),
              ),
              SizedBox(height: 1.h)
            ],
          ),
        ));
  }
}
