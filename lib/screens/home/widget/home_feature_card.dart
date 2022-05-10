import 'package:sleuth/core/const/color_constants.dart';
import 'package:sleuth/data/feature_data.dart';
import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final Color color;
  final FeaturesData feature;
  final Function() onTap;

  const FeatureCard({
    required this.color,
    required this.feature,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          top: 10,
          right: 12,
        ),
        height: 160,
        width: screenWidth * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Icon(
              feature.icon,
              color: ColorConstants.white,
            ),
            const SizedBox(height: 10),
            Text(
              feature.title,
              style: const TextStyle(
                color: ColorConstants.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              feature.description,
              style: const TextStyle(
                color: ColorConstants.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
