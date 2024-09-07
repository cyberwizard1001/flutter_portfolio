import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/colors.dart';

class ConnectSection extends StatelessWidget {
  const ConnectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri mediumUrl = Uri.parse('https://nirmalkarthikeyan.medium.com/');
    final Uri linkedInUrl =
    Uri.parse('https://www.linkedin.com/in/nirmal-karthikeyan/');
    final Uri cvUrl = Uri.parse(
        'https://github.com/cyberwizard1001/flutter_portfolio/blob/dadd504b8353b29bf4343092ae3569f46c7ba0eb/assets/pdfs/Nirmal_Karthikeyan.pdf');
    final Uri repositoryUrl = Uri.parse('https://github.com/cyberwizard1001/flutter_portfolio');

    Future<void> customLaunchUrl(Uri url) async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
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
            width: 30.w,
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
                    customLaunchUrl(cvUrl);
                  },
                  child: Text(
                    'View my CV',
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
                    'LinkedIn',
                    style: GoogleFonts.lato(
                      color: SiteColors.primaryDark,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    customLaunchUrl(mediumUrl);
                  },
                  child: Text(
                    'Medium',
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

