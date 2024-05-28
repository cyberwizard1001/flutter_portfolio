//Create a top navigation widget that is a rounded rectangle with 4 items and the selected item should have the inverse of the unselected ones and be shaped like a pill as a rounded rectangle
// The top navigation should have the following items:
// Home
// About
// Projects
// Contact


import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopNavigation extends StatefulWidget {
  const TopNavigation({Key? key}) : super(key: key);

  @override
  State<TopNavigation> createState() => _TopNavigationState();
}

class _TopNavigationState extends State<TopNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavItem(String title, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? SiteColors.primaryDark : SiteColors.secondaryBackgroundDark,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          title,
          style: GoogleFonts.lato(
            color: _selectedIndex == index ? SiteColors.primaryInverseDark : SiteColors.secondaryDark,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: SiteColors.backgroundDark,
      ),
      height: 20  .h,
      child: Flex(
        direction: Axis.vertical,
        children: [
         AppBar(
            backgroundColor: SiteColors.backgroundDark,
            title: Text('Nirmal Karthikeyan', style: GoogleFonts.lato(color: SiteColors.primaryDark, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 2.h,),
          Container(
            decoration: BoxDecoration(
              color: SiteColors.secondaryBackgroundDark,
              borderRadius: BorderRadius.circular(24),
            ),
            width: 45.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem('Home', 0),
                _buildNavItem('About', 1),
                _buildNavItem('Projects', 2),
                _buildNavItem('Contact', 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}