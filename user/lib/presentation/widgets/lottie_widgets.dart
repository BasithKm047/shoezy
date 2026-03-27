import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidgets {
  static Widget noData(
    String name,
    BuildContext context, [
    double? height,
    double? width,
  ]) {
    return Column(
      children: [
        Lottie.asset(
          'asset/No Data.json',
          height: height ?? 100,
          width: width ?? 50,
          fit: BoxFit.cover,
        ),

        SizedBox(height: 10),
        Text(
          'No $name Found',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  static Widget emptyBox1(String name, BuildContext context) {
    return Column(
      children: [
        LottieBuilder.asset(
          'asset/empty-box_2.json',
          height: 100,
          width: 50,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10),
        Text(
          'No $name Found',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  static Widget emptyBox2(String name, BuildContext context) {
    return Column(
      children: [
        LottieBuilder.asset(
          '/asset/box_empty_1.json',
          height: 100,
          width: 50,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10),
        Text(
          'No $name Found',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
