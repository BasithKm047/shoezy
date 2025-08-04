import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/application/bloc/auth_cubit/cubit/auth_cubit_cubit.dart';
import 'package:shoezy/data/models/user_model.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';
import 'package:shoezy/utils/const/colors.dart';
import 'package:shoezy/utils/const/commonFunctions.dart';

// ignore: must_be_immutable
class RecoveryPasswordScreen extends StatelessWidget {
   RecoveryPasswordScreen({super.key});

    TextEditingController emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState>formkey=GlobalKey();
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<AuthCubitCubit,AuthCubitState>(
      listener: (context, state) {
        if(state is AuthLoading){
          CircularProgressIndicator();
        }else if(state is AuthSuccess){
          CostumWidget.showCustomSnackbar(context: context, message: 'Email send to your gmailaccount');
        }else if(state is AuthFailure){
          CostumWidget.showCustomSnackbar(context: context, message: state.message,backgroundColor: AppColors.red);
        }
      },
      child: Scaffold(
        appBar: CostumWidget.backButton(context),
        body: SafeArea(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                // SizedBox(height: 20),
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
            
                CostumWidget.costumElevatedButton(
                  context: context,
                  title: 'Continue',
                  width: screenWidth / 1.1,
                  fontSize: 17,
                  borderRadius: 50,
                  ontap: () {
                    if(formkey.currentState!.validate()){
                      try{
                       UserModel user=UserModel(userName: '', phoneNumber: '', email: emailController.text, imagePath: '');
                       context.read<AuthCubitCubit>().forgetPassword(user: user);
                      }catch(e){
                        print(e);
                      }
                    }
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
