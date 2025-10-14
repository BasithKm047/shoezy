import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy_admin/data/model/tag/tag_model.dart';
import 'package:shoezy_admin/presentation/bloc/tag_bloc/bloc/tag_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/loading_overlay.dart';

class AddTagScreen extends StatelessWidget {
  AddTagScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _tagNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CostumWidget.appBar(
        title: 'Add Tag',
        context: context,
        centerTitle: true,
      ),
      body: BlocConsumer<TagBloc, TagState>(
        listener: (context, state) {
          state.maybeWhen(
            success: () {
              CostumWidget.showCustomSnackbar(
                context: context,
                message: 'Tag added successfully',
                backgroundColor: Colors.blue,
              );
              _tagNameController.clear();
            },

            error: (message) => CostumWidget.showCustomSnackbar(
              context: context,
              message: message,
              backgroundColor: Colors.red,
            ),

            orElse: () {},
          );
        },
        builder: (context, state) {
          return Center(
            child: SizedBox(
              width: screenWidth / 2,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      CostumWidget.labelText(context, 'Tag Name'),
                      const SizedBox(height: 10),
                      tagNamingField(screenWidth),
                      const SizedBox(height: 40),
                      addTagButton(screenWidth, context),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget tagNamingField(double screenWidth) {
    return CostumWidget.costumTextformField(
      controller: _tagNameController,
      hintText: 'Enter tag name',
      width: screenWidth / 2,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a tag name';
        } else if (value.length < 3) {
          return 'Tag name must be at least 3 characters';
        }
        return null;
      },
    );
  }

  Center addTagButton(double screenWidth, BuildContext context) {
    return Center(
      child: CostumWidget.costumElevatedButton(
        width: screenWidth / 6,
        context: context,
        title: 'Add Tag',
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        ontap: () async {
          if (_formKey.currentState!.validate()) {
            final tagName = _tagNameController.text.trim();
            final tags = TagModel(name: tagName);

            context.read<TagBloc>().add(TagEvent.addTag(tags));

            _tagNameController.clear();

            LoadingOverlay.show(context, 'Adding Tags ...');

            await Future.delayed(Duration(seconds: 1));
            LoadingOverlay.hide();
          }
        },
      ),
    );
  }
}
