import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoezy_admin/data/model/brand/brand_model.dart';
import 'package:shoezy_admin/fetures/utils/const/routes.dart';
import 'package:shoezy_admin/presentation/bloc/brand/bloc/brand_bloc.dart';

import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/presentation/screens/edit_brand_screen.dart';
import 'package:shoezy_admin/widgets/loading_overlay.dart';

class Brandscreen extends StatelessWidget {
  const Brandscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    context.read<BrandBloc>().add(BrandEvent.fetchBrands());
    return BlocConsumer<BrandBloc, BrandState>(
      listener: (context, state) {
        state.maybeWhen(orElse: () {
          
        },
       
        loaded: (brands, selectedBrand) {
          LoadingOverlay.hide();
        },
        loading: () {
          LoadingOverlay.show(context, 'Loading...');
        },
        );
      },
      builder: (context, state) {
        final List<BrandModel> brands = state.maybeWhen(
          orElse: () => [],
          loaded: (brands, selectedBrand) => brands,
        );
        return Scaffold(
          appBar: CostumWidget.appBar(
            title: 'Brand',
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
                          context.go(Routes.addBrandScreen);
                        },
                        width: screenWidth / 7,
                        context: context,
                        title: 'Add Brand',
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

                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final brand = brands[index];
                          return _widget(
                            context: context,
                            brand: brand,
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: brands.length,
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

Widget _widget({
  required BuildContext context,
  required BrandModel brand,
  // bool? isFeild,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            child: Row(children: [CostumWidget.imageField(image: brand.imageUrl!)]),
          ),
        ),

        Expanded(
          flex: 1,
          child: Row(
            children: [
              SizedBox(width: 10,),
              CostumWidget.labelText(
                context,
                brand.name,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ],
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
                      builder: (_) => EditBrandScreen(
                        brand: brand,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.edit, color: Colors.blue),
              ),
              IconButton(
                onPressed: () {},
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
          flex: 3,
          child: Center(
            child: CostumWidget.labelText(
              context,
              'Brand Name',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
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
