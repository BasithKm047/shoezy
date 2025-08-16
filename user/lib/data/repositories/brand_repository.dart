import 'package:shoezy/data/models/brand_model.dart';

class BrandRepository {

  final List<BrandModel>brands=[
    BrandModel(
      id: '1',
      name: 'Nike',
      imageUrl: './asset/brand-nike-svgrepo-com.svg',
    ),
    BrandModel(
      id: '2',
      name: 'Adidas',
      imageUrl: './asset/adidas-svgrepo-com.svg',
    ),
    BrandModel(
      id: '3',
      name: 'Puma',
      imageUrl: './asset/puma-logo.svg',
    ),
    BrandModel(
      id: '4',
      name: 'Converse',
      imageUrl: './asset/converse-logo3-logo-svgrepo-com.svg',
    ),
    
  ];

  Future<List<BrandModel>>getBrands()async{
    await Future.delayed(Duration(seconds: 1));
    return brands;
  }
} 