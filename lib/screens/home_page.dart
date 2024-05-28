import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/colors.dart';
import 'package:flutter_portfolio/widgets/top_navigation.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  void toTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SiteColors.backgroundDark,
      body: LayoutBuilder(builder: (context, constraints) {
        return CustomScrollView(slivers: [
          SliverStickyHeader(
            header: const TopNavigation(),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  LandingSection(),

                  //Add more sections here
                ],
              ),
            ),
          ),
        ]);
      }),
      floatingActionButton: Visibility(
        visible: _scrollController.hasClients && _scrollController.offset > 100,
        child: FloatingActionButton(
          onPressed: toTop,
          tooltip: 'To Top',
          child: const Icon(Icons.arrow_upward),
        ),
      ),
    );
  }
}

class LandingSection extends StatelessWidget {
  const LandingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      color: SiteColors.backgroundDark,
      child: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 8.w, right: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Weaving dreams into ',
                      style: GoogleFonts.lato(
                        color: SiteColors.primaryDark,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      children: [
                        TextSpan(
                            text: 'digital realities',
                            style: GoogleFonts.lato(
                              color: SiteColors.primaryDark,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w600,
                            ))
                      ]),
                ),
                Positioned(
                    left: 75.w,
                    top: 22.h,
                    child: MaterialButton(

                      color: SiteColors.primaryDark,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                  onPressed: () {},
                  child: Text('View CV',style: GoogleFonts.lato(color: SiteColors.primaryInverseDark),),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Let\'s talk',
                        style: GoogleFonts.lato(
                          color: SiteColors.primaryDark,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //email address
                      Text('nirmalkarthikeyan1@gmail.com',
                          style: GoogleFonts.lato(
                            color: SiteColors.secondaryDark,
                            fontSize: 14.sp,
                          )),
                    ],
                  ),
                ),
                Expanded(child: Container(), flex: 1),
                Expanded(
                  flex: 1,
                  child: Text(
                    "I'm a passionate UX design and research enthusiast who loves turning user needs into delightful digital experiences, one data-driven insight at a time.",
                    style: GoogleFonts.lato(
                      color: SiteColors.primaryDark,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
