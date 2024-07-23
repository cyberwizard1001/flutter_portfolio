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
              if (imageLocation != 'no')
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.network(
                            imageLocation,
                            fit: BoxFit.cover,
                          )),
                    )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
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
