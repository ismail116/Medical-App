import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'start_friends_event.dart';
part 'start_friends_state.dart';

class StartFriendsBloc extends Bloc<StartFriendsEvent, StartFriendsState> {
  StartFriendsBloc() : super(StartFriendsInitial());

  int time = 0;

  @override
  Stream<StartFriendsState> mapEventToState(
      StartFriendsEvent event,
      ) async* {
    if (event is BackTappedEvent) {
      yield BackTappedState();
    } else if (event is PlayTappedEvent) {
      time = event.time;
      yield PlayTimerState(time: event.time);
    } else if (event is PauseTappedEvent) {
      time = event.time;
      yield PauseTimerState(currentTime: time);
    }
  }
}