import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy_admin/data/model/tag/tag_model.dart';
import 'package:shoezy_admin/presentation/bloc/tag_bloc/bloc/tag_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/loading_overlay.dart';

class EditTagScreen extends StatelessWidget {
  final TagModel tag;

  EditTagScreen({super.key, required this.tag})
      : _formKey = GlobalKey<FormState>(),
        _tagNameController = TextEditingController(text: tag.name);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _tagNameController;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CostumWidget.appBar(
        title: 'Edit Tag',
        context: context,
        centerTitle: true,
      ),
      body: BlocConsumer<TagBloc, TagState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loading: () {
              LoadingOverlay.show(context, 'Updating Tag...');
            },
            success: () {
              LoadingOverlay.hide();
              CostumWidget.showCustomSnackbar(
                context: context,
                message: 'Tag updated successfully',
                backgroundColor: Colors.blue,
              );
              context.read<TagBloc>().add(const TagEvent.fetchTags());
              Navigator.pop(context);
            },
            error: (message) {
              LoadingOverlay.hide();
              CostumWidget.showCustomSnackbar(
                context: context,
                message: message,
                backgroundColor: Colors.red,
              );
            },
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
                      CostumWidget.costumTextformField(
                        controller: _tagNameController,
                        hintText: 'Enter tag name',
                        width: screenWidth / 2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a tag name';
                          } else if (value.length < 2) {
                            return 'Tag name must be at least 2 characters long';
                          } else if (value.length > 50) {
                            return 'Tag name must be less than 50 characters long';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: CostumWidget.costumElevatedButton(
                          width: screenWidth / 6,
                          context: context,
                          title: 'Update Tag',
                          ontap: () {
                            if (_formKey.currentState!.validate()) {
                              final updatedTag = tag.copyWith(
                                name: _tagNameController.text.trim(),
                              );

                              if (updatedTag.name == tag.name) {
                                CostumWidget.showCustomSnackbar(
                                  context: context,
                                  message: 'No changes made',
                                  backgroundColor: Colors.orange,
                                );
                                return;
                              }

                              context
                                  .read<TagBloc>()
                                  .add(TagEvent.updateTag(updatedTag));
                              // Logger().d('Updated Tag: $updatedTag');
                            }
                          },
                        ),
                      ),
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
}
