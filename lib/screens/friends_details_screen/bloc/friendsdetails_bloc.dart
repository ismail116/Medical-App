import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sleuth/data/exercise_data.dart';
import 'package:sleuth/data/workout_data.dart';
import 'package:meta/meta.dart';

part 'friendsdetails_event.dart';
part 'friendsdetails_state.dart';

class FriendsDetailsBloc extends Bloc<FriendsDetailsEvent, FriendsDetailsState> {
  final FriendsData workout;
  FriendsDetailsBloc({required this.workout}) : super(FriendsDetailsInitial());

  @override
  Stream<FriendsDetailsState> mapEventToState(
      FriendsDetailsEvent event,
      ) async* {
    if (event is BackTappedEvent) {
      yield BackTappedState();
    } else if (event is FriendsExerciseCellTappedEvent) {
      //  yield FriendsExerciseCellTappedState(
        //   currentExercise: event.currentExercise,
        //    nextExercise: event.nextExercise,
      //  );
    }
  }
}