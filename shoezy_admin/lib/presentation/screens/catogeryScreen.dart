import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoezy_admin/data/model/categoryModel/category_model.dart';
import 'package:shoezy_admin/fetures/utils/const/routes.dart';
import 'package:shoezy_admin/presentation/bloc/category_bloc/bloc/category_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/presentation/screens/edit_category_screen.dart';
import 'package:shoezy_admin/widgets/loading_overlay.dart';

class Catogeryscreen extends StatelessWidget {
  const Catogeryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    context.read<CategoryBloc>().add(CategoryEvent.getCategories());
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, top: 50),
      child: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loaded: (categories, selectedCategory) {
              LoadingOverlay.hide();
            },
            loading: () {
              LoadingOverlay.show(context, 'Loading...');
            },
          );
        },
        builder: (context, state) {
          final List<CategoryModel> categories = state.maybeWhen(
            orElse: () => [],
            loaded: (categories, selectedCategory) => categories,
          );

          return Scaffold(
            appBar: CostumWidget.appBar(
              title: 'Category',
              context: context,
              centerTitle: true,
            ),
            body: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(12.0),

                  child: SizedBox(
                    width: screenWidth / 1.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: 15),
                        CostumWidget.costumElevatedButton(
                          ontap: () {
                            context.go(Routes.addCategoryScreen);
                          },
                          width: screenWidth / 7,
                          context: context,
                          title: 'Add Category',
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),

                CostumWidget.costumCard(
                  elevetion: 4,
                  height: 500,
                  width: screenWidth / 1.1,
                  borderRaduis: 10,
                  widget: Column(
                    children: [
                      CostumWidget.costumHeader(
                        height: 40,
                        width: screenWidth / 1.1,
                        child: header(context: context),
                      ),
                      if (categories.isEmpty)
                        Expanded(
                          child: Center(child: Text('No Categories Available')),
                        ),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            return _widget(
                              context: context,
                              category: category,
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: categories.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget _widget({
  required BuildContext context,
  required CategoryModel category,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            width: 50,
            child: Row(
              children: [CostumWidget.imageField(image: category.image!)],
            ),
          ),
        ),

        Expanded(
          flex: 2,
          child: CostumWidget.labelText(
            context,
            category.name,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),

        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => EditCategoryScreen(category: category),
                    ),
                  );
                },
                icon: Icon(Icons.edit, color: Colors.blue),
              ),
              IconButton(
                onPressed: () {
                  CostumWidget.showCustomAlertDialog(
                    context: context,
                    title: 'Delete Category',
                    content: 'Are you sure you want to delete this category?',
                    confirmButtonText: 'Delete',
                    confirmButtonColor: Colors.red,
                    onConfirm: () {
                      context.read<CategoryBloc>().add(
                        CategoryEvent.deleteCategory(id: category.id!),
                      );
                      context.read<CategoryBloc>().add(const CategoryEvent.getCategories());
                    },
                  );
                },
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget header({required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: CostumWidget.labelText(
            context,
            'Image',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          flex: 2,
          child: CostumWidget.labelText(
            context,
            'Name',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),

        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CostumWidget.labelText(
                context,
                'Action',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
