import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy_admin/data/model/product/product_model.dart';
import 'package:shoezy_admin/data/model/size_stock_model.dart/size_stock_model.dart';
import 'package:shoezy_admin/data/model/vareintModel/varientsModel.dart';
import 'package:shoezy_admin/presentation/bloc/addProducts/bloc/product_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/brand/bloc/brand_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/category_bloc/bloc/category_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/gender/cubit/gender_cubit.dart';
import 'package:shoezy_admin/presentation/bloc/size_stock/bloc/size_stock_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/tag_bloc/bloc/tag_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/varients_bloc/bloc/varients_bloc.dart';
import 'package:shoezy_admin/presentation/screens/stock_size_field.dart';
import 'package:shoezy_admin/presentation/screens/variant_field.dart';
import 'package:shoezy_admin/widgets/add_product_fields.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/loading_overlay.dart';

class EditProductScreen extends StatefulWidget {
  final ProductModel product;
  const EditProductScreen({super.key, required this.product});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late final TextEditingController _shoeNameController;
  late final TextEditingController _shoeDescriptionController;
  late final TextEditingController _priceController;
  final _formKey = GlobalKey<FormState>();

  late final String _originalName;
  late final String _originalDescription;
  late final String _originalPrice;
  late final String _originalBrand;
  late final String _originalCategory;
  late final List<Variantsmodel> _originalVariants;
  late final List<SizeStockModel> _originalSizeStocks;
  late final String _originalTag;
  late final String _originalGender;

  @override
  void initState() {
    super.initState();

    context.read<ProductBloc>().add(ProductEvent.reset());
    print(widget.product.gender);
    _originalName = widget.product.productName.trim();
    _originalDescription = widget.product.description.trim();
    _originalPrice = widget.product.price.trim();
    _originalBrand = widget.product.brandName;
    _originalCategory = widget.product.categoryName;
    _originalVariants = List<Variantsmodel>.from(widget.product.variants);
    _originalSizeStocks = List<SizeStockModel>.from(widget.product.sizeStock);
    _originalTag = widget.product.tag;
    _originalGender = widget.product.gender;

    _shoeNameController = TextEditingController(text: _originalName);
    _shoeDescriptionController = TextEditingController(
      text: _originalDescription,
    );
    _priceController = TextEditingController(text: _originalPrice);

    context.read<BrandBloc>().add(FetchBrands(brandName: _originalBrand));
    context.read<CategoryBloc>().add(const GetCategories());
    context.read<TagBloc>().add(const TagEvent.fetchTags());
    // context.read<GenderCubit>().fe

    Future.delayed(const Duration(milliseconds: 100), () {
      print('its running');
      context.read<CategoryBloc>().add(
        CategoryEvent.selectedCategory(_originalCategory),
      );

      context.read<BrandBloc>().add(BrandEvent.selectedBrand(_originalBrand));

      context.read<VariantsBloc>().add(VariantsEvent.clearVariants());
      context.read<VariantsBloc>().add(
        VariantsEvent.addVariants(_originalVariants),
      );

      context.read<SizeStockBloc>().add(SizeStockEvent.clearSizeStock());
      context.read<SizeStockBloc>().add(
        SizeStockEvent.addedSizeStock(_originalSizeStocks),
      );
      context.read<TagBloc>().add(TagEvent.selectedTag(_originalTag));
      context.read<GenderCubit>().selectGender(_originalGender);
    });
  }

  @override
  void dispose() {
    _shoeNameController.dispose();
    _shoeDescriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  bool hasChanges({
    required String currentBrand,
    required String currentCategory,
    required List<Variantsmodel> currentVariants,
    required List<SizeStockModel> currentSizeStocks,
    required String currentTag,
    required String currentGender,
  }) {
    // Check simple fields
    final currentName = _shoeNameController.text.trim();
    final currentDescription = _shoeDescriptionController.text.trim();
    final currentPrice = _priceController.text.trim();

    if (currentName != _originalName ||
        currentDescription != _originalDescription ||
        currentPrice != _originalPrice ||
        currentBrand != _originalBrand ||
        currentCategory != _originalCategory) {
      return true;
    }

    if (currentVariants.length != _originalVariants.length ||
        currentSizeStocks.length != _originalSizeStocks.length ||
        currentTag != _originalTag ||
        currentGender != _originalGender) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return PopScope(
      canPop: true,
      // ignore: deprecated_member_use
      onPopInvoked: (didPop) {
        context.read<ProductBloc>().add(ProductEvent.getProduct());
      },
      child: Scaffold(
        appBar: CostumWidget.appBar(
          title: 'Edit Product',
          context: context,
          centerTitle: true,
        ),
        body: BlocListener<ProductBloc, ProductState>(
          listenWhen: (previous, current) {
            final prevIsSuccess = previous.maybeWhen(
              success: () => true,
              orElse: () => false,
            );
            final currIsSuccess = current.maybeWhen(
              success: () => true,
              orElse: () => false,
            );
            return !prevIsSuccess &&
                currIsSuccess; // only when it becomes success
          },
          listener: (context, state) {
            state.maybeWhen(
              loading: () => LoadingOverlay.show(context, 'Updating...'),
              success: () {
                LoadingOverlay.hide();
                CostumWidget.showCustomSnackbar(
                  context: context,
                  message: 'Product updated successfully!',
                );
                context.read<ProductBloc>().add(ProductEvent.getProduct());
              },
              error: (message) {
                LoadingOverlay.hide();
                CostumWidget.showCustomSnackbar(
                  context: context,
                  message: 'Error: $message',
                  backgroundColor: Colors.red,
                );
              },
              orElse: () {},
            );
          },
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CostumWidget.costumCard(
                      padding: 30,
                      width: screenWidth / 1.1,
                      borderRaduis: 15,
                      elevetion: 4,
                      color: Colors.white,
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CostumWidget.labelText(context, 'Shoe Name'),
                          const SizedBox(height: 10),
                          AddProductFields.namingFeild(
                            _shoeNameController,
                            screenWidth,
                          ),
                          const SizedBox(height: 10),
                          CostumWidget.labelText(context, 'Select Brand'),
                          const SizedBox(height: 10),
                          AddProductFields.brandSelectField(
                            screenWidth,
                            brandName: _originalBrand,
                            isUpdating: true,
                          ),
      
                          const SizedBox(height: 10),
                          CostumWidget.labelText(context, 'Select Category'),
                          const SizedBox(height: 10),
                          AddProductFields.categorySelectField(
                            categoryName: _originalCategory,
                            isUpdating: true,
                            screenWidth: screenWidth,
                          ),
                          const SizedBox(height: 10),
                          CostumWidget.labelText(context, 'Add Tags'),
                          const SizedBox(height: 10),
                          AddProductFields.tagSelectorField(
                            screenWidth,
                            tagName: _originalTag,
                            isUpdating: true,
                          ),
                          const SizedBox(height: 10),
                          CostumWidget.labelText(context, 'Select Gender'),
                          const SizedBox(height: 10),
                          AddProductFields.genderSelectorField(
                            screenWidth,
      
                            gender: _originalGender,
                            genderList: ['Men', 'Women', 'Kids'],
                            isUpdating: true,
                          ),
                          const SizedBox(height: 10),
                          CostumWidget.labelText(context, 'Add Variants'),
                          const SizedBox(height: 10),
                          VariantField(), // This will now reflect pre-populated variants from bloc
                          const SizedBox(height: 10),
                          SizeStockFieldWidget(), // This will now reflect pre-populated size stocks from bloc
                          const SizedBox(height: 10),
                          CostumWidget.labelText(context, 'Price'),
                          const SizedBox(height: 10),
                          AddProductFields.priceField(
                            _priceController,
                            screenWidth,
                          ),
                          const SizedBox(height: 10),
                          CostumWidget.labelText(context, 'Description'),
                          const SizedBox(height: 10),
                          AddProductFields.descriptionFeild(
                            _shoeDescriptionController,
                            screenWidth,
                          ),
                          const SizedBox(height: 20),
                          _buildUpdateButton(context, screenWidth),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUpdateButton(BuildContext context, double screenWidth) {
    final brandState = context.watch<BrandBloc>().state;
    final categoryState = context.watch<CategoryBloc>().state;
    final variantsState = context.watch<VariantsBloc>().state;
    final sizeState = context.watch<SizeStockBloc>().state;

    final selectedBrand = brandState.maybeWhen(
      orElse: () => null,
      loaded: (brands, selectedBrandName) => brands.firstWhere(
        (brand) => brand.name == selectedBrandName,
        orElse: () => brands.first,
      ),
    );

    final selectedCategory = categoryState.maybeWhen(
      orElse: () => null,
      loaded: (categories, selectedCategoryName) => categories.firstWhere(
        (category) => category.name == selectedCategoryName,
        orElse: () => categories.first,
      ),
    );

    final selectedTag = context.read<TagBloc>().state.maybeWhen(
      orElse: () => null,
      loaded: (tags, selectedTags) => tags.firstWhere(
        (tag) => tag.name == selectedTags,
        orElse: () => tags.first,
      ),
    );

    final selectedGender = context.read<GenderCubit>().state is GenderSelected
        ? (context.read<GenderCubit>().state as GenderSelected).gender
        : null;

    final currentVariants = variantsState.maybeWhen(
      orElse: () => <Variantsmodel>[],
      data: (images, variants, showfield) => variants,
    );

    final currentSizeStocks = sizeState.maybeWhen(
      orElse: () => <SizeStockModel>[],
      loaded: (sizeStock) => sizeStock,
    );

    final hasBrandAndCategory =
        selectedBrand != null && selectedCategory != null;
    final hasVariants = currentVariants.isNotEmpty;
    final hasSizeStocks = currentSizeStocks.isNotEmpty;

    final canUpdate = hasBrandAndCategory && hasVariants && hasSizeStocks;

    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CostumWidget.costumElevatedButton(
            context: context,
            title: 'Update Product', // Always show this now
            backgroundColor: canUpdate ? Colors.blue : Colors.grey,
            foregroundColor: Colors.white,
            ontap: canUpdate
                ? () async {
                    if (!_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fix validation errors'),
                          backgroundColor: Colors.orange,
                        ),
                      );
                      return;
                    }

                    final updatedProduct = ProductModel(
                      id: widget.product.id,
                      productName: _shoeNameController.text.trim(),
                      brandName: selectedBrand.name,
                      categoryName: selectedCategory.name,
                      price: _priceController.text.trim(),
                      description: _shoeDescriptionController.text.trim(),
                      variants: currentVariants,
                      sizeStock: currentSizeStocks,
                      createdAt: widget.product.createdAt,
                      gender: selectedGender!,
                      tag: selectedTag!.name,
                    );

                    context.read<ProductBloc>().add(
                      ProductEvent.updateProduct(updatedProduct),
                    );
                    context.read<ProductBloc>().add(
                      ProductEvent.getProduct(),
                    ); // optional
                    Navigator.of(context).pop(true);
                  }
                : null,
            width: screenWidth / 7,
            height: 40,
          ),
        ],
      ),
    );
  }
}
