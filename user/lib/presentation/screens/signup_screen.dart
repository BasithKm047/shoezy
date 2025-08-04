import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoezy/presentation/screens/signin_screen.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';
import 'package:shoezy/utils/const/colors.dart';
import 'package:shoezy/utils/const/commonFunctions.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordConttoller = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();
    ValueNotifier<bool> isObscure = ValueNotifier(true);

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordConttoller.dispose();
    isObscure.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CostumWidget.backButton(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
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
                    SizedBox(width: 15),
                    CostumWidget.labelText(context, 'Your Name'),
                  ],
                ),

                SizedBox(height: 10),

                CostumWidget.costumTextformField(
                  controller: usernameController,
                  validator: (value) => Commonfunctions.usernameValidator(value),
                  width: screenWidth / 1.1,
                  borderRadius: 50,
                  hintText: 'Name',
                  isBorderNotNeed: false,
                  
                ),

                SizedBox(height: 20),
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
                  controller: emailController,
                  validator: (value) => Commonfunctions.emailValidator(value),
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
                          // size: 20,
                          value ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                      obscureText: value,
                      hintText: 'Password',
                      width: screenWidth / 1.1,
                      borderRadius: 50,
                      isBorderNotNeed: false,
                      controller: passwordConttoller,
                      validator: (value) => Commonfunctions.passwordValidator(value),
                    );
                  },
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
                  ontap: (){
                     _signup(formKey, context);
                  }
                ),

                SizedBox(height: 10),
                CostumWidget.costumElevatedButton(
                  context: context,
                  title: 'Sign in WIth Google',
                  foregroundColor: AppColors.black,
                  width: screenWidth / 1.1,
                  // borderRadius2: 50,
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
      ),
    );
  }

 _signup(GlobalKey<FormState> formkey,BuildContext context){
  if(formkey.currentState!.validate()){
    // Navigate into homeScreen
    CostumWidget.showCustomSnackbar(context: context, message: 'Account created succesfull');
  }else{
    CostumWidget.showCustomSnackbar(context: context, message: 'Please fill all the fields');
  }
   
 }
}
