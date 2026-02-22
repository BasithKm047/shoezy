import 'package:flutter/material.dart';
import 'package:shoezy/utils/const/colors.dart';

class CostumWidget {
  static costumElevatedButton({
    required BuildContext context,
    required String title,
    Widget? child,
    Widget? loading,
    Color backgroundColor = Colors.blue,
    Color foregroundColor = Colors.white,
    double? borderRadius,
    VoidCallback? ontap,
    double? width,
    double? height,
    Color? borderColor,
    double? fontSize,
    double? borderRadius2,
    FontWeight? fontWeight,
    bool? isPrefix,
    Widget? widget,
    bool? isRounded,
    bool? isLoading,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 50),
      ),
      child: ElevatedButton(
        onPressed: () {
          if (ontap != null) {
            ontap();
          }
        },

        style: ElevatedButton.styleFrom(
          elevation: 0,
          side: isRounded ?? true ? BorderSide.none : BorderSide(),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
          ),
        ),
        child: isLoading ?? false
            ? loading
            : (isPrefix ?? false)
            ? widget
            : Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: foregroundColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight ?? FontWeight.bold,
                ),
              ),
      ),
    );
  }

  static costumSearchBar({
    required double width,
    double? borderRadius,
    IconData? icon,
    TextEditingController? controller,
    VoidCallback? ontap,
    required String hintText,
  }) {
    return SizedBox(
      width: width,

      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 10,
          ),
        ),
        controller: controller,
        onTap: ontap,
      ),
    );
  }

  static Text labelText(
    BuildContext context,
    String hintText, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Text(
      hintText,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color,
      ),
    );
  }

  static Widget costumTextformField({
    required String hintText,
    String? labelText,
    Color backgroundColor = Colors.white,
    Color textColor = Colors.black,
    Color hintColor = const Color.fromARGB(133, 89, 84, 114),
    double borderRadius = 8.0,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    TextStyle? textStyle,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    FormFieldValidator<String>? validator,
    double? padding,
    double? width,
    double? height,
    bool? obscureText,
    void Function(String?)? onChanged,
    int? minLines,
    bool? isBorderNotNeed,
    Widget? suffixIcon,
    Widget? prefixIcon,
  }) {
    return FormField<String>(
      autovalidateMode: AutovalidateMode.onUnfocus,
      validator: validator,
      builder: (FormFieldState<String> fieldState) {
        bool hasError = fieldState.hasError;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: isBorderNotNeed ?? true
                    ? Border.all(color: hasError ? AppColors.red : Colors.grey)
                    : null,
              ),
              child: TextFormField(
                obscureText: obscureText ?? false,
                controller: controller,
                keyboardType: keyboardType,
                maxLines: (obscureText ?? false) ? 1 : null,
                minLines: (obscureText ?? false) ? 1 : minLines,
                style: textStyle ?? TextStyle(color: textColor),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  fieldState.didChange(value);
                  if (onChanged != null) {
                    onChanged(value);
                  }
                },
                decoration: InputDecoration(
                  suffixIconConstraints: BoxConstraints(
                    minHeight: 32,
                    minWidth: 32,
                  ),
                  isDense: true,
                  suffix: suffixIcon,
                  prefix: prefixIcon,
                  filled: true,
                  fillColor: backgroundColor,
                  hintText: hintText,
                  hintStyle: hintStyle ?? TextStyle(color: hintColor),
                  labelText: labelText,
                  labelStyle: labelStyle ?? TextStyle(color: textColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  errorStyle: const TextStyle(height: 0),
                ),
              ),
            ),
            // Custom error text displayed outside
            if (fieldState.hasError)
              SizedBox(
                width: width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 8),
                  child: Text(
                    fieldState.errorText ?? '',
                    style: TextStyle(color: AppColors.red, fontSize: 14),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  static AppBar backButton(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
    );
  }

  static showCustomSnackbar({
    required BuildContext context,
    required String message,
    Color backgroundColor = Colors.blue,
    Duration duration = const Duration(seconds: 2),
    double elevation = 5,
    double borderRadius = 10,
    // Color borderColor = Colors.white,
    Color textColor = Colors.white,
    double fontSize = 16,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
  }) {
    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: margin,
      elevation: elevation,
      backgroundColor: backgroundColor,
      duration: duration,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        // side: BorderSide(color: borderColor),
      ),
      content: Padding(
        padding: contentPadding,
        child: Text(
          message,
          style: TextStyle(color: textColor, fontSize: fontSize),
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static Future<void> showCustomAlertDialog({
    required BuildContext context,
    required String title,
    required String content,
    required String confirmButtonText,
    required Color confirmButtonColor,
    required VoidCallback onConfirm,
    String cancelButtonText = 'Cancel',
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing by tapping outside
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),

              // Content
              Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Cancel Button
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        cancelButtonText,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Confirm Button
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: confirmButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Close dialog
                        onConfirm(); // Callback
                      },
                      child: Text(
                        confirmButtonText,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
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
