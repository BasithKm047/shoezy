import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoezy_admin/data/model/tag/tag_model.dart';
import 'package:shoezy_admin/fetures/utils/const/routes.dart';
import 'package:shoezy_admin/presentation/bloc/tag_bloc/bloc/tag_bloc.dart';
import 'package:shoezy_admin/presentation/screens/edit_tag_screen.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/loading_overlay.dart';

class TagScreen extends StatefulWidget {
  const TagScreen({super.key});

  @override
  State<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    context.read<TagBloc>().add(TagEvent.fetchTags());
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
    _debounce?.cancel();
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        context.read<TagBloc>().add(TagEvent.fetchTags());
      } else {
        context.read<TagBloc>().add(TagEvent.searchTag(query));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<TagBloc, TagState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (tags, selectedTags) {
            LoadingOverlay.hide();
          },
          loading: () => LoadingOverlay.show(context, 'Loading Tags ...'),
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
        final List<TagModel> tags = state.maybeWhen(
          orElse: () => [],
          loaded: (tags, selectedTags) => tags,
        );
        return Scaffold(
          appBar: CostumWidget.appBar(
            title: 'Tags',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CostumWidget.costumSearchBar(
                        controller: searchController,
                        hintText: 'Search Tag',
                        width: screenWidth / 3,
                        onChanged: onSearchChanged,
                        borderRadius: 10,
                        icon: Icons.search,
                      ),
                      SizedBox(width: 15),
                      CostumWidget.costumElevatedButton(
                        ontap: () {
                          // For now just show snackbar
                          context.go(Routes.addTagScreen);
                        },
                        width: screenWidth / 7,
                        context: context,
                        title: 'Add Tag',
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
                    SizedBox(height: 10),
                    if (tags.isEmpty)
                      Expanded(
                        child: Center(
                          child: Text(
                            searchController.text.isNotEmpty
                                ? "No Tags Found"
                                : "No Tags Available",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final tag = tags[index];
                          return _tagWidget(context: context, tag: tag);
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: tags.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _tagWidget({required BuildContext context, required TagModel tag}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            child: Row(
              children: [
                // Dummy placeholder icon for tag
                Icon(Icons.label, color: Colors.blue),
                SizedBox(width: 10),
                CostumWidget.labelText(
                  context,
                  tag.name,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  // Edit tag action
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditTagScreen(tag: tag),));
                },
                icon: Icon(Icons.edit, color: Colors.blue),
              ),
              IconButton(
                onPressed: () {
                  // Delete tag action
                  CostumWidget.showCustomAlertDialog(
                    confirmButtonColor: Colors.red,
                    confirmButtonText: 'Delete',
                    context: context,
                    title: 'Delete Tag',
                    content: 'Are you sure you want to delete the tag "${tag.name}"?',
                    onConfirm: () {
                      context.read<TagBloc>().add(TagEvent.deleteTag(tag.id!));
                      context.read<TagBloc>().add(TagEvent.fetchTags());
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
            'TagName',
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
