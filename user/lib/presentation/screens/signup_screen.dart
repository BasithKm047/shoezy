import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoezy/presentation/bloc/auth_bloc/auth_bloc.dart';

import 'package:shoezy/data/models/user_model.dart';
import 'package:shoezy/presentation/screens/bottom_navigation.dart';
import 'package:shoezy/presentation/screens/signin_screen.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';
import 'package:shoezy/core/utils/const/colors.dart';
import 'package:shoezy/core/utils/const/commonFunctions.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordConttoller = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  ValueNotifier<bool> isObscure = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            CostumWidget.showCustomSnackbar(
              context: context,
              message: state.message,
              backgroundColor: AppColors.red,
            );
          } else if (state is Authcreate) {
            FocusScope.of(context).unfocus();
            CostumWidget.showCustomSnackbar(
              context: context,
              message: 'Account created Succesfull',
            );
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => BottomNavigation()),
              (route) => false,
            );
          }
          //   else if (state is GoogleSignInstate) {
          //   CostumWidget.showCustomSnackbar(context: context, message: state.message);

          //   Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => HomeScreen()),
          //   );
          // }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    //  SizedBox(height: 50,),
                    Center(
                      child: Column(
                        children: [
                          CostumWidget.labelText(
                            context,
                            'Create Account',
                            fontSize: 25,
                          ),
                          CostumWidget.labelText(
                            context,
                            "Let's Create Account Together",
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),

                    Row(
                      children: [
                        SizedBox(width: 35),
                        CostumWidget.labelText(context, 'Name'),
                      ],
                    ),

                    SizedBox(height: 2),

                    CostumWidget.costumTextformField(
                      controller: usernameController,
                      validator: Commonfunctions.usernameValidator,
                      width: screenWidth / 1.2,
                      borderRadius: 50,
                      hintText: 'Name',
                      isBorderNotNeed: false,
                    ),

                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 35),
                        CostumWidget.labelText(context, 'Email Adress'),
                      ],
                    ),
                    SizedBox(height: 2),
                    CostumWidget.costumTextformField(
                      width: screenWidth / 1.2,
                      hintText: 'Email Adress',
                      isBorderNotNeed: false,
                      borderRadius: 50,
                      controller: emailController,
                      validator: Commonfunctions.emailValidator,
                    ),

                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 35),
                        CostumWidget.labelText(context, 'Password'),
                      ],
                    ),
                    SizedBox(height: 2),
                    ValueListenableBuilder(
                      valueListenable: isObscure,
                      builder: (context, value, child) {
                        return CostumWidget.costumTextformField(
                          textStyle: TextStyle(fontSize: 15),
                          height: 50,
                          suffixIcon: IconButton(
                            onPressed: () {
                              isObscure.value = !isObscure.value;
                            },
                            icon: Icon(
                              // size: 20,
                              value ? Icons.visibility_off : Icons.visibility,
                            ),
                          ),
                          obscureText: value,

                          hintText: 'Password',
                          width: screenWidth / 1.2,
                          borderRadius: 50,
                          isBorderNotNeed: false,
                          controller: passwordConttoller,
                          validator: Commonfunctions.passwordValidator,
                        );
                      },
                    ),
                    SizedBox(height: 30.0),

                    CostumWidget.costumElevatedButton(
                      // height: 50,
                      context: context,
                      isLoading: state is AuthLoading ? true : false,
                      loading: CircularProgressIndicator(
                        color: AppColors.white,
                      ),
                      title: 'Sign up',
                      fontWeight: FontWeight.w900,
                      fontSize: 17.0,
                      borderRadius: 50,
                      width: screenWidth / 1.2,
                      backgroundColor: AppColors.blue,
                      ontap: () {
                        _signup(formKey, context);
                      },
                    ),

                    SizedBox(height: 10),
                    CostumWidget.costumElevatedButton(
                      context: context,
                      isLoading: state is GooleLoading ? true : false,
                      loading: CircularProgressIndicator(color: AppColors.blue),
                      title: 'Sign in WIth Google',
                      foregroundColor: AppColors.black,
                      width: screenWidth / 1.2,
                      // borderRadius2: 50,
                      borderRadius: 50,
                      backgroundColor: AppColors.white,
                      isPrefix: true,
                      ontap: () {
                        context.read<AuthBloc>().add(
                          GoogleSignInRequested(true),
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
                                  height: 20,
                                  // width:,
                                ),
                                SizedBox(width: 5),
                                CostumWidget.labelText(
                                  context,
                                  'Sigin in with Google',
                                  fontSize: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '''Already have an account?''',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SigninScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign In',
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
            ),
          );
        },
      ),
    );
  }

  Future<void> _signup(
    GlobalKey<FormState> formkey,
    BuildContext context,
  ) async {
    final formState = formkey.currentState;
    if (formState != null && formState.validate()) {
      UserModel user = UserModel(
        userName: usernameController.text.trim(),
        phoneNumber: '',
        email: emailController.text.trim(),
        imagePath: '',
        isAdmin: false,
        isBlocked: false,
      );
      context.read<AuthBloc>().add(
        SignUpEvent(user: user, password: passwordConttoller.text.trim()),
      );
      log('Account Created Successfully');
    } else {
      log('Form validation failed');
    }
  }
}
