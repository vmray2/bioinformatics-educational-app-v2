import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:binf_educational_app_redone/domain/models/activity.dart';
import 'package:binf_educational_app_redone/domain/models/competency_badge.dart';
import 'package:binf_educational_app_redone/domain/models/curriculum.dart';
import 'package:binf_educational_app_redone/domain/models/module.dart';
import 'package:binf_educational_app_redone/domain/models/module_step.dart';
import 'package:binf_educational_app_redone/domain/models/user_progress.dart';

final mockProfile =  UserProfileCollection.create(
  username: "Researcher",
  userTitle: 'Genomics 2 Specialist',
  profileImgPath: "",
  accountCreated: DateTime.now(),
  lastActiveSession: DateTime.now(),
  consecutiveDays: 2
);

final mockProgress = UserProgress(
  unlockedModuleIds: const {'mod_1_bioinformatics_applications'}, 
  unlockedActivityIds: const {'act_module_flashcards'}, 
  unlockedBadgeIds: const {'badge_01'}, 
  userMetrics: const UserMetrics(totalXp: 250, currentLevel: 2),
  moduleStepMetrics: {
    "mod_1_step_1_what_is_bioinformatics_md": ModuleStepMetrics(isCompleted: true, status: 2, lastAccessed: DateTime.now()),
    "mod_1_step_2_what_is_bioinformatics_used_for_md": ModuleStepMetrics(isCompleted: false, status: 1, lastAccessed: DateTime.now()),
    "mod_1_step_3_who_can_use_bioinformatics_md": ModuleStepMetrics(isCompleted: false, status: 0, lastAccessed: DateTime.now())
  }
);

final mockProgress2 = UserProgress(
  unlockedModuleIds: {'mod_1_bioinformatics_applications'},
  unlockedActivityIds: {"act_module_flashcards"},
  unlockedBadgeIds: {'badge_01'},
  moduleMetrics: {},
  moduleStepMetrics: {
    "mod_1_step_1_what_is_bioinformatics_md": ModuleStepMetrics(isCompleted: true, status: 2, lastAccessed: DateTime.now()),
    "mod_1_step_2_what_is_bioinformatics_used_for_md": ModuleStepMetrics(isCompleted: false, status: 1, lastAccessed: DateTime.now()),
    "mod_1_step_3_who_can_use_bioinformatics_md": ModuleStepMetrics(isCompleted: false, status: 0, lastAccessed: DateTime.now())
  },
  activityMetrics: {},
  badgeMetrics: {},
  competencyMetrics: {
    "c1_role_of_bioinformatics": CompetencyMetrics(isCompleted: false, totalXp: 0), 
    "c2_computational_concepts": CompetencyMetrics(isCompleted: false, totalXp: 0), 
    "c3_statistical_concepts": CompetencyMetrics(isCompleted: false, totalXp: 0),
    "c4_bioinformatics_tools": CompetencyMetrics(isCompleted: false, totalXp: 0), 
    "c5_data_retrieval": CompetencyMetrics(isCompleted: false, totalXp: 0), 
    "c6_model": CompetencyMetrics(isCompleted: false, totalXp: 0),
    "c7_scripting": CompetencyMetrics(isCompleted: false, totalXp: 0), 
    "c8_data_types": CompetencyMetrics(isCompleted: false, totalXp: 0), 
    "c9_implications": CompetencyMetrics(isCompleted: false, totalXp: 0)
  },
  userMetrics: const UserMetrics(totalXp: 250, currentLevel: 2),
);

final mockModuleStepsMod1 = [
    ModuleStep(
      moduleStepId: "mod_1_step_1_what_is_bioinformatics_md", 
      title: "title", 
      type: "type", 
      markdownInstructions: "markdownInstructions", 
      imgPath: "imgPath", 
      hint: "hint", 
      estTime: "estTime", 
      description: "description"
    ),
    ModuleStep(
      moduleStepId: "mod_1_step_2_what_is_bioinformatics_used_for_md", 
      title: "title", 
      type: "type", 
      markdownInstructions: "markdownInstructions", 
      imgPath: "imgPath", 
      hint: "hint", 
      estTime: "estTime", 
      description: "description"
    ),
    ModuleStep(
      moduleStepId: "mod_1_step_3_who_can_use_bioinformatics_md", 
      title: "title", 
      type: "type", 
      markdownInstructions: "markdownInstructions", 
      imgPath: "imgPath", 
      hint: "hint", 
      estTime: "estTime", 
      description: "description"
    ),
  ];

  final mockModules = [
    Module(
      moduleId: "mod_1_bioinformatics_applications",
      moduleName: "Bioinformatics Applications",
      description: "",
      estTime: "",
      competenciesXp: {},
      moduleSteps: mockModuleStepsMod1
    ),
    Module(
      moduleId: "mod_2_basics_of_molecular_biology",
      moduleName: "Basics of Molecular Biology",
      description: "",
      estTime: "",
      competenciesXp: {},
      moduleSteps: []
    ),
  ];

  final mockCurriculum = Curriculum(
    catalogId: "", 
    catalogVersion: "catalogVersion", 
    totalModules: 9, 
    modules: mockModules
  );

  final mockActivities = [
    Activity(
      activityId: 'act_module_flashcards', 
      associatedModule: 'mod_1-9', 
      name: 'Module Flashcards',
      description: "",
      instructions: [],
      difficulty: "easy",
      estTime: "-",
      associatedCompetencies: []
    ),
    Activity(
      activityId: 'act_central_dogma_codon_slider', 
      associatedModule: 'mod_2_basics_of_molecular_biology', 
      name: 'Central Dogma Codon Slider',
      description: "",
      instructions: [],
      difficulty: "medium",
      estTime: "",
      associatedCompetencies: []
    ),  
  ];

  final mockBadges = [
    CompetencyBadge(
      badgeId: 'badge_01', 
      name: 'Badge 1', 
      description: 'Unlocked',
      imgPath: "assets/img/Bioinformatics Computer Sprite 256.png"
    ),
    CompetencyBadge(
      badgeId: 'badge_02', 
      name: 'Badge 2', 
      description: 'Locked',
      imgPath: "assets/img/Bioinformatics Computer Sprite 256.png"
    ),
  ];