/// main.dart - Entry Point of the Portfolio Website
///
/// This file serves as the entry point of the Flutter portfolio website.
/// It sets up the routing, theming, and other configurations for the entire application.
/// The main components and functions include:
///
/// - `setPathUrlStrategy()`: Configures the app to use a clean URL strategy,
///   removing the hash (#) from URLs for better readability and SEO.
/// - `runApp(App())`: Launches the Flutter app by creating an instance of the `App` widget.
/// - `ProjectData().addProjects()`: Initializes the project's data and populates the project list.
///
/// ### Routing:
/// The app uses the `GoRouter` package to manage routes:
/// - `/`: Displays the `HomePage` widget, which serves as the landing page of the website.
/// - `/projects/:projectID`: Displays the `ProjectPage` widget, which dynamically loads a detailed project page based on the provided project ID.
///
/// ### App Widget:
/// - `App`: The root widget of the application, wrapped in a `ResponsiveSizer` to handle different screen sizes and orientations.
/// - The app uses `MaterialApp.router` to configure routing with `GoRouter`, enabling seamless navigation within the app.
/// - Custom page transitions are implemented for Android and iOS using `ZoomPageTransitionsBuilder` and `CupertinoPageTransitionsBuilder`, respectively.
///
/// This file also disables the debug banner for a cleaner UI and sets a global theme for the app.
///
/// Author: Nirmal Karthikeyan
library;

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/data/project_data.dart';
import 'package:flutter_portfolio/screens/home_page.dart';
import 'package:flutter_portfolio/screens/project_page.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    const App(),
  );
  ProjectData().addProjects();
}

@override
Widget buildTransitions(BuildContext context, _, __, Widget child) {
  return child;
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
        path: '/projects/:projectID',
        builder: (context, state) {
          final projectID = int.parse(state.pathParameters['projectID']!);
          return ProjectPage(
            projectID: projectID,
          );
        })
  ],
);

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Nirmal Karthikeyan',
          theme: ThemeData(
            primarySwatch: Colors.blue,
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: ZoomPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                },
            ),
          ),
          routerConfig: _router,
        );
      },
    );
  }
}
