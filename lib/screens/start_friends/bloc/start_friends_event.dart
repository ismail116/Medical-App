part of 'start_friends_bloc.dart';

@immutable
abstract class StartFriendsEvent {}

class BackTappedEvent extends StartFriendsEvent {}

class PlayTappedEvent extends StartFriendsEvent {
  final int time;

  PlayTappedEvent({
    required this.time,
  });
}

class PauseTappedEvent extends StartFriendsEvent {
  final int time;

  PauseTappedEvent({
    required this.time,
  });
}

class ChangeTimerEvent extends StartFriendsEvent {}