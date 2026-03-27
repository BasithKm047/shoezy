import 'package:flutter/material.dart';
import 'package:shoezy/core/utils/const/colors.dart';

class DotsButton extends StatelessWidget {
  const DotsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5.0,
      height: 5.0,
      decoration: BoxDecoration(
        color: AppColors.dotColor,
        shape: BoxShape.circle,
        // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [Dot(), SizedBox(width: 6), Dot()],
            ),

            SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [Dot(), SizedBox(width: 6), Dot()],
            ),
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:5,
      height: 5,
      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.black),
    );
  }
}
