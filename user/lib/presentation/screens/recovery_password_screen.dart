import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/application/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';
import 'package:shoezy/utils/const/colors.dart';
import 'package:shoezy/utils/const/commonFunctions.dart';

// ignore: must_be_immutable
class RecoveryPasswordScreen extends StatefulWidget {
  const RecoveryPasswordScreen({super.key});

  @override
  State<RecoveryPasswordScreen> createState() => _RecoveryPasswordScreenState();
}

class _RecoveryPasswordScreenState extends State<RecoveryPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RestPasswordState) {
          Navigator.of(context).pop();
          CostumWidget.showCustomSnackbar(
            context: context,
            message: 'Email send to your gmail account',
          );
        } else if (state is RestPasswordFailureState) {
          Navigator.of(context).pop();
          CostumWidget.showCustomSnackbar(
            context: context,
            message: state.message,
            backgroundColor: AppColors.red,
          );
        }
      },
      child: Scaffold(
        // appBar:AppBar(),
        body: SafeArea(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: 50.0),
                Center(
                  child: Column(
                    children: [
                      CostumWidget.labelText(
                        context,
                        'Recovery Password',
                        fontSize: 25,
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            CostumWidget.labelText(
                              fontSize: 15,
                              context,
                              fontWeight: FontWeight.normal,
                              'Please Enter Your Email Address To',
                            ),
                            CostumWidget.labelText(
                              context,
                              'Recieve a Verification Code',
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: 20),
                    CostumWidget.labelText(context, 'Email Adress'),
                  ],
                ),
                SizedBox(height: 10),
                CostumWidget.costumTextformField(
                  controller: emailController,
                  hintText: 'Email',
                  borderRadius: 50,
                  isBorderNotNeed: false,
                  width: screenWidth / 1.1,
                  validator: (value) => Commonfunctions.emailValidator(value),
                ),

                SizedBox(height: 40),

                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return CostumWidget.costumElevatedButton(
                      context: context,
                      title: 'Continue',
                      width: screenWidth / 1.1,
                      fontSize: 17,
                      isLoading: state is AuthLoading ? true : false,
                      loading: CircularProgressIndicator(
                        color: AppColors.white,
                      ),
                      borderRadius: 50,
                      ontap: () {
                        if (formkey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                            ForgetPasswordEvent(emailController.text.trim()),
                          );
                        } else {
                          CostumWidget.showCustomSnackbar(
                            context: context,
                            message: 'Please Enter email',
                          );
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
