import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoezy/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shoezy/presentation/screens/bottom_navigation.dart';
import 'package:shoezy/presentation/screens/recovery_password_screen.dart';
import 'package:shoezy/presentation/screens/signup_screen.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';
import 'package:shoezy/utils/const/colors.dart';
import 'package:shoezy/utils/const/commonFunctions.dart';

// ignore: must_be_immutable
class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final ValueNotifier<bool> isObscure = ValueNotifier(true);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordConttoller = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              CostumWidget.showCustomSnackbar(
                context: context,
                message: state.message,
                backgroundColor: AppColors.red,
              );
            } else if (state is AuthSuccess) {
              FocusScope.of(context).unfocus();
              CostumWidget.showCustomSnackbar(
                context: context,
                message: 'Sign in succesfull',
              );
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => BottomNavigation()),
                (route) => false,
              );
            } else if (state is GoogleSignInstate) {
              FocusScope.of(context).unfocus();
              CostumWidget.showCustomSnackbar(
                context: context,
                message: state.message,
              );
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => BottomNavigation()),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          CostumWidget.labelText(
                            context,
                            'Hello Again!',
                            fontSize: 25,
                          ),
                          CostumWidget.labelText(
                            context,
                            "Welcome Back You've Been Missed",
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),

                    Row(
                      children: [
                        SizedBox(width: 20),
                        CostumWidget.labelText(context, 'Email Adress'),
                      ],
                    ),
                    SizedBox(height: 5),
                    CostumWidget.costumTextformField(
                      controller: emailController,
                      validator: (value) =>
                          Commonfunctions.emailValidator(value),
                      width: screenWidth / 1.1,
                      hintText: 'Email Adress',
                      isBorderNotNeed: false,
                      borderRadius: 50,
                    ),

                    SizedBox(height: 3),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        CostumWidget.labelText(context, 'Password'),
                      ],
                    ),
                    SizedBox(height: 3),
                    ValueListenableBuilder(
                      valueListenable: isObscure,
                      builder: (context, value, child) {
                        return CostumWidget.costumTextformField(
                          controller: passwordConttoller,
                          validator: (value) =>
                              Commonfunctions.passwordValidator(value),
                          height: 50,
                          suffixIcon: IconButton(
                            onPressed: () {
                              isObscure.value = !isObscure.value;
                            },
                            icon: Icon(
                              // size: 10,
                              value ? Icons.visibility_off : Icons.visibility,
                            ),
                          ),
                          obscureText: value,
                          hintText: 'Password',
                          width: screenWidth / 1.1,
                          borderRadius: 50,
                          isBorderNotNeed: false,
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RecoveryPasswordScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),

                    CostumWidget.costumElevatedButton(
                      isLoading: state is AuthLoading,
                      loading: const CircularProgressIndicator(
                        color: AppColors.white,
                      ),
                      context: context,
                      title: 'Sign in',
                      fontWeight: FontWeight.w900,
                      fontSize: 17.0,
                      borderRadius: 50,
                      width: screenWidth / 1.1,
                      backgroundColor: AppColors.blue,
                      ontap: (state is AuthLoading || state is GooleLoading)
                          ? null
                          : () {
                              _signIn(formKey, context);
                            },
                    ),

                    SizedBox(height: 10),
                    CostumWidget.costumElevatedButton(
                      context: context,
                      title: 'Sign in WIth Google',
                      foregroundColor: AppColors.black,
                      width: screenWidth / 1.1,
                      borderRadius2: 50,
                      borderRadius: 50,
                      backgroundColor: AppColors.white,
                      isPrefix: true,
                      isLoading: state is GooleLoading,
                      loading: const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.blue,
                        ),
                      ),
                      ontap: (state is AuthLoading || state is GooleLoading)
                          ? null
                          : () {
                              context.read<AuthBloc>().add(
                                GoogleSignInRequested(false),
                              );
                            },
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            //  height: 25,
                            //  width: 25,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  './asset/icons8-google.svg',
                                  height: 25,
                                  // width:,
                                ),
                                SizedBox(width: 5),
                                CostumWidget.labelText(
                                  context,
                                  'Sign in with Google',
                                  fontSize: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 120),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign Up For Free',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _signIn(GlobalKey<FormState> formKey, BuildContext context) {
    final formState = formKey.currentState;
    if (formState != null && formState.validate()) {
      context.read<AuthBloc>().add(
        SignInEvent(
          email: emailController.text.trim(),
          password: passwordConttoller.text.trim(),
        ),
      );
      print('Sigin in succesfull');
    }
  }
}
