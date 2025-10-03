import 'package:paper_port/pages/work_section/deploy.dart';

class Project {
  final String description;
  final String downloads;
  final List<String> keyFeatures;
  final List<DeployPlatform?> platforms;
  final double rating;
  final List<String> screenshots;
  final List<String> tech;
  final String title;

  Project({
    required this.description,
    required this.downloads,
    required this.keyFeatures,
    required this.platforms,
    required this.rating,
    required this.screenshots,
    required this.tech,
    required this.title,
  });
}
