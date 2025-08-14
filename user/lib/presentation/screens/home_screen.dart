import 'package:flutter/material.dart';
import 'package:shoezy/presentation/widgets/dots_button.dart';
import 'package:shoezy/presentation/widgets/drawer.dart';
import 'package:shoezy/presentation/widgets/searchField.dart';
import 'package:shoezy/utils/const/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 110),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
          child: AppBar(
            title: Colomforhome(screenWidth: screenWidth),
            leading: Padding(
              padding: const EdgeInsets.only(left: 10, top: 15.0),
              child: Builder(
                builder: (context) => GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: DotsButton(),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 17),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_none,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Searchfield(screenWidth: screenWidth)),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Colomforhome extends StatelessWidget {
  double screenWidth;
  Colomforhome({required this.screenWidth, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Text(
          'Shipping location',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            SizedBox(width: screenWidth /12),
            Icon(Icons.location_on_outlined, size: 20, color: AppColors.orange),
            SizedBox(width: 2),
            Text(
              'Tirurangadi',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
