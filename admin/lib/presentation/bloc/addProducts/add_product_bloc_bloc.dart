import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy_admin/data/model/brandModel.dart';
import 'package:shoezy_admin/data/model/category_model.dart';

part 'add_product_bloc_event.dart';
part 'add_product_bloc_state.dart';
part 'add_product_bloc_bloc.freezed.dart';

class AddProductBlocBloc
    extends Bloc<AddProductBlocEvent, AddProductBlocState> {
  AddProductBlocBloc()
    : super(
        _AddProductBlocState(
          productName: '',
          productImage: [],
          price: '',
          productDescription: '',
          sizeStockMap: {},
          selectedCategory: null,
          selectedBrand: null,
          selectedSizes: [],
          // selectedColors: [],
          availableColors: [],
          availableSize: [],
          selectedColor: '',
          productStock: '',
          availableCategories: [
            CategoryModel(id: '1', name: 'Men', sizes: ['7', '8', '9']),
            CategoryModel(id: '2', name: 'Women', sizes: ['5', '6', '7']),
            CategoryModel(id: '3', name: 'Kids', sizes: ['3', '4', '5']),
          ],
          availableBrands: [
            Brandmodel(
              id: '1',
              name: 'Nike',
              colors: ['Red', 'Blue', 'Green'],
              imageUrl: '',
            ),
            Brandmodel(
              id: '2',
              name: 'Adidas',
              colors: ['Black', 'White', 'Gray'],
              imageUrl: '',
            ),
            Brandmodel(
              id: '3',
              name: 'Puma',
              colors: ['Pink', 'Purple', 'Orange'],
              imageUrl: '',
            ),
          ],
          isSubmitting: false,
          isSuccess: false,
          errorMessage: null,
        ),
      ) {
    on<_NameChanged>(_onNameChanged);
    on<_DescriptionChanged>(_onDescriptionChanged);
    on<_PriceChanged>(_onPriceChanged);
    on<_BrandChanged>(_onBrandChanged);
    on<_CategorySelected>(_onCategorySelected);
    on<_SizeSelected>(_onSizeSelected);
    on<_StockUpdated>(_onStockUpdated);
    on<_ImageAdded>(_onImageAdded);
    on<_ImageRemoved>(_onImageRemoved);
    on<_ColorChanged>(_onColorChanged);
    on<_Submit>(_onSubmitted);
    on<_Reset>(_onReset);
    on<_ImagesUpdated>(_onImagesUpdated);
  }

  void _onNameChanged(_NameChanged event, Emitter<AddProductBlocState> emit) {
    final currentState = state as _AddProductBlocState;
    emit(currentState.copyWith(productName: event.name));
  }

  void _onDescriptionChanged(
    _DescriptionChanged event,
    Emitter<AddProductBlocState> emit,
  ) {
    final currentState = state as _AddProductBlocState;
    emit(currentState.copyWith(productDescription: event.description));
  }

  void _onPriceChanged(_PriceChanged event, Emitter<AddProductBlocState> emit) {
    final currentState = state as _AddProductBlocState;
    emit(currentState.copyWith(price: event.price));
  }

  void _onSizeSelected(_SizeSelected event, Emitter<AddProductBlocState> emit) {
    final currentState = state as _AddProductBlocState;
    final updateSizes = List<String>.from(currentState.selectedSizes);
    final updateStockMap = Map<String, int?>.from(currentState._sizeStockMap);
    if (event.selected) {
      updateSizes.add(event.size);
      updateStockMap[event.size] = updateStockMap[event.size];
    } else {
      updateSizes.remove(event.size);
      updateStockMap.remove(event.size);
    }

    emit(
      currentState.copyWith(
        selectedSizes: updateSizes,
        sizeStockMap: updateStockMap,
      ),
    );
  }

  _onCategorySelected(
    _CategorySelected event,
    Emitter<AddProductBlocState> emit,
  ) {
    final currentState = state as _AddProductBlocState;
    final category = currentState.availableCategories.firstWhere(
      (c) => c.id == event.category,
      orElse: () =>
          CategoryModel(id: '1', name: 'Default', sizes: ['7', '8', '9']),
    );

    emit(
      currentState.copyWith(
        selectedCategory: category.id.isNotEmpty ? category : null,
        selectedSizes: [],
        sizeStockMap: {},
        availableSize: category.sizes,
      ),
    );
  }

  _onBrandChanged(_BrandChanged event, Emitter<AddProductBlocState> emit) {
    final currentState = state as _AddProductBlocState;
    final brand = currentState.availableBrands.firstWhere(
      (b) => b.id == event.brand,
      orElse: () => Brandmodel(
        id: '1',
        name: 'Default',
        colors: ['Red', 'Blue', 'Green'],
        imageUrl: '',
      ),
    );

    emit(
      currentState.copyWith(
        selectedBrand: brand.id.isNotEmpty ? brand : null,
        availableColors: brand.colors,
        selectedColor: '',
        selectedSizes: [],
        sizeStockMap: {},
      ),
    );
  }

  _onStockUpdated(_StockUpdated event, Emitter<AddProductBlocState> emit) {
    final currentState = state as _AddProductBlocState;
    final updateStockMap = Map<String, int?>.from(currentState.sizeStockMap);
    updateStockMap[event.size] = int.tryParse(event.stock);
    emit(currentState.copyWith(sizeStockMap: updateStockMap));
  }

  _onImageAdded(_ImageAdded event, Emitter<AddProductBlocState> emit) {
    final currentState = state as _AddProductBlocState;
    final updateImages = List<Uint8List>.from(currentState.productImage)
      ..add(event.image);
    emit(currentState.copyWith(productImage: updateImages));
  }

  _onImageRemoved(_ImageRemoved event, Emitter<AddProductBlocState> emit) {
    final currentState = state as _AddProductBlocState;
    final updateImages = List<Uint8List>.from(currentState.productImage);
    if (event.index >= 0 && event.index < updateImages.length) {
      updateImages.removeAt(event.index);
    }
    emit(currentState.copyWith(productImage: updateImages));
  }

  _onColorChanged(_ColorChanged event, Emitter<AddProductBlocState> emit) {
    final currentState = state as _AddProductBlocState;
    emit(
      currentState.copyWith(
        selectedColor: event.color,
        // ignore: unnecessary_null_comparison
        selectedSizes: event.color == null ? [] : currentState.selectedSizes,
        // ignore: unnecessary_null_comparison
        sizeStockMap: event.color == null ? {} : currentState.sizeStockMap,
      ),
    );
  }

  _onSubmitted(_Submit event, Emitter<AddProductBlocState> emit) async {
    final currentState = state as _AddProductBlocState;
    if (state.productName.isEmpty) {
      emit(currentState.copyWith(isSubmitting: true, errorMessage: null));

      if (currentState.productName.isEmpty) {
        emit(
          currentState.copyWith(
            isSubmitting: false,
            errorMessage: 'Please enter the product name',
          ),
        );
        return;
      }
    }
    if (currentState.selectedBrand == null) {
      emit(
        currentState.copyWith(
          isSubmitting: false,
          errorMessage: 'Please select a brand',
        ),
      );
      return;
    }
    if (currentState.selectedCategory == null) {
      emit(
        currentState.copyWith(
          isSubmitting: false,
          errorMessage: 'Please select a category',
        ),
      );
      return;
    }
    // ignore: unnecessary_null_comparison
    if (currentState.selectedColor == null) {
      emit(
        currentState.copyWith(
          isSubmitting: false,
          errorMessage: 'Please select a color',
        ),
      );
      return;
    }
    if (currentState.selectedSizes.isEmpty) {
      emit(
        currentState.copyWith(
          isSubmitting: false,
          errorMessage: 'Please select at least one size',
        ),
      );
      return;
    }
    if (currentState.sizeStockMap.values.any(
      (stock) => stock == null || stock <= 0,
    )) {
      emit(
        currentState.copyWith(
          isSubmitting: false,
          errorMessage: 'Please enter valid stock for all selected sizes',
        ),
      );
      return;
    }
    if (currentState.price.isEmpty ||
        !RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(currentState.price)) {
      emit(
        currentState.copyWith(
          isSubmitting: false,
          errorMessage: 'Please enter a valid price',
        ),
      );
      return;
    }
    if (currentState.productDescription.isEmpty) {
      emit(
        currentState.copyWith(
          isSubmitting: false,
          errorMessage: 'Please enter a description',
        ),
      );
      return;
    }
    if (currentState.productImage.isEmpty) {
      emit(
        currentState.copyWith(
          isSubmitting: false,
          errorMessage: 'Please upload at least one image',
        ),
      );
      return;
    }
    await Future.delayed(Duration(seconds: 1));

    emit(
      _AddProductBlocState(
        productName: currentState.productName,
        productImage: currentState.productImage,
        price: currentState.price,
        productDescription: currentState.productDescription,
        sizeStockMap: currentState.sizeStockMap,
        selectedCategory: currentState.selectedCategory,
        selectedBrand: currentState.selectedBrand,
        selectedSizes: currentState.selectedSizes,
        availableColors: currentState.availableColors,
        selectedColor: currentState.selectedColor,
        productStock: currentState.productStock,
        availableCategories: currentState.availableCategories,
        availableBrands: currentState.availableBrands,
        availableSize: currentState.availableSize,
        isSubmitting: currentState.isSubmitting,
        isSuccess: currentState.isSuccess,
        errorMessage: currentState.errorMessage,
      ),
    );
  }
  _onReset(_Reset event, Emitter<AddProductBlocState> emit) {
    emit(
      _AddProductBlocState(
        productName: '',
        productImage: [],
        price: '',
        productDescription: '',
        sizeStockMap: {},
        selectedCategory: null,
        selectedBrand: null,
        selectedSizes: [],
        availableColors: [],
        selectedColor: '',
        productStock: '',
        availableCategories: [],
        availableBrands: [],
        availableSize: [],
        isSubmitting: false,
        isSuccess: false,
        errorMessage: '',
      ),
    );
  }
  _onImagesUpdated(
      _ImagesUpdated event, Emitter<AddProductBlocState> emit) {
    final currentState = state as _AddProductBlocState;
    emit(currentState.copyWith(productImage: event.images));
  }
}
