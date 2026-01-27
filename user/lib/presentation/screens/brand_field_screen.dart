import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shoezy/presentation/bloc/brand_bloc/brand_bloc.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/widgets/brand_screen_card.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';

class BrandFieldScreen extends StatelessWidget {
  final List<ProductModel>product;
  // Sample category data: title and placeholder image URL (replace with actual URLs)

   const BrandFieldScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, state) {
       if(state is BrandLoadingState){
        return Center(
          child:  AnimationLoading.shimmerHorizontalGrid(itemCount: 6),
        );
        

       }
       if(state is BrandLoadedState){
        final brands = state.brands;
        // Logger().d(brands.map((b) => b.logoImage).toList());
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Brands',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75, // Adjust for taller cards
                  ),
                  itemCount: brands.length,
                  itemBuilder: (context, index) {
                    final brand = brands[index];
                    return BrandScreenCard(
                      products: product,
                      title: brand.name,
                      imageUrl: brand.imageUrl,
                    );
                  },
                ),
              ),
            ],
          ),

          // Bottom Navigation Bar
        );
       
       }
       if(state is BrandLoadErrorState){
        return Center(child: Text('Error Loading brand :${state.message}'));
       }
       return SizedBox();
      },
  
    );
  }
}
