import 'package:flutter_portfolio/widgets/projects/phase_widget.dart';
import 'package:flutter_portfolio/widgets/projects/projects_card.dart';
import '../models/project_model.dart';
import '../widgets/projects/section_widget.dart';




class ProjectData {
  static final List<ProjectModel> projects = [];

  void addProjects() {
    projects.add(project1);
    projects.add(project2);
    projects.add(project3);
    projects.add(project4);
    projects.add(project5);
  }
}

final project1 = ProjectModel(
  projectName: 'Project 1',
  headingImageURL: 'no',
  category: 'Category 1',
  description: 'Description 1',
  theChallenge: 'The Challenge 1',
  myRole: 'My Role 1',
  theOutcome: 'The Outcome 1',
  phaseList: [
    const PhaseComponent(
      phaseCount: '01',
      phaseHeading: 'Phase 1',
      sectionComponents: [
        SectionComponent(
          sectionTitle: 'Section 1 Title', sectionDescription: 'Section 1 Description', sectionHighlight: 'Section 1 Highlight', sectionImageURL: 'no',
        ),
        SectionComponent(
          sectionTitle: 'Section 2 Title', sectionDescription: 'Section 2 Description', sectionHighlight: 'Section 2 Highlight', sectionImageURL: 'no',
        ),

      ],
    ),

  ],
  furtherReadingItems: [
    const ProjectsCard(projectID: 1),
    const ProjectsCard(projectID: 2),
  ],
);

final project2 = ProjectModel(
  projectName: 'Project 2',
  headingImageURL: 'no',
  category: 'Category 2',
  description: 'Description 2',
  theChallenge: 'The Challenge 2',
  myRole: 'My Role 2',
  theOutcome: 'The Outcome 2',
  phaseList: [
    const PhaseComponent(
      phaseCount: '01',
      phaseHeading: 'Phase 1',
      sectionComponents: [
        SectionComponent(
          sectionTitle: 'Section 1 Title', sectionDescription: 'Section 1 Description', sectionHighlight: 'Section 1 Highlight', sectionImageURL: 'no',
        ),
        SectionComponent(
          sectionTitle: 'Section 2 Title', sectionDescription: 'Section 2 Description', sectionHighlight: 'Section 2 Highlight', sectionImageURL: 'no',
        ),

      ],
    ),

  ],
  furtherReadingItems: [
    const ProjectsCard(projectID: 1),
    const ProjectsCard(projectID: 2),
  ],);

final project3 = ProjectModel(
  projectName: 'Project 3',
  headingImageURL: 'no',
  category: 'Category 3',
  description: 'Description 3',
  theChallenge: 'The Challenge 3',
  myRole: 'My Role 3',
  theOutcome: 'The Outcome 3',
  phaseList: [
    const PhaseComponent(
      phaseCount: '01',
      phaseHeading: 'Phase 1',
      sectionComponents: [
        SectionComponent(
          sectionTitle: 'Section 1 Title', sectionDescription: 'Section 1 Description', sectionHighlight: 'Section 1 Highlight', sectionImageURL: 'no',
        ),
        SectionComponent(
          sectionTitle: 'Section 2 Title', sectionDescription: 'Section 2 Description', sectionHighlight: 'Section 2 Highlight', sectionImageURL: 'no',
        ),

      ],
    ),

  ],
  furtherReadingItems: [
    const ProjectsCard(projectID: 1),
    const ProjectsCard(projectID: 2),
  ],
);

final project4 = ProjectModel(
  projectName: 'Project 4',
  headingImageURL: 'no',
  category: 'Category 4',
  description: 'Description 4',
  theChallenge: 'The Challenge 4',
  myRole: 'My Role 4',
  theOutcome: 'The Outcome 4',
  phaseList: [
    const PhaseComponent(
      phaseCount: '01',
      phaseHeading: 'Phase 1',
      sectionComponents: [
        SectionComponent(
          sectionTitle: 'Section 1 Title', sectionDescription: 'Section 1 Description', sectionHighlight: 'Section 1 Highlight', sectionImageURL: 'no',
        ),
        SectionComponent(
          sectionTitle: 'Section 2 Title', sectionDescription: 'Section 2 Description', sectionHighlight: 'Section 2 Highlight', sectionImageURL: 'no',
        ),

      ],
    ),

  ],
  furtherReadingItems: [
    const ProjectsCard(projectID: 1),
    const ProjectsCard(projectID: 2),
  ],
);

final project5 = ProjectModel(
  projectName: 'Project 5',
  headingImageURL: 'no',
  category: 'Category 5',
  description: 'Description 5',
  theChallenge: 'The Challenge 5',
  myRole: 'My Role 5',
  theOutcome: 'The Outcome 5',
  phaseList: [
    const PhaseComponent(
      phaseCount: '01',
      phaseHeading: 'Phase 1',
      sectionComponents: [
        SectionComponent(
          sectionTitle: 'Section 1 Title', sectionDescription: 'Section 1 Description', sectionHighlight: 'Section 1 Highlight', sectionImageURL: 'no',
        ),
        SectionComponent(
          sectionTitle: 'Section 2 Title', sectionDescription: 'Section 2 Description', sectionHighlight: 'Section 2 Highlight', sectionImageURL: 'no',
        ),

      ],
    ),

  ],
  furtherReadingItems: [
    const ProjectsCard(projectID: 1),
    const ProjectsCard(projectID: 2),
  ],
);