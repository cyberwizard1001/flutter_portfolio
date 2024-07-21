import 'package:flutter/material.dart';

class ProjectModel {
  final String projectName;
  final String headingImageURL;
  final String category;
  final String description;

  final String theChallenge;
  final String myRole;
  final String theOutcome;

  final List<Widget> phaseList;

  final List<Widget> furtherReadingItems;

  ProjectModel(this.headingImageURL, this.category, this.description, this.theChallenge, this.myRole, this.theOutcome, this.phaseList, this.furtherReadingItems, {required this.projectName,});
}