import 'package:sleuth/core/const/color_constants.dart';
import 'package:sleuth/core/const/path_constants.dart';
import 'package:sleuth/core/const/text_constants.dart';
import 'package:sleuth/data/exercise_data.dart';
import 'package:sleuth/screens/common_widgets/sleuth_button.dart';
import 'package:sleuth/screens/start_friends/bloc/start_friends_bloc.dart';
import 'package:sleuth/screens/start_friends/page/start_friends_page.dart';

import 'package:sleuth/screens/friends_details_screen/bloc/friendsdetails_bloc.dart' as workout_bloc;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartFriendsContent extends StatelessWidget {
  final ExerciseData exercise;
  final ExerciseData? nextExercise;

  StartFriendsContent({required this.exercise, required this.nextExercise});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: ColorConstants.white,
      child: SafeArea(
        child: _createDetailedExercise(context),
      ),
    );
  }

  Widget _createDetailedExercise(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createBackButton(context),
          const SizedBox(height: 23),
          //      _createVideo(context),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(children: [
              _createTitle(),
              const SizedBox(height: 9),
              _createDescription(),
              const SizedBox(height: 30),
              _createSteps(),
            ]),
          ),
          _createTimeTracker(context),
        ],
      ),
    );
  }

  Widget _createBackButton(BuildContext context) {
    final bloc = BlocProvider.of<StartFriendsBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 8),
      child: GestureDetector(
        child: BlocBuilder<StartFriendsBloc, StartFriendsState>(
          builder: (context, state) {
            return Row(
              children: [
                Image(image: AssetImage(PathConstants.back)),
                const SizedBox(width: 17),
                Text(
                  TextConstants.back,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            );
          },
        ),
        onTap: () {
          bloc.add(BackTappedEvent());
        },
      ),
    );
  }

  // Widget _createVideo(BuildContext context) {
  //  final bloc = BlocProvider.of<StartFriendsBloc>(context);
  //  return Container(
  //     height: 264,
  //    width: double.infinity,
  //    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorConstants.white),

//   );
  // }

  Widget _createTitle() {
    return Text(exercise.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
  }

  Widget _createDescription() {
    return Text(exercise.description, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500));
  }

  Widget _createSteps() {
    return Column(
      children: [
        for (int i = 0; i < exercise.steps.length; i++) ...[
          Step(number: "${i + 1}", description: exercise.steps[i]),
          const SizedBox(height: 20),
        ],
      ],
    );
  }

  Widget _createTimeTracker(BuildContext context) {
    // final bloc = BlocProvider.of<StartWorkoutBloc>(context);
    return Container(
      width: double.infinity,
      color: ColorConstants.white,
      child: Column(
        children: [
          nextExercise != null
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                TextConstants.nextExercise,
                style: TextStyle(
                  color: ColorConstants.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                nextExercise?.title ?? "",
                style: TextStyle(
                  color: ColorConstants.textBlack,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6.5),
              Icon(Icons.access_time, size: 20),
              const SizedBox(width: 6.5),
              Text('00:${nextExercise!.minutes > 10 ? nextExercise!.minutes : '0${nextExercise!.minutes}'}')
              // BlocBuilder<StartWorkoutBloc, StartWorkoutState>(
              //   buildWhen: (_, currState) => currState is PlayTimerState || currState is PauseTimerState,
              //   builder: (context, state) {
              //     return StartWorkoutTimer(
              //       time: bloc.time,
              //       isPaused: !(state is PlayTimerState),
              //     );
              //   },
              // ),
            ],
          )
              : SizedBox.shrink(),
          const SizedBox(height: 18),
          _createButton(context),
        ],
      ),
    );
  }

  Widget _createButton(BuildContext context) {
    return SleuthButton(
      title: nextExercise != null ? TextConstants.next : 'Finish',
      onTap: () {
      //   if (nextExercise != null) {
          //    List<ExerciseData> exercisesList = BlocProvider.of<workout_bloc.FriendsDetailsBloc>(context).workout.exerciseDataList;
          //  int currentExerciseIndex = exercisesList.indexOf(exercise);
          //  if (currentExerciseIndex < exercisesList.length - 1) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<workout_bloc.FriendsDetailsBloc>(context),
                    //     child: StartFriendsPage(
                      //     exercise: exercisesList[currentExerciseIndex + 1],
                      //   currentExercise: exercisesList[currentExerciseIndex + 1],
                      //  nextExercise: currentExerciseIndex + 2 < exercisesList.length ? exercisesList[currentExerciseIndex + 2] : null,
                    ),
                  ));
    //   );
      //    }
      //   }// else {
//   Navigator.of(context).pop();
        }
      //   },
    );
  }
}

class Step extends StatelessWidget {
  final String number;
  final String description;

  Step({required this.number, required this.description});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstants.primaryColor.withOpacity(0.12),
          ),
          child: Center(child: Text(number, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor))),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(description)),
      ],
    );
  }
}