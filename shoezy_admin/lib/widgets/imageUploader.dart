import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';

class CostumImageUploader extends StatelessWidget {
  final List<Uint8List> images;
  final Function(List<Uint8List>) onImagesChanged;
  final Function onImageRemoved;

   CostumImageUploader({
    super.key,
    required this.images,
    required this.onImagesChanged,
    required  this.onImageRemoved
  });

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImages() async {
    try {
      final List<XFile> pickedFiles = await _picker.pickMultiImage(
        // maxWidth: 800,
        // maxHeight: 800,
        // imageQuality: 80,
      );
      final List<Uint8List> newImages = [];
      for (XFile xfile in pickedFiles) {
        Uint8List bytes = await xfile.readAsBytes();
        newImages.add(bytes);
      }
      print('Picked ${newImages.length} images'); // Debug print
      onImagesChanged([...images, ...newImages]);
        } catch (e) {
      print('Error picking images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Example Images',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        images.isEmpty
            ? Text('No images selected')
        :SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount:  images.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  // width: screenWidth /7,
                  height: 200,
                  color: Colors.grey[200],
                  child: Stack(
                    children: [
                      Image.memory(
                        images[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Text('Error Loading Image');
                        },
                      ),
                      Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () {
                    onImageRemoved(index);
                  },
                ),
              ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: screenWidth,
          height: 160,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
            color: Colors.white,
          ),
          child: InkWell(
            onTap: _pickImages,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.upload_file, size: 30, color: Colors.black),
                const SizedBox(height: 10),
                const Text(
                  'Upload Images',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'Drag and drop images here, or click to browse',
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
