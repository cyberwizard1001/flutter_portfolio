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
          ),
          routerConfig: _router,
        );
      },
    );
  }
}
