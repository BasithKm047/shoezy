import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/application/bloc/auth_cubit/cubit/auth_cubit_cubit.dart';
import 'package:shoezy/presentation/screens/signin_screen.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubitCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          Center(child: CircularProgressIndicator());
        } else if (state is AuthSuccess) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => SigninScreen()));
        } else if (state is AuthFailure) {
          CostumWidget.showCustomSnackbar(
            context: context,
            message: state.message,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: ElevatedButton(onPressed: () {
              context.read<AuthCubitCubit>().signOut();
            }, child: Text('Logout')),
          ),
        );
      },
    );
  }
}
