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

  ProjectModel({required this.projectName,required this.headingImageURL, required this.category, required this.description,required this.theChallenge, required this.myRole, required this.theOutcome, required this.phaseList, required this.furtherReadingItems, });
}