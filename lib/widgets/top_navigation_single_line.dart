import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopNavigationSingleLine extends StatefulWidget {
  const TopNavigationSingleLine({super.key});

  @override
  State<TopNavigationSingleLine> createState() => _TopNavigationState();
}

class _TopNavigationState extends State<TopNavigationSingleLine> {


  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/');
        break;
      case 2:
        GoRouter.of(context).go('/projects');
        break;
      case 3:
        GoRouter.of(context).go('/contact');
        break;
    }
  }

  Widget _buildNavItem(String title, int index) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return SiteColors.focusBackgroundDark;
            }
            if (states.contains(WidgetState.pressed)) {
              return SiteColors.secondaryBackgroundDark;
            }
            return SiteColors.primaryDark;
          },
        ),
      ),

      onPressed: () {
        _onItemTapped(index);
      },
      child: Text(
        title,
        style: GoogleFonts.lato(
          color: SiteColors.secondaryDark,
          fontWeight: FontWeight.bold,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            child: Text('Nirmal Karthikeyan',
                style: GoogleFonts.lato(
                    color: SiteColors.primaryDark,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              context.go('/');
            },
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 60.w, minWidth: 30.w),
            width: MediaQuery.of(context).size.width > 1000 ? 35.w : 45.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem('Home', 0),
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
