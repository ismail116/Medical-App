import 'package:sleuth/core/const/path_constants.dart';
import 'package:sleuth/core/const/text_constants.dart';
import 'package:sleuth/data/workout_data.dart';
import 'package:sleuth/screens/friends_details_screen/widget/panel/friends_list.dart';
import 'package:sleuth/screens/friends_details_screen/widget/panel/friends_tag.dart';
import 'package:flutter/material.dart';

class FriendsDetailsPanel extends StatelessWidget {
  final FriendsData workout;

  FriendsDetailsPanel({required this.workout});

  @override
  Widget build(BuildContext context) {
    return _createPanelData();
  }

  Widget _createPanelData() {
    return Column(
      children: [
        const SizedBox(height: 15),
        _createRectangle(),
        const SizedBox(height: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createHeader(),
              const SizedBox(height: 20),
              _createFriendsData(),
              SizedBox(height: 20),
              //        _createExerciesList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createRectangle() {
    return Image(image: AssetImage(PathConstants.rectangle));
  }

  Widget _createHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        workout.title + "  " + TextConstants.friends,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _createFriendsData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          FriendsTag(
            icon: PathConstants.heartrate,
            content: "${workout.heartrate}",
          ),
          const SizedBox(width: 15),
          FriendsTag(
            icon: PathConstants.oxygenpercent,
            content: "${workout.oxygenpercent} ${TextConstants.spo2Unit}",
          ),
        ],
      ),
    );
  }

//  Widget _createExerciesList() {
  //   return Expanded(
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 20),
  //       child: ExercisesList(exercises: workout.exerciseDataList, workout: workout),
  // ),
// );
// }
}