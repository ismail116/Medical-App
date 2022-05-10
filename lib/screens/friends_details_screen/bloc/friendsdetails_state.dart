part of 'friendsdetails_bloc.dart';

@immutable
abstract class FriendsDetailsState {}

class FriendsDetailsInitial extends FriendsDetailsState {}

class BackTappedState extends FriendsDetailsState {}

class FriendsExerciseCellTappedState extends FriendsDetailsState {
  final ExerciseData currentExercise;
  final ExerciseData? nextExercise;

  FriendsExerciseCellTappedState({
    required this.currentExercise,
    required this.nextExercise,
  });
}