import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoezy/application/bloc/auth_bloc/auth_bloc.dart';
import 'package:shoezy/presentation/screens/bottom_navigation.dart';
import 'package:shoezy/presentation/screens/signin_screen.dart';
import 'package:shoezy/presentation/screens/signup_screen.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';
import 'package:shoezy/utils/const/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ValueNotifier<bool> hasConnection = ValueNotifier<bool>(false);
  StreamSubscription? subscription;
  bool authEventTriggered = false; 
  @override
  void initState() {
    super.initState();
    _listenToInternetStatus();
  }

  void _listenToInternetStatus() {
    subscription = InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      hasConnection.value = connected;

      if (connected && !authEventTriggered) {
      
        context.read<AuthBloc>().add(CheckUserStatus());
        authEventTriggered = true;
      }
    });

    // Do an initial check (in case already connected)
    InternetConnectionChecker().hasConnection.then((connected) {
      hasConnection.value = connected;
      if (connected && !authEventTriggered) {
        context.read<AuthBloc>().add(CheckUserStatus());
        authEventTriggered = true;
      }
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    hasConnection.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ValueListenableBuilder<bool>(
      valueListenable: hasConnection,
      builder: (context, connected, _) {
        if (!connected) {
         
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Lottie.asset('./asset/No Internet.json'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No Internet Connection 😢',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Please check your internet settings and try again.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final connected =
                            await InternetConnectionChecker().hasConnection;
                        hasConnection.value = connected;
                        if (connected && !authEventTriggered) {
                          context.read<AuthBloc>().add(CheckUserStatus());
                          authEventTriggered = true;
                        }
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text("Retry"),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

       
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
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
                const Spacer(),
                Center(
                  child: Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    padding: const EdgeInsets.all(4),
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
                const Spacer(),
                Shimmer.fromColors(
                  direction: ShimmerDirection.ltr,
                  baseColor: AppColors.white,
                  highlightColor: AppColors.splashScreenBackroundColor,
                  child: Column(
                    children: [
                      CostumWidget.labelText(context, 'PAMPER YOUR FEET',
                          fontSize: 17),
                      CostumWidget.labelText(context, 'WITH OUR SHOES',
                          fontSize: 25),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
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
                        MaterialPageRoute(
                            builder: (context) => SignupScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
