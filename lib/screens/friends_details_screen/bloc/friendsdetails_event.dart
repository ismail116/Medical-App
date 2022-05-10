part of 'friendsdetails_bloc.dart';

@immutable
abstract class FriendsDetailsEvent {}

class BackTappedEvent extends FriendsDetailsEvent {}

class FriendsExerciseCellTappedEvent extends FriendsDetailsEvent {
  // final ExerciseData currentExercise;
  // final ExerciseData? nextExercise;

  FriendsExerciseCellTappedEvent(//{
    //   required this.currentExercise,
//   required this.nextExercise,
//  }
      );}