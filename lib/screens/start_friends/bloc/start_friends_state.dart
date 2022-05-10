part of 'start_friends_bloc.dart';

@immutable
abstract class StartFriendsState {}

class StartFriendsInitial extends StartFriendsState {}

class BackTappedState extends StartFriendsState {}

class PlayTimerState extends StartFriendsState {
  final int time;

  PlayTimerState({
    required this.time,
  });
}

class PauseTimerState extends StartFriendsState {
  final int currentTime;

  PauseTimerState({
    required this.currentTime,
  });
}