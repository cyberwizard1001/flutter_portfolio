import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class Command extends StatelessWidget {

  final num serial;
  final String command;
  final String description;

  const Command({super.key, required this.command, required this.description, required this.serial});

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      children: [
        if(serial>9)
        TextSpan(
          text: '$serial. $command',
          style: GoogleFonts.lato(
            color: SiteColors.focusDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        if(serial<=9)
        TextSpan(
          text: '0$serial. $command',
          style: GoogleFonts.lato(
            color: SiteColors.focusDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' - $description',
          style: GoogleFonts.lato(
            color: SiteColors.primaryDark,
          ),
        ),
      ],
    ));
  }
}
