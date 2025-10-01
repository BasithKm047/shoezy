import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy_admin/data/model/user/userModel.dart';
import 'package:shoezy_admin/fetures/utils/const/colors.dart';
import 'package:shoezy_admin/presentation/bloc/user/bloc/user_bloc.dart';

import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/loading_overlay.dart';

class Userslist extends StatelessWidget {
  const Userslist({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    context.read<UserBloc>().add(const UserEvent.fetchUsers());
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (users) {
            LoadingOverlay.hide();
          },
          loading: () {
            LoadingOverlay.show(context, 'Loading...');
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
        final users = state.maybeWhen(
          orElse: () => [],
          loaded: (users) => users,
        );

        state.maybeWhen(
          orElse: () {},
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
          error: (message) {
            return Center(child: Text('Error: $message'));
          },
          loaded: (users) {
            if (users.isEmpty) {
              return Center(child: Text('No users found.'));
            }
          },
        );
        return Scaffold(
          // backgroundColor: ,
          appBar: CostumWidget.appBar(
            title: 'User List',
            context: context,
            centerTitle: true,
          ),

          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      bool isSmallScreen = constraints.maxWidth < 700;
                      return isSmallScreen
                          ? Column(
                              children: [
                                CostumWidget.costumSearchBar(
                                  width: screenWidth / 2,
                                  hintText: 'Search Users',
                                  borderRadius: 10,
                                  icon: Icons.search,
                                  // controller: searchController,
                                  onChanged: (query) {
                                    if (query.isEmpty) {
                                      context.read<UserBloc>().add(
                                        const UserEvent.fetchUsers(),
                                      );
                                    } else {
                                      context.read<UserBloc>().add(
                                        UserEvent.searchUsers(query),
                                      );
                                    }
                                  },
                                ),
                                SizedBox(height: 10),
                              ],
                            )
                          : SizedBox(
                              width: screenWidth / 1.2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CostumWidget.costumSearchBar(
                                    width: screenWidth / 4,
                                    hintText: 'Search Users',
                                    borderRadius: 10,
                                    icon: Icons.search,
                                    onChanged: (query) {
                                      if (query.isEmpty) {
                                        context.read<UserBloc>().add(
                                          const UserEvent.fetchUsers(),
                                        );
                                      } else {
                                        context.read<UserBloc>().add(
                                          UserEvent.searchUsers(query),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            );
                    },
                  ),

                  // SizedBox(height: 10),
                  CostumWidget.costumCard(
                    height: screenHeight,
                    width: screenWidth / 1.2,
                    widget: Column(
                      children: [
                        CostumWidget.costumHeader(
                          height: 40,
                          width: screenWidth / 1.2,
                          child: Row(
                            children: [
                              SizedBox(width: 15),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'S.No',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              ),
                              SizedBox(width: 10),

                              Expanded(
                                flex: 4,
                                child: Text(
                                  'User name',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Text(
                                  'Email',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Action',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: users.isEmpty
                              ? Center(
                                  child: Text(
                                    'No Users Found',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              : ListView.separated(
                                  itemBuilder: (context, index) {
                                    final user = users[index];
                                    return widgets(
                                      context,
                                      screenWidth,
                                      user,
                                      index,
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      Divider(),
                                  itemCount: users.length,
                                ),
                        ),
                      ],
                    ),
                    borderRaduis: 15,
                    elevetion: 4,
                    shadowColor: CostumColors.scaffoldBackroundColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget widgets(
  BuildContext context,
  double screenWidth,
  Usermodel users,
  int index,
) {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            (index + 1).toString(),
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontSize: 10),
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Text(
          users.userName ?? 'name not found',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 15),
        ),
      ),
      Expanded(
        flex: 4,
        child: Text(
          users.email ?? 'email not found',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 15),
        ),
      ),

      Expanded(
        flex: 1,
        child: SizedBox(
          width: screenWidth / 10,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10),
              ),
              backgroundColor: Colors.blue,
            ),
            onPressed: () {},
            child: Text(
              'Block',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
