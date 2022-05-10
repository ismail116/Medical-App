import 'package:sleuth/data/exercise_data.dart';
import 'package:sleuth/screens/start_friends/bloc/start_friends_bloc.dart';
import 'package:sleuth/screens/start_friends/widget/start_friends_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartFriendsPage extends StatelessWidget {
  final ExerciseData exercise;
  final ExerciseData currentExercise;
  final ExerciseData? nextExercise;

  StartFriendsPage(
      {required this.exercise,
        required this.currentExercise,
        required this.nextExercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContext(context),
    );
  }

  BlocProvider<StartFriendsBloc> _buildContext(BuildContext context) {
    return BlocProvider<StartFriendsBloc>(
      create: (context) => StartFriendsBloc(),
      child: BlocConsumer<StartFriendsBloc, StartFriendsState>(
        buildWhen: (_, currState) => currState is StartFriendsInitial,
        builder: (context, state) {
          return StartFriendsContent(
            exercise: exercise,
            nextExercise: nextExercise,
          );
        },
        listenWhen: (_, currState) => currState is BackTappedState,
        listener: (context, state) {
          if (state is BackTappedState) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}