import 'package:sleuth/core/const/path_constants.dart';
import 'package:sleuth/core/const/text_constants.dart';
import 'package:sleuth/data/feature_data.dart';
import 'package:sleuth/screens/onboarding/widget/onboarding_tile.dart';
import 'package:flutter/material.dart';

import '../../data/workout_data.dart';

class DataConstants {
  // Onboarding
  static final onboardingTiles = [
     OnboardingTile(
      title: TextConstants.onboarding1Title,
      mainText: TextConstants.onboarding1Description,
      imagePath: PathConstants.onboarding1,
    ),
     OnboardingTile(
      title: TextConstants.onboarding2Title,
      mainText: TextConstants.onboarding2Description,
      imagePath: PathConstants.onboarding2,
    ),
     OnboardingTile(
      title: TextConstants.onboarding3Title,
      mainText: TextConstants.onboarding3Description,
      imagePath: PathConstants.onboarding3,
    ),
  ];
  // Friends
  static final List<FriendsData> friends  = [
    FriendsData(
      title: TextConstants.ismailTitle,
      heartrate: TextConstants.ismailheartrate,
      oxygenpercent: TextConstants.ismailoxygenpercent,
      heartrate1: 98,
      SPO2: 89,
      image: PathConstants.face1Tacker,
    ),
    FriendsData(
      title: TextConstants.michaelTitle,
      heartrate: TextConstants.michaelheartrate,
      oxygenpercent: TextConstants.michaeloxygenpercent,
      heartrate1: 98,
      SPO2: 89,
      image: PathConstants.face2Tacker,
    ),
    FriendsData(
      title: TextConstants.MohamedTitle,
      heartrate: TextConstants.michaelheartrate,
      oxygenpercent: TextConstants.michaeloxygenpercent,
      heartrate1: 98,
      SPO2: 89,
      image: PathConstants.face3Tacker,

    ),
    FriendsData(
      title: TextConstants.YousefTitle,
      heartrate: TextConstants.Yousefheartrate,
      oxygenpercent: TextConstants.Yousefoxygenpercent,
      heartrate1: 98,
      SPO2: 89,
      image: PathConstants.face4Tacker,

    ),
  ];

  static final List<FeaturesData> homeFeatures = [
    FeaturesData(
      icon: Icons.assignment_ind_outlined,
      title: TextConstants.reportFeatureTitle,
      description: TextConstants.reportFeatureDescription,
    ),
    FeaturesData(
      icon: Icons.camera_alt_outlined,
      title: TextConstants.oximeterFeatureTitle,
      description: TextConstants.oximeterFeatureDescription,
    ),
  ];
  // Reminder
  static List<String> reminderDays = [
    TextConstants.everyday,
    TextConstants.monday_friday,
    TextConstants.weekends,
    TextConstants.monday,
    TextConstants.tuesday,
    TextConstants.wednesday,
    TextConstants.thursday,
    TextConstants.friday,
    TextConstants.saturday,
    TextConstants.sunday,
  ];
}
