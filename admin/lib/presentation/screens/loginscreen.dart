import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoezy_admin/fetures/core/admindetails.dart';
import 'package:shoezy_admin/fetures/utils/const/routes.dart';
import 'package:shoezy_admin/presentation/bloc/admin_details_bloc/cubit/admin_login_cubit.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';

// ignore: must_be_immutable
class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  final admindetails = Admindetails();

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;

    return SafeArea(
      child: Scaffold(
        appBar: CostumWidget.appBar(
          title: 'Admin',
          context: context,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocConsumer<AdminLoginCubit, AdminLoginState>(
          listener: (context, state) {
            if (state is AdminLoginSuccess) {
              CostumWidget.showCustomSnackbar(
                context: context,
                message: 'Login Successful',
              );
              context.go(Routes.dashboard);
            } else if (state is AdminLoginFailure) {
              CostumWidget.showCustomSnackbar(
                backgroundColor: Colors.red,
                context: context,
                message: state.error,
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),

                      /// Card for login form
                      CostumWidget.costumCard(
                        elevetion: 4,
                        height: 430,
                        width: screenWidth / 2.5,
                        borderRaduis: 10,
                        widget: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Center(
                                child: CostumWidget.labelText(
                                  context,
                                  'Admin Login',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),

                              /// Username field
                              Text(
                                'User name',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              CostumWidget.costumTextformField(
                                width: screenWidth / 2.7,
                                controller: usernameController,
                                hintText: 'User name',
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Username is required';
                                  } else if (value.trim().length < 3) {
                                    return 'Minimum 3 characters required';
                                  } else if (!RegExp(
                                    r'^[a-zA-Z]+$',
                                  ).hasMatch(value.trim())) {
                                    return 'Only alphabets allowed';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 20),

                              /// Password field
                              Text(
                                'Password',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              CostumWidget.costumTextformField(
                                obscureText: true,
                                width: screenWidth / 2.7,
                                controller: passwordController,
                                hintText: 'Password',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  } else if (value.length < 6) {
                                    return 'Minimum 6 characters';
                                  } else if (!RegExp(r'\d').hasMatch(value)) {
                                    return 'Must contain a number';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 20),

                              /// Login button
                              Center(
                                child: SizedBox(
                                  width: screenWidth / 2.7,
                                  child: CostumWidget.costumElevatedButton(
                                    context: context,
                                    title: state is AdminLoginLoading
                                        ? 'Logging in...'
                                        : 'Login',
                                    backgroundColor: Colors.blue,
                                    borderRadius: 10,
                                    foregroundColor: Colors.white,
                                    ontap: state is AdminLoginLoading
                                        ? null
                                        : () {
                                            if (formKey.currentState
                                                    ?.validate() ??
                                                false) {
                                              context
                                                  .read<AdminLoginCubit>()
                                                  .login(
                                                    username: usernameController
                                                        .text
                                                        .trim(),
                                                    password: passwordController
                                                        .text
                                                        .trim(),
                                                  );
                                            }
                                          },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
