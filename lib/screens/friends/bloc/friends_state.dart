part of 'friends_bloc.dart';

@immutable
abstract class FriendsState {}

class WorkoutsInitial extends FriendsState {}

class CardTappedState extends FriendsState {
  final FriendsData workout;

  CardTappedState({required this.workout});
}