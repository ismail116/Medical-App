import 'package:sleuth/screens/friends_details_screen/page/friends_details_page.dart';
import 'package:sleuth/screens/friends/bloc/friends_bloc.dart';
import 'package:sleuth/screens/friends/widget/friends_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildContext(context));
  }

  BlocProvider<FriendsBloc> _buildContext(BuildContext context) {
    return BlocProvider<FriendsBloc>(
      create: (context) => FriendsBloc(),
      child: BlocConsumer<FriendsBloc, FriendsState>(
        buildWhen: (_, currState) => currState is WorkoutsInitial,
        builder: (context, state) {
          return FriendsContent();
        },
        listenWhen: (_, currState) => currState is CardTappedState,
        listener: (context, state) {
          if (state is CardTappedState) {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (_) => FriendsDetailsPage(workout: state.workout),
              ),
            );
          }
        },
      ),
    );
  }
}