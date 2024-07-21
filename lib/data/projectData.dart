//This file will be used to store objects of class projectModel and store data required for the project page

import 'package:flutter/material.dart';

import '../models/projectModel.dart';




class ProjectData {
  static final List<ProjectModel> projects = [];

  void addProjects() {
    projects.add(project1);
    projects.add(project2);
    projects.add(project3);
  }

}

final ProjectModel project1 = ProjectModel(
  'no',
  'Mobile App',
  'A mobile app that helps users to find the best places to eat in their city',
  'The challenge was to create a mobile app that would help users find the best places to eat in their city. The app needed to be user-friendly and easy to navigate.',
  'My role was to design the user interface and user experience of the app. I also worked on the front-end development of the app.',
  'The outcome was a user-friendly app that helped users find the best places to eat in their city. The app received positive feedback from users and was featured in the app store.',
  [
    Text('Phase 1: Research'),
    Text('Phase 2: Design'),
    Text('Phase 3: Development'),
    Text('Phase 4: Testing'),
  ],
  [
    Text('Further reading: How to design a user-friendly app'),
    Text('Further reading: The importance of user experience in app design'),
  ],
  projectName: 'Foodie App',
);

final ProjectModel project2 = ProjectModel(
  'no',
  'Web App',
  'A web app that helps users to track their fitness goals and progress',
  'The challenge was to create a web app that would help users track their fitness goals and progress. The app needed to be easy to use and provide users with valuable insights into their fitness journey.',
  'My role was to design the user interface and user experience of the app. I also worked on the front-end development of the app.',
  'The outcome was a web app that helped users track their fitness goals and progress. The app received positive feedback from users and was featured in the app store.',
  [
    Text('Phase 1: Research'),
    Text('Phase 2: Design'),
    Text('Phase 3: Development'),
    Text('Phase 4: Testing'),
  ],
  [
    Text('Further reading: How to design a user-friendly web app'),
    Text('Further reading: The importance of user experience in web app design'),
  ],
  projectName: 'Fitness Tracker',
);

final ProjectModel project3 = ProjectModel(
  'no',
  'Mobile App',
  'A mobile app that helps users to find the best places to eat in their city',
  'The challenge was to create a mobile app that would help users find the best places to eat in their city. The app needed to be user-friendly and easy to navigate.',
  'My role was to design the user interface and user experience of the app. I also worked on the front-end development of the app.',
  'The outcome was a user-friendly app that helped users find the best places to eat in their city. The app received positive feedback from users and was featured in the app store.',
  [
    Text('Phase 1: Research'),
    Text('Phase 2: Design'),
    Text('Phase 3: Development'),
    Text('Phase 4: Testing'),
  ],
  [
    Text('Further reading: How to design a user-friendly app'),
    Text('Further reading: The importance of user experience in app design'),
  ],
  projectName: 'Foodie App',
);