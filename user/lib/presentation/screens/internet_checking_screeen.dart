import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class InternetCheckingScreeen extends StatefulWidget {
  final Widget child;
  static Future<bool> checkConnection() async {
    final result = await Connectivity().checkConnectivity();
    Logger().f('Connectivity Result: $result');
    // ignore: unrelated_type_equality_checks
    return result != ConnectivityResult.none;
  }
   const InternetCheckingScreeen({super.key, required this.child});

  @override
  State<InternetCheckingScreeen> createState() =>
      InternetCheckingScreeenState();
}

class InternetCheckingScreeenState extends State<InternetCheckingScreeen> {
    ValueNotifier<bool> hasConnection = ValueNotifier<bool>(false);
     StreamSubscription ? subscription;  
     
  @override
  void initState() {
    super.initState();
    checkInternetConnection();

    subscription = InternetConnectionChecker().onStatusChange.listen((status) {
     switch(status){
      case InternetConnectionStatus.connected:

      hasConnection.value=true;
      break;
      case InternetConnectionStatus.disconnected:
      hasConnection.value=false;
      break;
      // ignore: unreachable_switch_default
      default:
      hasConnection.value=false;
      break;
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
    hasConnection.dispose();
    subscription?.cancel();
    super.dispose();
  }

 @override
Widget build(BuildContext context) {
  return ValueListenableBuilder<bool>(
    valueListenable: hasConnection,
    builder: (context, isConnected, child) {
 
      if (!isConnected) {
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
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
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
        );
      }

     
      return widget.child;
    },
  );
}

}
