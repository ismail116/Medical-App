import 'package:sleuth/core/const/color_constants.dart';
import 'package:sleuth/core/const/path_constants.dart';
import 'package:sleuth/data/workout_data.dart';
import 'package:sleuth/screens/friends_details_screen/bloc/friendsdetails_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsDetailsBody extends StatelessWidget {
  final FriendsData workout;
  FriendsDetailsBody({required this.workout});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: ColorConstants.white,
      child: Stack(
        children: [
          _createImage(),
          _createBackButton(context),
        ],
      ),
    );
  }

  Widget _createBackButton(BuildContext context) {
    final bloc = BlocProvider.of<FriendsDetailsBloc>(context);
    return Positioned(
      child: SafeArea(
        child: BlocBuilder<FriendsDetailsBloc, FriendsDetailsState>(
          builder: (context, state) {
            return GestureDetector(
              child: Container(
                width: 30,
                height: 30,
                child: Image(
                  image: AssetImage(PathConstants.back),
                ),
              ),
              onTap: () {
                bloc.add(BackTappedEvent());
              },
            );
          },
        ),
      ),
      left: 20,
      top: 14,
    );
  }

  Widget _createImage() {
    return Container(
      width: double.infinity,
      child: Image(
        image: AssetImage(workout.image),
        fit: BoxFit.cover,
      ),
    );
  }
}