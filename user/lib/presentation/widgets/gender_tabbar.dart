import 'package:flutter/material.dart';
import 'package:shoezy/utils/const/colors.dart';

class GenderTabBar extends StatelessWidget {
  final ValueNotifier<String> selectedGender;

  const GenderTabBar({super.key, required this.selectedGender});

  final genders = const ["Men", "Women", "Kids",];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: selectedGender,
      builder: (context, value, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: genders.map((gender) {
            final isSelected = gender == value;
            return GestureDetector(
              onTap: () {
                selectedGender.value = gender;
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    gender,
                    style: TextStyle(
                      color: isSelected ? AppColors.black : Colors.grey,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  if (isSelected)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 2,
                      width: 25,
                      color: AppColors.black,
                    ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
