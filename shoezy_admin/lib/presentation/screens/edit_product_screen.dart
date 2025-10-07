import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/product/product_model.dart';
import 'package:shoezy_admin/data/model/size_stock_model.dart/size_stock_model.dart';
import 'package:shoezy_admin/data/model/vareintModel/varientsModel.dart';
import 'package:shoezy_admin/presentation/bloc/addProducts/bloc/product_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/brand/bloc/brand_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/category_bloc/bloc/category_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/size_stock/bloc/size_stock_bloc.dart';
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

  // Store original values for change detection
  late final String _originalName;
  late final String _originalDescription;
  late final String _originalPrice;
  late final String _originalBrand;
  late final String _originalCategory;
  late final List<Variantsmodel> _originalVariants;
  late final List<SizeStockModel> _originalSizeStocks;

  @override
  void initState() {
    super.initState();

    _originalName = widget.product.productName.trim();
    _originalDescription = widget.product.description.trim();
    _originalPrice = widget.product.price.trim();
    _originalBrand = widget.product.brandName;
    _originalCategory = widget.product.categoryName;
    _originalVariants = List<Variantsmodel>.from(widget.product.variants);
    _originalSizeStocks = List<SizeStockModel>.from(widget.product.sizeStock);

    _shoeNameController = TextEditingController(text: _originalName);
    _shoeDescriptionController = TextEditingController(
      text: _originalDescription,
    );
    _priceController = TextEditingController(text: _originalPrice);

    context.read<ProductBloc>().add(ProductEvent.getProduct());
    context.read<BrandBloc>().add(const FetchBrands());
    context.read<CategoryBloc>().add(const GetCategories());
    context.read<VariantsBloc>().add(const VariantsEvent.getVariants());
    context.read<SizeStockBloc>().add(const SizeStockEvent.getSizeStock());

    Future.delayed(const Duration(milliseconds: 500), () {
      print('its running');
      context.read<CategoryBloc>().add(
        CategoryEvent.selectedCategory(_originalCategory),
      );
      Logger().d(_originalCategory);

      context.read<BrandBloc>().add(BrandEvent.selectedBrand(_originalBrand));
      Logger().d(_originalBrand);

      context.read<VariantsBloc>().add(
        VariantsEvent.addVariants(_originalVariants),
      );

      context.read<SizeStockBloc>().add(
        SizeStockEvent.addedSizeStock(_originalSizeStocks),
      );
    });
  }

  @override
  void dispose() {
    _shoeNameController.dispose();
    _shoeDescriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  bool _hasChanges({
    required String currentBrand,
    required String currentCategory,
    required List<Variantsmodel> currentVariants,
    required List<SizeStockModel> currentSizeStocks,
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

    // Check lists by length (simple check; extend to deep equality if needed)
    if (currentVariants.length != _originalVariants.length ||
        currentSizeStocks.length != _originalSizeStocks.length) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CostumWidget.appBar(
        title: 'Edit Product',
        context: context,
        centerTitle: true,
      ),
      body: BlocListener<ProductBloc, ProductState>(
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
              // Optionally navigate back after success
              // Navigator.pop(context);
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
    );
  }

  Widget _buildUpdateButton(BuildContext context, double screenWidth) {
    // Watch bloc states (automatically rebuilds on state change)
    final brandState = context.watch<BrandBloc>().state;
    final categoryState = context.watch<CategoryBloc>().state;
    final variantsState = context.watch<VariantsBloc>().state;
    final sizeState = context.watch<SizeStockBloc>().state;

    // Extract selected brand
    final selectedBrand = brandState.maybeWhen(
      orElse: () => null,
      loaded: (brands, selectedBrandName) => brands.firstWhere(
        (brand) => brand.name == selectedBrandName,
        orElse: () => brands.first,
      ),
    );

    // Extract selected category
    final selectedCategory = categoryState.maybeWhen(
      orElse: () => null,
      loaded: (categories, selectedCategoryName) => categories.firstWhere(
        (category) => category.name == selectedCategoryName,
        orElse: () => categories.first,
      ),
    );

    // Extract current variants
    final currentVariants = variantsState.maybeWhen(
      orElse: () => <Variantsmodel>[],
      data: (images, variants, showfield) => variants,
    );

    // Extract current size stocks
    final currentSizeStocks = sizeState.maybeWhen(
      orElse: () => <SizeStockModel>[],
      loaded: (sizeStock) => sizeStock,
    );

    // Check if data are valid and changed
    final hasBrandAndCategory =
        selectedBrand != null && selectedCategory != null;
    final hasVariants = currentVariants.isNotEmpty;
    final hasSizeStocks = currentSizeStocks.isNotEmpty;

    final hasChanges = _hasChanges(
      currentBrand: selectedBrand?.name ?? '',
      currentCategory: selectedCategory?.name ?? '',
      currentVariants: currentVariants,
      currentSizeStocks: currentSizeStocks,
    );

    final canUpdate =
        hasBrandAndCategory && hasVariants && hasSizeStocks && hasChanges;

    WidgetsBinding.instance.addPostFrameCallback((_) {});

    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('✅ Product updated successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('❌ Update failed: $message'),
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CostumWidget.costumElevatedButton(
            context: context,
            title: canUpdate ? 'Update Product' : 'No changes made',
            backgroundColor: canUpdate ? Colors.blue : Colors.grey,
            foregroundColor: Colors.white,
            ontap: canUpdate
                ? () async {
                    // ✅ Validate safely (not during build)
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
                      createdAt:
                          widget.product.createdAt, // keep original timestamp
                    );

                    // ✅ Trigger Bloc event only after build
                    context.read<ProductBloc>().add(
                      ProductEvent.updateProduct(updatedProduct),
                    );
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
