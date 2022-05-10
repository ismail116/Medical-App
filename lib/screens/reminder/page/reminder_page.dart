import 'package:sleuth/core/const/color_constants.dart';
import 'package:sleuth/core/const/text_constants.dart';
import 'package:sleuth/screens/common_widgets/sleuth_button.dart';
import 'package:sleuth/screens/reminder/bloc/reminder_bloc.dart';
import 'package:sleuth/screens/reminder/widget/reminder_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReminderBloc>(
      create: (context) => ReminderBloc(),
      child: BlocBuilder<ReminderBloc, ReminderState>(
        buildWhen: (_, currState) => currState is ReminderInitial,
        builder: (context, state) {
          return Scaffold(
            body: _buildContext(context),
            appBar: AppBar(
              centerTitle: false,
              titleSpacing: 0,
              title: Text(
                TextConstants.reminder,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: ColorConstants.primaryColor,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SleuthButton(
                title: TextConstants.save,
                onTap: () {
                  final bloc = BlocProvider.of<ReminderBloc>(context);
                  bloc.add(OnSaveTappedEvent());
                },
              ),
            ),
          );
        },
      ),
    );
  }

  BlocConsumer<ReminderBloc, ReminderState> _buildContext(
      BuildContext context) {
    return BlocConsumer<ReminderBloc, ReminderState>(
      buildWhen: (_, currState) => currState is ReminderInitial,
      builder: (context, state) {
        if (state is ReminderInitial) {
          BlocProvider.of<ReminderBloc>(context).add(
            ReminderNotificationTimeEvent(dateTime: DateTime.now()),
          );
        }
        return ReminderContent();
      },
      listenWhen: (_, currState) => currState is OnSaveTappedState,
      listener: (context, state) {
        Navigator.of(context).pop();
      },
    );
  }
}