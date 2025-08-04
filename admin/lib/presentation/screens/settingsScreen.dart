import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';
import 'package:shoezy_admin/presentation/bloc/adminProfile/bloc/admin_profile_bloc.dart';
import 'package:shoezy_admin/presentation/widgets/costumWidget.dart';

class Settingsscreen extends StatelessWidget {
   Settingsscreen({super.key});

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();

  // Uint8List? _imageBytes;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth / 1.2;

    return Scaffold(
      body: Center(
        child: BlocConsumer<AdminProfileBloc, AdminProfileState>(
          listener: (context, state) {
            
            if (state is AdminProfileUpdateSuccess) {
              CostumWidget.showCustomSnackbar(
                context: context,
                message: 'Profile updated successful',
              );
            }else if(state is AdminProfileUpdateFailed){
              CostumWidget.showCustomSnackbar(context: context, message: state.error,
              backgroundColor: Colors.red);
            }
          },
          builder: (context, state) {
             Uint8List ?image;
            if(state is AdminProfileImagePickedState){
              image=state.image;
            }
            return Column(
              children: [
                const SizedBox(height: 20),

                SizedBox(
                  width: cardWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CostumWidget.labelText(
                        context,
                        'Manage My Profile',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),

                      // CostumWidget.costumElevatedButton(context: context, title: 'Logout',
                      // backgroundColor: Colors.red,
                      // width: screenWidth/7,
                      // borderRadius: 8,
                      // ontap: () {
                      //    CostumWidget.showCustomAlertDialog(context: context, title: 'Logout', content: 'Are you sure want to logout?', confirmButtonText: 'Logout', confirmButtonColor: Colors.red, onConfirm: () {
                      //   Commonfunction.logout(context);

                      //    },);
                      // },
                      // )
                    ],
                  ),
                ),
                SizedBox(height: 10),

                const SizedBox(height: 20),

                // Card
                CostumWidget.costumCard(
                  width: cardWidth,
                  borderRaduis: 10,
                  elevetion: 4,
                  shadowColor: Colors.blueGrey,
                  widget: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          widgets(
                            controller1: _firstNameController,
                            controller2: _lastNameController,
                            formKey: _formKey1,
                            context: context,
                            labelText1: 'First Name',
                            hintText1: 'First Name',
                            labelText2: 'Last Name',
                            hintText2: 'Last Name',
                          ),

                          SizedBox(height: 10),

                          widgets(
                            controller1: _emailController,
                            controller2: _phoneController,
                            formKey: _formKey2,
                            context: context,
                            labelText1: 'Email',
                            hintText1: 'Email',
                            labelText2: 'Phone No',
                            hintText2: 'Phone No',
                            validator1: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(
                                r'^[^@]+@[^@]+\.[^@]+',
                              ).hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            validator2: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                                return 'Please enter a valid phone number';
                              } else if (value.length < 10) {
                                return 'Phone number must be at least 10 digits';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 10),

                          widgets(
                            controller1: _passwordController,
                            controller2: _lastNameController,
                            formKey: _formKey3,
                            context: context,
                            labelText1: 'Pasword',
                            hintText1: 'PassWord',
                            labelText2: '',
                            hintText2: '',
                            isNeedSecondLabel: false,
                            validator1: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 10),

                          Row(
                            children: [
                              // SizedBox(width: 10,),
                              CostumWidget.labelText(
                                context,
                                'Profile Pic',
                                fontSize: 14,
                              ),
                            ],
                          ),

                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Stack(
                              children: [
                                Container(
                                  width: screenWidth / 7,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300],
                                    image: image != null
                                        ? DecorationImage(
                                            image: MemoryImage(image),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                  child: image == null
                                      ? Icon(Icons.person, size: 60)
                                      : null,
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 5,

                                  child: GestureDetector(
                                    onTap: (){
                                      
                                      context.read<AdminProfileBloc>().add(AdminProfileImagePick());

                                      
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CostumWidget.costumElevatedButton(
                                context: context,
                                title: 'Edit Profile',
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,

                                width: screenWidth / 7,
                                borderRadius: 10,
                                ontap: () {
                                  _submitEditProfile(
                                    firstNameController: _firstNameController,
                                    lastNameController: _lastNameController,
                                    emailController: _emailController,
                                    phoneController: _phoneController,
                                    passwordController: _passwordController,
                                    context: context,
                                    formKey1: _formKey1,
                                    formKey2: _formKey2,
                                    formKey3: _formKey3,
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget widgets({
  required BuildContext context,
  required String labelText1,
  required String hintText1,
  required String labelText2,
  required String hintText2,
  bool isNeedSecondLabel = true,
  required TextEditingController controller1,
  required TextEditingController controller2,
  required GlobalKey<FormState> formKey,
  String? Function(String?)? validator1,
  String? Function(String?)? validator2,
}) {
  return Form(
    key: formKey,

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CostumWidget.labelText(
                context,
                labelText1,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              CostumWidget.costumTextformField(
                controller: controller1,
                validator:
                    validator1 ??
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter $labelText1';
                      }
                      return null;
                    },

                hintText: hintText1,
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        isNeedSecondLabel
            ? Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CostumWidget.labelText(
                      context,
                      labelText2,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),
                    CostumWidget.costumTextformField(
                      controller: controller2,
                      validator:
                          validator2 ??
                          (value) => value == null || value.isEmpty
                              ? 'Please enter $labelText2'
                              : null,
                      hintText: hintText2,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              )
            : Flexible(flex: 1, child: SizedBox()),
      ],
    ),
  );
}

void _submitEditProfile({
  required BuildContext context,
  required GlobalKey<FormState> formKey1,
  required GlobalKey<FormState> formKey2,
  required GlobalKey<FormState> formKey3,
  required TextEditingController firstNameController,
  required TextEditingController lastNameController,
  required TextEditingController emailController,
  required TextEditingController phoneController,
  required TextEditingController passwordController,
}) {
  bool isvalid = true;
  if (!formKey1.currentState!.validate()) {
    isvalid = false;
  }
  if (!formKey2.currentState!.validate()) {
    isvalid = false;
  }
  if (!formKey3.currentState!.validate()) {
    isvalid = false;
  }
  if (isvalid) {
    context.read<AdminProfileBloc>().add(AdminProfileUpdateevent());

    Commonfunction.validateMultipleForms(
      context: context,
      formKeys: [formKey1, formKey2, formKey3], // add all your keys
      successMessage: 'Profile updated successfully!',
      errorMessage: 'Please fill all required fields correctly!',
      onSuccess: () {
        // Your submission logic here
        print("Profile updated and validated");
        clearFeild(
          controller1: firstNameController,
          controller2: lastNameController,
          controller3: emailController,
          controller4: phoneController,
        );
      },
    );
  } else {
    CostumWidget.showCustomSnackbar(
      context: context,
      message: 'Please fill all required fields correctly!',
      backgroundColor: Colors.blue,
      borderColor: Colors.white,
    );
  }
}

clearFeild({
  required TextEditingController controller1,
  required TextEditingController controller2,
  required TextEditingController controller3,
  required TextEditingController controller4,
}) {
  controller1.clear();
  controller2.clear();
  controller3.clear();
  controller4.clear();
}
