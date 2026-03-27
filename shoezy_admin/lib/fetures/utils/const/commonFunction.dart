import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoezy_admin/fetures/utils/const/enums.dart';
import 'package:shoezy_admin/fetures/utils/const/routes.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';

class Commonfunction {
  
  static Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    context.go(Routes.login);
  }

  static Future<void>? validateAndSubmitForm({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
     String? successMessage,
     String? errorMessage,
    VoidCallback? onSuccess,
    FormType? type,
    List<Uint8List>? images,
  }) async {
    final isValid = formKey.currentState?.validate() ?? true;
    if (!isValid && images!.isEmpty) {
      // CostumWidget.showCustomSnackbar(
      //   context: context,
      //   message: errorMessage ?? '',
      //   backgroundColor: Colors.blue,
      //   borderColor: Colors.white,
      // );
      return;
    }

    // ✅ Step 3: Success flow
    formKey.currentState!.save();
    print('Form saved');

    if (onSuccess != null) {
      onSuccess();
      print('onSuccess callback executed');
    }

    // CostumWidget.showCustomSnackbar(
    //   context: context,
    //   message: successMessage ?? '',
    //   backgroundColor: Colors.blue,
    //   borderColor: Colors.white,
    // );
  }

  static bool validateProductFields({
    required BuildContext context,
    required String? selectedBrand,
    required String? selectedCategory,
    required String? selectedColor,
    required List<String> selectedSizes,
    required List<Uint8List> shoeImages,
    required TextEditingController priceController,
  }) {
    if (selectedBrand == null || selectedBrand.isEmpty) {
      CostumWidget.showCustomSnackbar(
        context: context,
        message: 'Brand is required',
        backgroundColor: Colors.red,
        borderColor: Colors.white,
      );
      return false;
    }

    if (selectedCategory == null || selectedCategory.isEmpty) {
      CostumWidget.showCustomSnackbar(
        context: context,
        message: 'Category is required',
        backgroundColor: Colors.red,
        borderColor: Colors.white,
      );
      return false;
    }

    if (selectedColor == null || selectedColor.isEmpty) {
      CostumWidget.showCustomSnackbar(
        context: context,
        message: 'Color is required',
        backgroundColor: Colors.red,
        borderColor: Colors.white,
      );
      return false;
    }

    if (selectedSizes.isEmpty) {
      CostumWidget.showCustomSnackbar(
        context: context,
        message: 'Please select at least one size',
        backgroundColor: Colors.red,
        borderColor: Colors.white,
      );
      return false;
    }

    if (shoeImages.isEmpty) {
      CostumWidget.showCustomSnackbar(
        context: context,
        message: 'Please add at least one product image',
        backgroundColor: Colors.red,
        borderColor: Colors.white,
      );
      return false;
    }

    if (priceController.text.trim().isEmpty) {
      CostumWidget.showCustomSnackbar(
        context: context,
        message: 'Price is required',
        backgroundColor: Colors.red,
        borderColor: Colors.white,
      );
      return false;
    }

    final price = priceController.text.trim();
    final priceRegex = RegExp(
      r'^\d+(\.\d{1,2})?$',
    ); // Only digits or decimal (e.g., 10.00)

    if (!priceRegex.hasMatch(price)) {
      CostumWidget.showCustomSnackbar(
        context: context,
        message: 'Price must be a valid number',
        backgroundColor: Colors.red,
        borderColor: Colors.white,
      );
      return false;
    }

    return true;
  }

  // Multiple Validation Function
  static void validateMultipleForms({
    required BuildContext context,
    required List<GlobalKey<FormState>> formKeys,
    required String successMessage,
    required String errorMessage,
    VoidCallback? onSuccess,
  }) {
    bool isAllValid = true;

    for (final key in formKeys) {
      if (!(key.currentState?.validate() ?? false)) {
        isAllValid = false;
        break;
      } else {
        key.currentState?.save();
      }
    }

    if (isAllValid) {
      if (onSuccess != null) onSuccess();

      CostumWidget.showCustomSnackbar(
        context: context,
        message: successMessage,
        backgroundColor: Colors.blue,
        borderColor: Colors.white,
      );
    } else {
      CostumWidget.showCustomSnackbar(
        context: context,
        message: errorMessage,
        backgroundColor: Colors.blue,
        borderColor: Colors.white,
      );
    }
  }

  static String? usernameValidator(String? value) {
    try {
      if (value == null || value.trim().isEmpty) {
        return 'Please Enter username';
      } else if (value.length < 3) {
        return 'username should be morethan 3 character';
      } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
        return 'Username can only contain letters and numbers';
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static String? emailValidator(String? value) {
    try {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter an email address';
      } else if (!RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      ).hasMatch(value.trim())) {
        return 'Please enter a valid email address';
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password should be at least 6 characters';
    }
    final pattern = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).+$',
    );
    if (!pattern.hasMatch(value)) {
      return 'Password must contain uppercase, lowercase, number, and special character';
    }
    return null;
  }

  static String ? nameValidator(String ? value,String name){
     try {
      if (value == null || value.trim().isEmpty) {
        return 'Please Enter $name';
      } else if (value.length < 3) {
        return '$name should be morethan 3 character';
      } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
        return '$name can only contain letters ';
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

static bool imageValidator(List<Uint8List> images, BuildContext context) {
  if (images.isEmpty) {
    CostumWidget.showCustomSnackbar(
      context: context,
      message: 'Please add at least one image',
      backgroundColor: Colors.red,
      borderColor: Colors.white,
    );
    return false;
  }
  return true;
}
static bool singleImageValidator(Uint8List? image, BuildContext context) {
  if (image == null || image.isEmpty) {
    CostumWidget.showCustomSnackbar(
      context: context,
      message: 'Please add an image',
      backgroundColor: Colors.red,
      borderColor: Colors.white,
    );
    return false;
  }
  return true;
}


  static String ? commonValidator(String? value,String fieldName,{int minLength=2,bool onlyLetters=false, bool onlyNumbers=false} ){
    if(value==null || value.trim().isEmpty){
      return 'Please enter $fieldName';
    }
    if(value.trim().length<minLength){
      return '$fieldName should be at least $minLength character';
    }

    if(onlyLetters && !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)){
      return '$fieldName can only contains letters';
    }

    if(onlyNumbers && !RegExp(r'^[0-9]+$').hasMatch(value)){
      return '$fieldName can only contain numbers';
    }
    return null;
  }

// static cloudinaryImageUpdate(String imagePath){
//   final String cloudinarypreset='j0fa6qsy';
//    File imageFile=File(imagePath);
//    Map<String,dynamic> imageData={
//    'file':MultipartFile.fromFile(imageFile.path,filename: imageFile.path.split('/').last),
//    'upload_preset':cloudinarypreset,
//    };


// }



// }



// Future<void>postimageCloudinary(String imagePath)async{
//   final response = await Dio().post(  
//  'https://api.cloudinary.com/v1_1/${YOUR_CLOUD_NAME}/upload',  
//  data: uploadParams,   options: Options(   
//   headers: {'X-Requested-With': 'XMLHttpRequest'}, 
// ), 
// );

// if (response.statusCode == 200) { 
//   // Upload successful   
// final imageUrl = response.data['url']; 
//   print('Image uploaded successfully: $imageUrl');  
//  // Use the image URL in your application 
// } else {   
// // Handle upload error 
//   print('Error uploading image: ${response.data['error']['message']}'); 
// }
}