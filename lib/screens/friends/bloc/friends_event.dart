part of 'friends_bloc.dart';

@immutable
abstract class FriendsEvent {}

class CardTappedEvent extends FriendsEvent {
  final FriendsData workout;

  CardTappedEvent({required this.workout});
}