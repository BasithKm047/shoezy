import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoezy_admin/fetures/utils/const/enums.dart';
import 'package:shoezy_admin/fetures/utils/const/routes.dart';
import 'package:shoezy_admin/presentation/widgets/costumWidget.dart';

class Commonfunction {

  static Future<Uint8List?> pickImageWeb() async {
    final imageBytes = await ImagePickerWeb.getImageAsBytes();
    return imageBytes; 
  }

 static Future<void> logout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', false);

  context.go(Routes.login);
}
 static Future<void>? validateAndSubmitForm({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required String successMessage,
  required String errorMessage,
  VoidCallback? onSuccess,
  FormType? type,
  List<Uint8List>? images,
  
}) async {
 

  final isValid = formKey.currentState?.validate() ?? true;
  if (!isValid && images!.isEmpty) {
    CostumWidget.showCustomSnackbar(
      context: context,
      message: errorMessage,
      backgroundColor: Colors.blue,
      borderColor: Colors.white,
    );
    return;
  }

  // ✅ Step 3: Success flow
  formKey.currentState!.save();
  print('Form saved');

  if (onSuccess != null) {
    onSuccess();
    print('onSuccess callback executed');
  }

  CostumWidget.showCustomSnackbar(
    context: context,
    message: successMessage,
    backgroundColor: Colors.blue,
    borderColor: Colors.white,
  );
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
  final priceRegex = RegExp(r'^\d+(\.\d{1,2})?$'); // Only digits or decimal (e.g., 10.00)

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


}


