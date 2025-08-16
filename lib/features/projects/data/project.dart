// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';

import 'package:newportfolio/features/projects/data/platforms.dart';

class Project {
  final int id;
  final String title, description, image, category;
  final List<String> technologies, features;
  final String downloads;
  final double? rating;
  final Platforms platforms;
  final String? github;
  final String? demo;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.technologies,
    required this.features,
    required this.downloads,
    this.rating,
    required this.platforms,
    this.github,
    this.demo,
  });

  @override
  bool operator ==(covariant Project other) {
    if (identical(this, other)) return true;

    return other.id == id && other.category == category && listEquals(other.features, features) && other.downloads == downloads && other.rating == rating && other.platforms == platforms && other.demo == demo;
  }

  @override
  int get hashCode {
    return id.hashCode ^ category.hashCode ^ features.hashCode ^ downloads.hashCode ^ rating.hashCode ^ platforms.hashCode ^ demo.hashCode;
  }
}
