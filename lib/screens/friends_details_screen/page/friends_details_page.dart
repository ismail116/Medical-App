import 'package:sleuth/core/const/text_constants.dart';
import 'package:sleuth/data/exercise_data.dart';
import 'package:sleuth/data/workout_data.dart';
import 'package:sleuth/screens/common_widgets/sleuth_button.dart';
import 'package:sleuth/screens/start_friends/page/start_friends_page.dart';
import 'package:sleuth/screens/friends_details_screen/bloc/friendsdetails_bloc.dart';
import 'package:sleuth/screens/friends_details_screen/widget/friends_details_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sleuth/core/extensions/list_extension.dart';

class FriendsDetailsPage extends StatelessWidget {
  final FriendsData workout;
  FriendsDetailsPage({required this.workout});

  @override
  Widget build(BuildContext context) {
    return _buildContext(context);
  }

  BlocProvider<FriendsDetailsBloc> _buildContext(BuildContext context) {
    return BlocProvider<FriendsDetailsBloc>(
      create: (context) => FriendsDetailsBloc(workout: workout),
      child: BlocConsumer<FriendsDetailsBloc, FriendsDetailsState>(
        buildWhen: (_, currState) => currState is FriendsDetailsInitial,
        builder: (context, state) {
          return Scaffold(
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SleuthButton(
                  title: TextConstants.start,
                  onTap: () {
                    //      ExerciseData? exercise = workout.friendsDataList.firstWhereOrNull((element) => element.progress < 1);
                    //    if (exercise == null) exercise = workout.exerciseDataList.first;
                    //     int exerciseIndex = workout.exerciseDataList.indexOf(exercise);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<FriendsDetailsBloc>(context),

                          )),
                    );
                  },
                ),
              ),
              body: FriendsDetailsContent(workout: workout));
        },
        listenWhen: (_, currState) => currState is BackTappedState || currState is FriendsExerciseCellTappedState,
        listener: (context, state) {
          if (state is BackTappedState) {
            Navigator.pop(context);
          } else if (state is FriendsExerciseCellTappedState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<FriendsDetailsBloc>(context),

                  )),
            );
          }
        },
      ),
    );
  }
}