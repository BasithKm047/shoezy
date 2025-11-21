import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';
import 'package:shoezy/utils/const/colors.dart';

class AnimationLoading {
  static Widget buildShimmerGrid({
    required int itemCount,
    required double mainAxisExtent,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final crossAxisCount = screenWidth < 600 ? 2 : screenWidth < 900 ? 3 : 4;
        final spacing = screenWidth < 600 ? 8.0 : 12.0;
        final itemHeight = screenWidth < 600 ? 250.0 : 280.0;
        
        return GridView.builder(
          itemCount: itemCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisExtent: itemHeight,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
          ),
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            );
          },
        );
      },
    );
  }

  static Widget shimmerCarousel(double screenWidth) => LayoutBuilder(
    builder: (context, constraints) {
      final responsiveWidth = constraints.maxWidth;
      final carouselHeight = responsiveWidth < 600 ? 150.0 : 170.0;
      final itemHeight = responsiveWidth < 600 ? 100.0 : 110.0;
      final viewportFraction = responsiveWidth < 600 ? 0.85 : 0.9;
      
      return CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (context, index, realIndex) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: responsiveWidth * viewportFraction,
              height: itemHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: carouselHeight,
          enlargeCenterPage: true,
          viewportFraction: viewportFraction,
        ),
      );
    },
  );

  static Widget shimmerImagePlaceholder({
    required double height,
    required double width,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  static Widget shimmerCircular({required double size}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      ),
    );
  }

  static Widget shimmerHorizontalGrid({required int itemCount}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final itemWidth = screenWidth < 600 ? 120.0 : 150.0;
        final itemHeight = screenWidth < 600 ? 120.0 : 140.0;
        final containerHeight = screenWidth < 600 ? 250.0 : 300.0;
        final spacing = screenWidth < 600 ? 8.0 : 10.0;
        
        return SizedBox(
          height: containerHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: (itemCount / 3).ceil(), // group shimmer into columns of 3
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: spacing),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Column(
                    children: List.generate(3, (i) {
                      return Container(
                        margin: EdgeInsets.only(bottom: spacing),
                        width: itemWidth,
                        height: itemHeight,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      );
                    }),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  static Widget shimmerTagGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final horizontalPadding = screenWidth < 600 ? 12.0 : 16.0;
        final height = screenWidth < 600 ? 200.0 : 250.0;
        final spacing = screenWidth < 600 ? 8.0 : 10.0;
        
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: SizedBox(
              height: height,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  SizedBox(width: spacing),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        SizedBox(height: spacing),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static SpinKitFadingCircle spinnerAnimation() =>
      SpinKitFadingCircle(color: AppColors.blue, size: 50.0,
      );

  static Widget isEmptyField({
    String? message,
    String? lottieAsset,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final lottieSize = screenWidth < 600 ? 150.0 : 200.0;
        final fontSize = screenWidth < 600 ? 14.0 : 16.0;
        final spacing = screenWidth < 600 ? 12.0 : 16.0;
        
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  lottieAsset ?? 'asset/No Data.json',
                  width: lottieSize,
                  height: lottieSize,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: spacing),
                Text(
                  message ?? 'No data available',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget emptyBoxField({
    String? message,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final lottieSize = screenWidth < 600 ? 150.0 : 200.0;
        final fontSize = screenWidth < 600 ? 14.0 : 16.0;
        final spacing = screenWidth < 600 ? 12.0 : 16.0;
        
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'asset/empty-box_2.json',
                  width: lottieSize,
                  height: lottieSize,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: spacing),
                Text(
                  message ?? 'No items found',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget boxEmptyField({
    String? message,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final lottieSize = screenWidth < 600 ? 150.0 : 200.0;
        final fontSize = screenWidth < 600 ? 14.0 : 16.0;
        final spacing = screenWidth < 600 ? 12.0 : 16.0;
        
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'asset/empty-box_2.json',
                  width: lottieSize,
                  height: lottieSize,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: spacing),
                Text(
                  message ?? 'Nothing here yet',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
