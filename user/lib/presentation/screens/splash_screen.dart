import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoezy/application/bloc/auth_bloc/auth_bloc.dart';
import 'package:shoezy/presentation/screens/bottom_navigation.dart';
import 'package:shoezy/presentation/screens/signin_screen.dart';
import 'package:shoezy/presentation/screens/signup_screen.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';
import 'package:shoezy/utils/const/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthLoggedIn) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BottomNavigation()),
          );
        } else if (state is AuthLogOUt) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SigninScreen()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.splashScreenBackroundColor,

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),

            Center(
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                padding: EdgeInsets.all(4),
                child: Transform.rotate(
                  angle: -0.4,
                  child: ClipOval(
                    child: Image.asset(
                      './asset/generated-image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            Spacer(),
            Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              baseColor: AppColors.white,
              highlightColor: AppColors.splashScreenBackroundColor,
              child: SizedBox(
                child: Column(
                  children: [
                    CostumWidget.labelText(
                      context,
                      'PAMPER YOUR FEET',
                      fontSize: 17,
                    ),

                    CostumWidget.labelText(
                      context,
                      'WITH OUR SHOES',
                      fontSize: 25,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 25), // Space from bottom
              child: CostumWidget.costumElevatedButton(
                context: context,
                title: 'Get Started',
                backgroundColor: Colors.white,
                foregroundColor: AppColors.splashScreenBackroundColor,
                borderColor: Colors.grey,
                width: screenWidth / 1.5,
                fontSize: 19,
                ontap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
