import 'package:flutter/material.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/screens/product_details_screen.dart';
import 'package:shoezy/utils/const/commonFunctions.dart';
import 'package:shoezy/utils/const/navigation_styles.dart';



/// Simple Product model

class ProductCardHorizontal extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onAdd;
  final double width;
  final double height;

  const ProductCardHorizontal({
    super.key,
    required this.product,
    this.onAdd,
    this.width = 180,
    this.height = 250,
  });

  @override
  Widget build(BuildContext context) {
    final radius = 18.0;
    return SizedBox(
      width: width,
      height: height,
      child: GestureDetector(
        onTap: () {
          NavigationStyles.fade(
            context,
            ProductDetailsScreen(product: product,),
          );
        },
        child: Card(
          color: Colors.white,
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Content column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius),
                        topRight: Radius.circular(radius),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // Use Image.network so the path you provided (e.g. /mnt/data/...) will be handled upstream
                           Commonfunctions.productImage(product),
        
                          // Soft gradient overlay at bottom of image for legibility
                          // Positioned(
                          //   bottom: 0,
                          //   left: 0,
                          //   right: 0,
                          //   height: 60,
                          //   child: DecoratedBox(
                          //     decoration: BoxDecoration(
                          //       gradient: LinearGradient(
                          //         begin: Alignment.topCenter,
                          //         end: Alignment.bottomCenter,
                          //         colors: [Colors.transparent, Colors.black.withOpacity(0.35)],
                          //       ),
                          //     ),
                          //   ),
                          // ),
        
                          // optional small top-left badge (subtle)
                          if ((product.tag).isNotEmpty)
                            Positioned(
                              left: 10,
                              top: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
                                ),
                                child: Text(
                                  product.tag[0].toUpperCase(),
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.blue.shade700),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
        
                  // Lower area: product title & price
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // little spacer to visually separate from the image
                          const SizedBox(height: 2),
                          // Title
                          Text(
                            product.productName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 6),
                          // Price row
                          Row(
                            children: [
                              Text(
                                '\$${product.price}',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.grey[800]),
                              ),
                              const Spacer(),
                              // small hint text or rating spot (optional)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        
              // Downward tag centered near the image bottom (points downward towards title)
              // Positioned(
              //   left: 0,
              //   right: 0,
              //   top: (height * 0.45) - 10, // slightly overlapping image lower area
              //   child: Center(
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         // Tag body
              //         Container(
              //           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              //           decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(12),
              //             boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
              //           ),
              //           child: Row(
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               Text(
              //                 'NEW',
              //                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Colors.blue.shade600),
              //               ),
              //               const SizedBox(width: 8),
              //               Text(
              //                 product.tag.toUpperCase(),
              //                 style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.grey[700]),
              //               ),
              //             ],
              //           ),
              //         ),
              //         // Downward triangle pointer
              //         CustomPaint(
              //           painter: _TrianglePainter(),
              //           size: const Size(18, 10),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
        
              // Add (plus) button bottom-right (curved)
              Positioned(
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: onAdd,
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade600,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomRight: Radius.circular(16),
                      ),
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3))],
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Small triangle painter used for the downward tag pointer
class TrianglePainter extends CustomPainter {
  final Paint _p = Paint()..style = PaintingStyle.fill..color = Colors.white;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.close();
    // Add subtle shadow by drawing slightly offset grey path behind
    final shadow = Paint()..color = Colors.black12..maskFilter = MaskFilter.blur(BlurStyle.normal, 4);
    canvas.save();
    canvas.translate(0, 2); // offset shadow
    canvas.drawPath(path, shadow);
    canvas.restore();
    canvas.drawPath(path, _p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
