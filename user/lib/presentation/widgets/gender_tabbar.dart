import 'package:flutter/material.dart';
import 'package:shoezy/core/utils/const/colors.dart';

class GenderTabBar extends StatefulWidget {
  final ValueNotifier<String> selectedGender;

  const GenderTabBar({super.key, required this.selectedGender});

  @override
  State<GenderTabBar> createState() => _GenderTabBarState();
}

class _GenderTabBarState extends State<GenderTabBar> {
  final List<String> genders = const ["Men", "Women", "Kids"];

  int get currentIndex =>
      genders.indexOf(widget.selectedGender.value);

  void _onSwipeLeft() {
    if (currentIndex < genders.length - 1) {
      widget.selectedGender.value = genders[currentIndex + 1];
    }
  }

  void _onSwipeRight() {
    if (currentIndex > 0) {
      widget.selectedGender.value = genders[currentIndex - 1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity == null) return;

        if (details.primaryVelocity! < 0) {
          // Swipe Left → move to next
          _onSwipeLeft();
        } else if (details.primaryVelocity! > 0) {
          // Swipe Right → move to previous
          _onSwipeRight();
        }
      },
      child: ValueListenableBuilder<String>(
        valueListenable: widget.selectedGender,
        builder: (context, value, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: genders.map((gender) {
              final isSelected = gender == value;
              return GestureDetector(
                onTap: () {
                  widget.selectedGender.value = gender;
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      gender,
                      style: TextStyle(
                        color:
                            isSelected ? AppColors.black : Colors.grey,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.only(top: 4),
                      height: 2,
                      width: isSelected ? 25 : 0,
                      color: isSelected
                          ? AppColors.black
                          : Colors.transparent,
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
