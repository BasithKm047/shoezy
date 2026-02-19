import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/bloc/favourite/cubit/favourie_cubit.dart';

class Commonfunctions {
  static String? usernameValidator(String? value) {
    try {
      if (value == null || value.trim().isEmpty) {
        return 'Please Enter username';
      } else if (value.length < 3) {
        return 'username should be morethan 3 character';
      } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
        return 'Username can only contain letters and numbers';
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static String? emailValidator(String? value) {
    try {
      if (value == null ||value.trim().isEmpty) {
        return 'Please enter an email address';
      } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value.trim()))  {
        return 'Please enter a valid email address';
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password should be at least 6 characters';
    }
    final pattern = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).+$',
    );
    if (!pattern.hasMatch(value)) {
      return 'Password must contain uppercase, lowercase, number, and special character';
    }
    return null;
  }

  static Widget productImage(ProductModel product) {
  if (product.variants.isEmpty) {
    return const Center(
      child: Icon(Icons.image_not_supported, size: 42, color: Colors.grey),
    );
  }

  final variant = product.variants.first;

  if (variant.images.isEmpty) {
    return const Center(
      child: Icon(Icons.image_not_supported, size: 42, color: Colors.grey),
    );
  }

  return ClipRRect(
    borderRadius:  BorderRadius.circular(12),
    child: Image.network(
      variant.images.first,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => const Center(
        child: Icon(Icons.image_not_supported, size: 42),
      ),
    ),
  );
  }

  static bool hasTag(ProductModel product, String tag) {
    return product.tag.contains(tag);
  }

  /// -------- FAVOURITES HELPERS (REUSABLE) --------

  /// Whether the given product is currently in favourites.
  static bool isFavorite(BuildContext context, ProductModel product) {
    if (product.id == null) return false;
    return context.select<FavoritesCubit, bool>(
      (cubit) => cubit.isFavorite(product.id!),
    );
  }

  /// Toggle favourite state for a product.
  static void toggleFavorite(BuildContext context, ProductModel product) {
    if (product.id == null) return;
    context.read<FavoritesCubit>().toggleFavorite(product.id!);
  }
}
