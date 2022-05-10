import 'package:sleuth/core/const/color_constants.dart';
import 'package:sleuth/data/workout_data.dart';
import 'package:sleuth/screens/friends_details_screen/widget/panel/friends_details_panel.dart';
import 'package:sleuth/screens/friends_details_screen/widget/friends_details_body.dart';
import 'package:flutter/material.dart';
//import 'package:sliding_up_panel/sliding_up_panel.dart';

class FriendsDetailsContent extends StatelessWidget {
  final FriendsData workout;

  const FriendsDetailsContent({required this.workout});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: ColorConstants.white,
      //   child: _createSlidingUpPanel(context),
    );
  }

  // Widget _createSlidingUpPanel(BuildContext context) {
  // return SlidingUpPanel(
  //    panel: FriendsDetailsPanel(workout: workout),
  //    body: FriendsDetailsBody(workout: workout),
  //    minHeight: MediaQuery.of(context).size.height * 0.65,
  //     maxHeight: MediaQuery.of(context).size.height * 0.87,
  //     isDraggable: true,
  //    borderRadius: BorderRadius.only(
  //      topLeft: Radius.circular(50),
  //      topRight: Radius.circular(50),
  //    ),
//  );
//  }
}