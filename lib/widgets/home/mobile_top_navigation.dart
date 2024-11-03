import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MobileNavigation extends StatefulWidget {
  const MobileNavigation({super.key});

  @override
  State<MobileNavigation> createState() => _MobileNavigationState();
}

class _MobileNavigationState extends State<MobileNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close drawer after selection
  }

  Widget _buildNavItem(String title, int index, IconData icon) {
    return ListTile(
      onTap: () => _onItemTapped(index),
      selected: _selectedIndex == index,
      selectedColor: SiteColors.primaryDark,
      selectedTileColor: SiteColors.secondaryBackgroundDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      leading: Icon(
        icon,
        color: _selectedIndex == index ? SiteColors.primaryDark : SiteColors.secondaryDark,
      ),
      title: Text(
        title,
        style: GoogleFonts.lato(
          color: _selectedIndex == index ? SiteColors.primaryDark : SiteColors.secondaryDark,
          fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: SiteColors.backgroundDark,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: SiteColors.secondaryBackgroundDark,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Nirmal Karthikeyan',
                  style: GoogleFonts.lato(
                    color: SiteColors.primaryDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  'Portfolio',
                  style: GoogleFonts.lato(
                    color: SiteColors.secondaryDark,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              children: [
                _buildNavItem('Home', 0, Icons.home),
                SizedBox(height: 2.h),
                _buildNavItem('About', 1, Icons.person),
                SizedBox(height: 2.h),
                _buildNavItem('Projects', 2, Icons.work),
                SizedBox(height: 2.h),
                _buildNavItem('Contact', 3, Icons.mail),
              ],
            ),
          ),
        ],
      ),
    );
  }
}