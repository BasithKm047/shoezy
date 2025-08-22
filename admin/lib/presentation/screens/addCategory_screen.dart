import 'package:flutter/material.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';
import 'package:shoezy_admin/fetures/utils/const/static_things.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';

class AddcategoryScreen extends StatelessWidget {
  AddcategoryScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final TextEditingController _categoryNameController = TextEditingController();
  // final ValueNotifier<String?> selectedCategory = ValueNotifier(null);
    final categories=StaticThings.categoryTypes;

  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CostumWidget.appBar(
        title: 'Add Category',
        context: context,
        centerTitle: true,
      ),

      body: Center(
        child: SizedBox(
          width: screenWidth / 2,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // CostumWidget.labelText(context, 'Category Type'),
                    // SizedBox(width: screenWidth / 4.3),
                    CostumWidget.labelText(context, 'Category Name'),
                    // SizedBox(width: 20,),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ValueListenableBuilder<String?>(
                    //   valueListenable: selectedCategory,
                    //   builder: (context, value, child) {
                    //     return CostumWidget.costumDropdown(
                    //       items: categories,
                    //       selectedValue: value,
                    //       hintText: 'Category type',
                    //       onChanged: (newValue) {
                    //         selectedCategory.value = newValue;
                    //       },
                    //       width: screenWidth / 5,
                    //     );
                    //   },
                    // ),

                    CostumWidget.costumTextformField(
                      controller: _categoryNameController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a category name';
                        }
                        return null;
                      },
                      hintText: 'Name',
                      width: screenWidth / 2,
                    ),
                  ],
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: screenWidth / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(width: 10,),
                      CostumWidget.costumElevatedButton(
                        ontap: () {
                          Commonfunction.validateAndSubmitForm(
                            context: context,
                            formKey: _formKey,
                            successMessage: 'Category added successfully',
                            errorMessage: 'Failed to add category',
                            onSuccess: () {
                              print(
                                'Category added: ${_categoryNameController.text}',
                              );
                              _categoryNameController.clear();
                              // selectedCategory.value=null;
                            },
                          );
                          // Handle form submission
                          String categoryName = _categoryNameController.text;
                          print('Category Name: $categoryName');
                        },
                        context: context,
                        title: 'Add Category',
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        width: screenWidth / 7,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
