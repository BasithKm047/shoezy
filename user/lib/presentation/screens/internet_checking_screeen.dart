import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:shoezy/utils/const/colors.dart';

// ignore: must_be_immutable
class InternetCheckingScreeen extends StatefulWidget {
  final Widget child;
  static Future<bool> checkConnection() async {
    final result = await Connectivity().checkConnectivity();
    Logger().f('Connectivity Result: $result');
    // ignore: unrelated_type_equality_checks
    return result != ConnectivityResult.none;
  }
    ValueNotifier<bool> hasConnection = ValueNotifier<bool>(true);
   InternetCheckingScreeen({super.key, required this.child});

  @override
  State<InternetCheckingScreeen> createState() =>
      InternetCheckingScreeenState();
}

class InternetCheckingScreeenState extends State<InternetCheckingScreeen> {
  final ValueNotifier<bool> hasConnection = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    checkInternetConnection();

    Connectivity().onConnectivityChanged.listen((result) {
      // ignore: unrelated_type_equality_checks
      final hasInternet = result != ConnectivityResult.none;
      if (hasConnection.value != hasInternet) {
        hasConnection.value = hasInternet;
      }
    });
  }

  Future<void> checkInternetConnection() async {
    final result = await Connectivity().checkConnectivity();
    // ignore: unrelated_type_equality_checks
    hasConnection.value = result != ConnectivityResult.none;
  }

  @override
  void dispose() {
    super.dispose();
    hasConnection.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        ValueListenableBuilder<bool>(
          valueListenable: hasConnection,
          builder: (context, isConnected, child) {
            return AnimatedOpacity(
              opacity: isConnected ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: isConnected
                  ? const SizedBox()
                  : Scaffold(
                      body: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: Lottie.asset('./asset/No Internet.json'),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'No Internet Connection 😢',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Text(
                                  'Please check your internet settings and try again.',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(fontSize: 14),
                                ),
                              ),
                              const SizedBox(height: 16),

                              ElevatedButton.icon(
                                onPressed: () async {
                                  await checkInternetConnection();
                               
                                },
                                icon: const Icon(Icons.refresh),
                                label: const Text("Retry"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            );
          },
        ),
      ],
    );
  }
}
