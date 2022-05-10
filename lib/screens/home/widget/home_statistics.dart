import 'package:sleuth/core/const/color_constants.dart';
import 'package:sleuth/core/const/text_constants.dart';
import 'package:flutter/material.dart';

class HomeStatistics extends StatelessWidget {
  const HomeStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _createVitalCard(
            context,
            Icons.bubble_chart_outlined,
            ColorConstants.so2Color,
            TextConstants.spo2Vital,
            TextConstants.spo2Unit,
          ),
          _createVitalCard(
            context,
            Icons.monitor_heart_outlined,
            ColorConstants.heartColor,
            TextConstants.hrVital,
            TextConstants.hrUnit,
          ),
        ],
      ),
    );
  }

  Widget _createVitalCard(
    BuildContext context,
    IconData icon,
    Color color,
    String vital,
    String unit,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(15),
      height: 200,
      width: screenWidth * 0.42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstants.white,
        boxShadow: [
          BoxShadow(
            color: ColorConstants.textBlack.withOpacity(0.12),
            blurRadius: 5.0,
            spreadRadius: 1.1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: color,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  vital,
                  style: const TextStyle(
                    color: ColorConstants.textBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const Text(
            "--",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: ColorConstants.textBlack,
            ),
          ),
          Text(
            unit,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: ColorConstants.textGrey,
            ),
          ),
        ],
      ),
    );
  }
}
