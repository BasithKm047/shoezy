import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoezy/presentation/screens/recovery_password_screen.dart';
import 'package:shoezy/presentation/screens/signup_screen.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';
import 'package:shoezy/utils/const/colors.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final ValueNotifier<bool> isObscure = ValueNotifier(true);
    return Scaffold(
      appBar: CostumWidget.backButton(context),
      body: SafeArea(
        child: SingleChildScrollView(
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
              SizedBox(height: 15),
              CostumWidget.costumTextformField(
                width: screenWidth / 1.1,
                hintText: 'Email Adress',
                isBorderNotNeed: false,
                borderRadius: 50,
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 20),
                  CostumWidget.labelText(context, 'Password'),
                ],
              ),
              SizedBox(height: 10),
              ValueListenableBuilder(
                valueListenable: isObscure,
                builder: (context, value, child) {
                  return CostumWidget.costumTextformField(
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecoveryPasswordScreen(),));
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
                context: context,
                title: 'Sign in',
                fontWeight: FontWeight.w900,
                fontSize: 17.0,
                borderRadius: 50,
                width: screenWidth / 1.1,
                backgroundColor: AppColors.blue,
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
                            'Sigin in with Google',
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
                        MaterialPageRoute(builder: (context) => SignupScreen()),
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
      ),
    );
  }
}
