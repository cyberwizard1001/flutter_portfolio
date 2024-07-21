import 'package:flutter/material.dart';
import 'package:flutter_portfolio/data/projectData.dart';
import 'package:flutter_portfolio/screens/home_page.dart';
import 'package:flutter_portfolio/screens/project_page.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



void main() {
  runApp(const App(),);
  ProjectData().addProjects();
}

final _router = GoRouter(routes: [
    GoRoute(path: '/',
      builder: (context,state) => const HomePage(),
    ),
    GoRoute(path: '/projects/:projectID',
      builder: (context,state) {
        final projectID = int.parse(state.pathParameters['projectID']!);
      return ProjectPage(
        projectID: projectID,
      );}

    )
],
);


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
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


