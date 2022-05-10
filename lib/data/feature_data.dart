import 'package:flutter/material.dart';

class FeaturesData {
  final IconData icon;
  final String title;
  final String description;

  FeaturesData({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  String toString() {
    return 'FeatureData(title: $title, description: $description';
  }
}