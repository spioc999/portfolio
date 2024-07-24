import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:spioc_portfolio/core/resources/res.dart';
import 'package:spioc_portfolio/models/models.dart';

class Me {
  final String initials;
  final String firstName;
  final String lastName;
  final String role;
  final List<Contact> contacts;
  final String? projectsUrl;
  final DateTime dateOfBirth;
  final List<String> imageUrls;

  final About about;
  final List<Education> educations;
  final List<Experience> experiences;

  Me({
    required this.initials,
    required this.firstName,
    required this.lastName,
    required this.contacts,
    this.projectsUrl,
    required this.dateOfBirth,
    required this.imageUrls,
    required this.role,
    required this.about,
    required this.educations,
    required this.experiences,
  });

  String get fullName => '$firstName $lastName';
}

const lastRole = 'Flutter & AI Engineer';

final simonePioCaronia = Me(
  initials: 'SPC',
  firstName: 'Simone Pio',
  lastName: 'Caronia',
  role: lastRole,
  contacts: [
    Contact(
      link: 'https://github.com/spioc999/',
      icon: SimpleIcons.github,
    ),
    Contact(
      link: 'https://www.linkedin.com/in/simone-pio-caronia-8b959916b/',
      icon: SimpleIcons.linkedin,
    ),
    Contact(
      link: 'https://www.instagram.com/spioc_999/',
      icon: SimpleIcons.instagram,
    ),
  ],
  projectsUrl: 'https://github.com/spioc999?tab=repositories',
  dateOfBirth: DateTime(1999, 10, 20),
  imageUrls: [Res.jpgMeSerious, Res.jpgMeSmiling],
  about: About(
    intro: (l10n, params) => l10n.aboutmeview_intro(
      params['firstName'],
      params['role'],
      params['yearsOld'],
    ),
    technologies: [
      Technology(
        icon: SimpleIcons.flutter,
        name: 'Flutter',
      ),
      Technology(
        icon: SimpleIcons.dart,
        name: 'Dart',
      ),
      Technology(
        icon: SimpleIcons.python,
        name: 'Python',
      ),
      Technology(
        icon: SimpleIcons.git,
        name: 'Git',
      ),
      Technology(
        icon: SimpleIcons.docker,
        name: 'Docker',
      ),
      Technology(
        icon: SimpleIcons.nodedotjs,
        name: 'Node.js',
      ),
      Technology(
        icon: SimpleIcons.kotlin,
        name: 'Kotlin',
      ),
      Technology(
        icon: SimpleIcons.swift,
        name: 'Swift',
      ),
      Technology(
        icon: SimpleIcons.firebase,
        name: 'Firebase',
      ),
      Technology(
        icon: SimpleIcons.databricks,
        name: 'SQL',
      ),
      Technology(
        icon: SimpleIcons.oracle,
        name: 'Java',
      ),
    ],
    softSkills: [
      SoftSkill(
        emoji: '✅',
        label: (l10n) => l10n.aboutmeview_softskills_problemsolving,
      ),
      SoftSkill(
        emoji: '👥',
        label: (l10n) => l10n.aboutmeview_softskills_teamworking,
      ),
      SoftSkill(
        emoji: '🗣️',
        label: (l10n) => l10n.aboutmeview_softskills_publicspeaking,
      ),
      SoftSkill(
        emoji: '🎨',
        label: (l10n) => l10n.aboutmeview_softskills_creativity,
      ),
      SoftSkill(
        emoji: '📌',
        label: (l10n) => l10n.aboutmeview_softskills_stubbornness,
      ),
    ],
    hobbies: [
      Hobby(
        label: (l10n) => l10n.aboutmeview_hobbies_racket,
        imageUrl: Res.jpgHobbyRacket,
      ),
      Hobby(
        label: (l10n) => l10n.aboutmeview_hobbies_basketball,
        imageUrl: Res.jpgHobbyBasket,
      ),
      Hobby(
        label: (l10n) => l10n.aboutmeview_hobbies_gdmi,
        imageUrl: Res.jpgHobbyGdmi,
      ),
      Hobby(
        label: (l10n) => l10n.aboutmeview_hobbies_sea,
        imageUrl: Res.jpgHobbySea,
      ),
      Hobby(
        label: (l10n) => l10n.aboutmeview_hobbies_trumpet,
        imageUrl: Res.jpgHobbyTrumpet,
      ),
      Hobby(
        label: (l10n) => l10n.aboutmeview_hobbies_travelling,
        imageUrl: Res.jpgHobbyTravelling,
      ),
      Hobby(
        label: (l10n) => l10n.aboutmeview_hobbies_lego,
        imageUrl: Res.jpgHobbyLego,
      ),
    ],
    projects: [
      Project(
        title: 'portfolio',
        description: (l10n) => l10n.aboutmeview_projects_portfolio_description,
        links: [
          (label: null, url: 'https://github.com/spioc999/portfolio'),
        ],
        techIcons: [
          SimpleIcons.flutter,
          SimpleIcons.dart,
          SimpleIcons.githubactions,
        ],
        hashtags: ['web'],
      ),
      Project(
        title: 'federated-learning-thesis',
        description: (l10n) =>
            l10n.aboutmeview_projects_federatedlearning_description,
        links: [
          (
            label: (l10n) =>
                l10n.aboutmeview_projects_federatedlearning_pythonlink_label,
            url:
                'https://github.com/spioc999/federated-learning-thesis-project',
          ),
          (
            label: (l10n) =>
                l10n.aboutmeview_projects_federatedlearning_nodejslink_label,
            url:
                'https://github.com/spioc999/federated-learning-module-snark-js',
          ),
        ],
        techIcons: [
          SimpleIcons.python,
          SimpleIcons.nodedotjs,
        ],
        hashtags: ['ai', 'security'],
      ),
      Project(
        title: 'bingo',
        description: (l10n) => l10n.aboutmeview_projects_bingo_description,
        links: [
          (
            label: (l10n) => l10n.aboutmeview_projects_bingo_corelink_label,
            url: 'https://github.com/PaoloRuggirello/bingo-core',
          ),
          (
            label: (l10n) => l10n.aboutmeview_projects_bingo_belink_label,
            url: 'https://github.com/PaoloRuggirello/bingo-be',
          ),
          (
            label: (l10n) => l10n.aboutmeview_projects_bingo_felink_label,
            url: 'https://github.com/spioc999/bingo_fe',
          ),
        ],
        techIcons: [
          SimpleIcons.flutter,
          SimpleIcons.dart,
          SimpleIcons.python,
          SimpleIcons.docker,
        ],
        hashtags: ['api', 'socket'],
      ),
    ],
    certifications: [
      Certification(
        icon: SimpleIcons.oracle,
        label: 'Oracle Certified Associate - Java SE 8',
      ),
      Certification(
        icon: Icons.language_outlined,
        label: 'TOEFL iBT (88/120 - B2)',
      ),
      Certification(
        icon: SimpleIcons.cisco,
        label: 'ITN CCNA1 - Cisco',
      ),
    ],
  ),
  experiences: [
    Experience(
      role: (_) => lastRole,
      company: 'Alpian Technologies',
      startDateTime: DateTime(2022, 11),
      endDateTime: null,
      workingType: ExperienceWorkingType.remote,
      locality: (l10n) => l10n.generic_rome,
    ),
    Experience(
      role: (_) => 'Digital Engineer',
      company: 'NTT Data',
      startDateTime: DateTime(2020, 9),
      endDateTime: DateTime(2022, 11),
      workingType: ExperienceWorkingType.hybrid,
      locality: (l10n) => l10n.generic_rome,
    ),
    Experience(
      role: (_) => 'Junior Mobile Developer',
      company: 'NTT Data',
      startDateTime: DateTime(2020, 4),
      endDateTime: DateTime(2020, 7),
      workingType: ExperienceWorkingType.internship,
      locality: (l10n) => l10n.generic_rome,
    ),
    Experience(
      role: (l10n) => l10n.experienceview_shopassistant_jobname,
      company: 'Piggybank',
      startDateTime: DateTime(2019, 8),
      endDateTime: DateTime(2019, 9),
      workingType: ExperienceWorkingType.summerWorkExperience,
      locality: (l10n) => l10n.generic_dublin,
    ),
    Experience(
      role: (_) => 'Junior Frontend Developer',
      company: 'NTT Data',
      startDateTime: DateTime(2019, 3),
      endDateTime: DateTime(2019, 7),
      workingType: ExperienceWorkingType.internship,
      locality: (l10n) => l10n.generic_rome,
    ),
    Experience(
      role: (l10n) => l10n.experienceview_referee_jobname,
      company: 'Federazione Italiana Pallacanestro',
      startDateTime: DateTime(2015, 11),
      endDateTime: DateTime(2018, 6),
    ),
  ],
  educations: [Education()],
);
