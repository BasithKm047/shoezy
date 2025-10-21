import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class CostumImageUploader extends StatelessWidget {
  final List<Uint8List>? images; 
  final Function(List<Uint8List>)? onImagesChanged; 
  final Function(int index)? onImageRemoved;

  final dynamic image;
  final Function(Uint8List)? onImageSelected;
  final VoidCallback? onSingleImageRemoved;

  final bool singleMode;
   bool updateimage;
  final Bloc? blocofImage;

  CostumImageUploader({
    super.key,
    this.images,
    this.onImagesChanged,
    this.onImageRemoved,
    this.image,
    this.onImageSelected,
    this.onSingleImageRemoved,
    this.singleMode = false,
    this.updateimage = false,
    this.blocofImage,
  });

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImages() async {
    updateimage=false;
    try {
      if (singleMode) {
        final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          Uint8List bytes = await pickedFile.readAsBytes();
          onImageSelected?.call(bytes);
        }
      } else {
        final List<XFile> pickedFiles = await _picker.pickMultiImage();
        final List<Uint8List> newImages = [];
        for (XFile xfile in pickedFiles) {
          Uint8List bytes = await xfile.readAsBytes();
          newImages.add(bytes);
        }
        onImagesChanged?.call([...images ?? [], ...newImages]); // 🔹 CHANGE
      }
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  Widget _buildImage(dynamic img) {
    if (img is Uint8List) {
      return Image.memory(
        img,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Text('Error Loading Image'),
      );
    } else if (img is String) {
      return Image.network(
        img,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Text('Error Loading Image'),
      );
    }
    return const Text('Unsupported image type');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   singleMode ? 'Example Image' : 'Example Images',
        //   style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        // ),
        const SizedBox(height: 12),

        // --- SINGLE MODE ---
        if (singleMode)
          image == null
              ? const Text('No image selected')
              : SizedBox(
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        _buildImage(image), // 🔹 CHANGE
                        Positioned(
                          top: 5,
                          right: 5,
                          child: IconButton(
                            icon: const Icon(Icons.remove_circle, color: Colors.red),
                            onPressed: onSingleImageRemoved,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

        // --- MULTIPLE MODE ---
        if (!singleMode)
          images == null || images!.isEmpty
              ? const Text('No images selected')
              : SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: images!.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 200,
                          color: Colors.grey[200],
                          child: Stack(
                            children: [
                              _buildImage(images![index]), // 🔹 CHANGE
                              Positioned(
                                top: 5,
                                right: 5,
                                child: IconButton(
                                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                                  onPressed: () {
                                    onImageRemoved?.call(index);
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
                const Icon(Icons.upload_file, size: 30, color: Colors.black),
                const SizedBox(height: 10),
                Text(
                  singleMode ? 'Upload Image' : 'Upload Images',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  singleMode
                      ? 'Click to select an image'
                      : 'Drag and drop images here, or click to browse',
                  style: const TextStyle(color: Colors.black),
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
