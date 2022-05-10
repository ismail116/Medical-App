import 'package:sleuth/core/const/color_constants.dart';
import 'package:sleuth/core/const/data_constants.dart';
import 'package:sleuth/data/workout_data.dart';
import 'package:sleuth/screens/friends/widget/friends_card.dart';
import 'package:flutter/material.dart';

class FriendsContent extends StatelessWidget {
  FriendsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.homeBackgroundColor,
      height: double.infinity,
      width: double.infinity,
      child: _createHomeBody(context),
    );
  }

  Widget _createHomeBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Friends',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView(
              children: DataConstants.friends
                  .map(
                    (e) => _createFriendsCard(e),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createFriendsCard(FriendsData friendsData) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: FriendsCard(friends: friendsData),
    );
  }
}