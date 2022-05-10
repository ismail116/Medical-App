import 'package:sleuth/core/const/color_constants.dart';
import 'package:sleuth/core/const/text_constants.dart';
import 'package:sleuth/data/workout_data.dart';
import 'package:sleuth/screens/friends/bloc/friends_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class FriendsCard extends StatelessWidget {
  final FriendsData friends;
  FriendsCard({Key? key, required this.friends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FriendsBloc>(context);
    return Container(
      width: double.infinity,
      height: 140,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstants.white,
        boxShadow: [BoxShadow(color: ColorConstants.textBlack.withOpacity(0.12), blurRadius: 5.0, spreadRadius: 1.1)],
      ),
      child: Material(
        color: Colors.transparent,
        child: BlocBuilder<FriendsBloc, FriendsState>(
          buildWhen: (_, currState) => currState is CardTappedState,
          builder: (context, state) {
            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                bloc.add(CardTappedEvent(workout: friends));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(friends.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 3),
                          Text(friends.heartrate + " " + TextConstants.hrUnit,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorConstants.grey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2),
                          const SizedBox(height: 3),
                          Text(friends.oxygenpercent + " " + TextConstants.spo2Unit,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorConstants.grey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2),
                          Spacer(),
                          //     Text('${workout.currentProgress}/${workout.progress}', style: TextStyle(fontSize: 10)),
                          SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0, left: 2),
                            child: LinearPercentIndicator(
                              //     percent: workout.currentProgress / workout.progress,
                              progressColor: ColorConstants.primaryColor,
                              backgroundColor: ColorConstants.primaryColor.withOpacity(0.12),
                              lineHeight: 6,
                              padding: EdgeInsets.zero,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 60),
                    Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.asset(friends.image, fit: BoxFit.fill))),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}