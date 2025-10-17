import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/application/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:shoezy/presentation/widgets/home_screen_widgets.dart';

class TagsDetailedShowingScreen extends StatelessWidget {
  const TagsDetailedShowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        final List<String> tags = state.maybeWhen(
          orElse: () => [],
          loaded: (products) => products.map((p) => p.tag).toSet().toList()
        );
        return Scaffold(
        
          body: ListView.separated(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(height: 10,),
                  HomeScreenWidgets.tagLabel(screenWidth, context, tags[index],false),
                  HomeScreenWidgets.tagProducts(tags[index]),

                ],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10,);
            },
            itemCount: tags.length,
          ),
        );
      },
    );


  }
}
