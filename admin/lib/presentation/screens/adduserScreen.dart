import 'package:flutter/material.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';
import 'package:shoezy_admin/presentation/widgets/costumWidget.dart';

class Adduserscreen extends StatelessWidget {
   Adduserscreen({super.key});

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final TextEditingController _firstNameController = TextEditingController();

final TextEditingController _lastNameController = TextEditingController();    

final TextEditingController _emailController = TextEditingController();

final TextEditingController _phoneController = TextEditingController();



_clearFormFields() {
  _firstNameController.clear();
  _lastNameController.clear();
  _emailController.clear();
  _phoneController.clear();
}

  @override
  Widget build(BuildContext context) {
    // final screenHeigh = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CostumWidget.appBar(
        title: 'Add User',
        context: context,
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              CostumWidget.costumCard(
                elevetion: 4,
                // height: screenHeigh / 1.,
                width: screenWidth / 2,
                borderRaduis: 16,
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: CostumWidget.labelText(context, 'First Name')
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: CostumWidget.costumTextformField(
                        controller: _firstNameController,
                        hintText: 'First Name',
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                        // backgroundColor:
                            // CostumColors().textFormFieldBackgroundColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: CostumWidget.labelText(context, 'Last Name') 
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: CostumWidget.costumTextformField(
                        controller: _lastNameController,
                        hintText: 'Last Name',
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                        // backgroundColor:
                            // CostumColors().textFormFieldBackgroundColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: CostumWidget.labelText(context, 'Email') ,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: CostumWidget.costumTextformField(
                        controller: _emailController,
                        hintText: 'Email',
                        validator: (value) {
                         if (value == null || value.isEmpty) {
                            return 'Enter Email';
                          } else if (!value.contains('@')) {
                            return 'Enter valid Email';
                          }
                  
                          return null;
                        },
                        // backgroundColor:
                            // CostumColors().textFormFieldBackgroundColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: CostumWidget.labelText(context, 'Phone'),      
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: CostumWidget.costumTextformField(
                        controller: _phoneController,
                        hintText: 'Phone',
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          } else if (value.length < 10) {
                            return 'Phone number must be at least 10 digits';
                          }
                          return null;
                        },
                        // backgroundColor:
                            // CostumColors().textFormFieldBackgroundColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: screenWidth / 7,
                            child: CostumWidget.costumElevatedButton(
                              ontap: () {
                                _submitForm(context);
                              },
                              borderRadius: 10,
                              context: context,
                              title: 'Add User',
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              child: Text(
                                'Add User',
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _submitForm(BuildContext context) {
    Commonfunction.validateAndSubmitForm(context: context, formKey: _formKey, successMessage: 'User added successfully', errorMessage: 'Failed to add user', onSuccess: () {
    
      print('User added: ${_firstNameController.text} ${_lastNameController.text}');
    _clearFormFields();
    });
}
}
