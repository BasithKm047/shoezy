import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

class CostumWidget {
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
}) {
  return FormField<String>(
    
    autovalidateMode:AutovalidateMode.onUnfocus,
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
              border: Border.all(
                color: hasError ? Colors.red : Colors.grey,
              ),
            ),
            child: TextFormField(
               obscureText: obscureText ?? false,
              controller: controller,
              keyboardType: keyboardType,
              maxLines: (obscureText ?? false)?1:  null,
              minLines: (obscureText ?? false)?1: minLines,
              style: textStyle ?? TextStyle(color: textColor),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) {
                fieldState.didChange(value); 
                },
              decoration: InputDecoration(
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
                contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                errorStyle: const TextStyle(height: 0),
              ),
            ),
          ),
          // Custom error text displayed outside
          if (fieldState.hasError)
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 8),
              child: Text(
                fieldState.errorText!,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
        ],
      );
    },
  );
}


  static AppBar appBar({
    required String title,
    required BuildContext context,
    required bool centerTitle,
    List<Widget> widgets=const [SizedBox()],
  }) {
    return AppBar(

      actions:  widgets,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 25,
          fontWeight: FontWeight.bold,
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
    Color borderColor = Colors.white,
    Color textColor = Colors.white,
    double fontSize = 16,
  }) {
    final snackbar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: textColor, fontSize: fontSize),
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        side: BorderSide(color: borderColor),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static Widget dashboardCard({
    required BuildContext context,
    required String title,
    required int count,
    required IconData icon,
    required Color iconColor,
    double? fontSize,
    double? fontSize2,
    double? iconSize,
    double? height,
    Widget? widget,
    bool? isSmallScreen,
    
  }) {
    return Card(
      elevation: 4,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadiusGeometry.circular(16),
      // ),
      child: Container(
        decoration: BoxDecoration(
        color: Colors.white,

          borderRadius: BorderRadius.circular(8)
        ),
        width: 250,
        height: isSmallScreen ?? true ? height : 180,
        padding: EdgeInsets.all(16),
        child: isSmallScreen ?? false
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Icon(icon, size: iconSize ?? 50, color: iconColor),

                  SizedBox(height: 10),

                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: fontSize2 ?? 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '$count',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: fontSize ?? 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            : Stack(
                children: [
                  // Center Count
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text(
                        '$count',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: fontSize ?? 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Title
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: fontSize2 ?? 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(icon, size: iconSize ?? 50, color: iconColor),
                  ),
                ],
              ),
      ),
    );
  }

  static costumCard({
     double ? height,
    required double width,
    required double borderRaduis,
    double? elevetion,
    Color? shadowColor,
    Widget? widget,
    Color? color,
    double? padding,
  }) {
    return Card(
      
      elevation: elevetion,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRaduis)),
      ),

      shadowColor: shadowColor,
      child: Container(

        padding: EdgeInsets.all(padding ?? 10),
        height: height,
        width: width,
        decoration: BoxDecoration(color: color,
        border: Border()),
        child: widget,
      ),
    );
  }

  static costumHeader({
    required double height,
    required double width,
    Color color = Colors.white,
    Color borderColor = Colors.grey,
    double? borderWidth,
    Widget? child,
    bool? isSmall,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        width: width,

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: borderColor, width: borderWidth ?? 1.0),
        ),

        child: child,
      ),
    );
  }

  static costumListviewBuilder({
    String? leading,
    String? title,
    Widget? trailing,

    String? subtitle,
    double? itemCount,

    Widget? child,
  }) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return child;
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: 5,
    );
  }

  static Container userdetailsLitview({
    required BuildContext context,
    Widget? widgets,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(color: Colors.white),
      child: widgets,
    );
  }

  static costumElevatedButton({
    required BuildContext context,
    required String title,
    Widget? child,
     Color backgroundColor=Colors.blue,
     Color foregroundColor=Colors.white,
    double? borderRadius,
    VoidCallback? ontap,
    double ? width,
    double? height,
  }) {

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          
        onPressed: () {
          if(ontap!=null){
          ontap();

          }
        },
      
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: foregroundColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
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

  static Widget costumElevatedIconButton({
    required BuildContext context,
    required String text,
    VoidCallback? ontap,
    Color? backgroundColor,
    Color? foregroundColor,
    double? borderRadius,
    double? fontsize,
  }) {
    return SizedBox(
      child: ElevatedButton.icon(
        onPressed: ontap,
        icon: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: const Icon(Icons.add),
        ),
        label: Padding(
          padding: const EdgeInsets.only(right: 12, bottom: 2, left: 5),
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: fontsize,
              color: Colors.white,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
          backgroundColor:
              backgroundColor ?? const Color.fromARGB(255, 193, 212, 227),
          foregroundColor: foregroundColor ?? Colors.white,
        ),
      ),
    );
  }
static Widget costumDropdown<T>({
  required List<T> items,
  required T? selectedValue,
  required String hintText,
  required void Function(T?) onChanged,
  double? width,
  double? borderRaduis,
  double? height,
  Color? backgroundColor,
  Color? textColor,
  Color? hitColor,
  Color? iconColor,
  String Function(T)? itemToString,
  FormFieldValidator<T>? validator,
}) {
  return FormField<T>(
    validator: validator,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    builder: (FormFieldState<T> fieldState) {
      final hasError = fieldState.hasError;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(
                color: hasError ? Colors.red : Colors.grey, // Red if error
                // width: 1.5,
              ),
              borderRadius: BorderRadius.circular(borderRaduis ?? 10),
              color: backgroundColor ?? Colors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                isExpanded: true,
                iconEnabledColor: iconColor ?? Colors.black,
                iconSize: 30,
                value: items.contains(selectedValue )? selectedValue:null,
                dropdownColor: backgroundColor ?? Colors.white,
                hint: Text(
                  hintText,
                  style: TextStyle(color: hitColor ?? Colors.grey),
                ),
                items: items.map((item) {
                  return DropdownMenuItem<T>(
                    value: item,
                    child: Text(
                      itemToString != null ? itemToString(item) : item.toString(),
                      style: TextStyle(color: textColor ?? Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (val) {
                  fieldState.didChange(val);
                  onChanged(val);
                },
              ),
            ),
          ),
          if (hasError)
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 8),
              child: Text(
                fieldState.errorText ?? '',
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
        ],
      );
    },
  );
}


  static Text labelText(BuildContext context, String hintText,
  {double ?fontSize, FontWeight ?fontWeight}) {
    return Text(
      hintText,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontSize: fontSize ,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
  }


  static Widget costumSelector({
    required List<String> items,
    required List<String> selectedItems,
    required Function(String, bool) onchanged,
    required double width,
    double? itemSpacing,
    Color selectedColor = Colors.blue,
    Color unselectedColor = Colors.white,
    Color? textColor = Colors.white,
    double height = 40,
    double? borderRadius,
    Axis ? direction,
  }) {

    return SizedBox(
      width: width,
      child: Wrap(
        spacing: itemSpacing ?? 10.0,
        runSpacing: 10,
        direction:direction??  Axis.horizontal,
        children: items.map((item) {
          final bool isSelected = selectedItems.contains(item);
          return InkWell(
            onTap: () {
              onchanged(item, !isSelected); // Toggle selection
              print('Toggled item: $item, isSelected: ${!isSelected}');
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                border: !isSelected ? Border.all(color: Colors.grey) : null,
                color: isSelected ? selectedColor : unselectedColor,
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),
              child: Text(
                item,
                style: TextStyle(
                  color: isSelected ? Colors.white : textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
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
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(cancelButtonText),
        ),
        SizedBox(
          width: 100,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10)
              ),
              backgroundColor: confirmButtonColor,
            ),
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              onConfirm(); // Execute callback
            },
            child: Text(confirmButtonText),
          ),
        ),
      ],
    ),
  );
}

  
}

