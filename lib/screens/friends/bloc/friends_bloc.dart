import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sleuth/data/workout_data.dart';
import 'package:meta/meta.dart';

part 'friends_event.dart';
part 'friends_state.dart';

class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  FriendsBloc() : super(WorkoutsInitial());

  @override
  Stream<FriendsState> mapEventToState(
      FriendsEvent event,
      ) async* {
    if (event is CardTappedEvent) {
      yield CardTappedState(workout: event.workout);
    }
  }
}