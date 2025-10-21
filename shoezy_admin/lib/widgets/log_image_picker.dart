import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LogoPicker extends StatelessWidget {
  final dynamic logo; // can be Uint8List (local) or String (URL)
  final Function(Uint8List image) onLogoSelected;
  final VoidCallback onLogoRemoved;

  const LogoPicker({
    super.key,
    required this.logo,
    required this.onLogoSelected,
    required this.onLogoRemoved,
  });

  Future<void> _pickLogo() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final Uint8List bytes = await pickedFile.readAsBytes();
        onLogoSelected(bytes);
      }
    } catch (e) {
      print('Error picking logo: $e');
    }
  }

  Widget _buildImage(dynamic img) {
    if (img is Uint8List) {
      return Image.memory(
        img,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Center(child: Text('Error Loading Logo')),
      );
    } else if (img is String) {
      return Image.network(
        img,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Center(child: Text('Error Loading Logo')),
      );
    } else {
      return const Center(child: Text('No Logo Selected'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Brand Logo',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // --- Logo Preview (smaller size) ---
          if (logo != null)
            SizedBox(
              height: 120,
              width: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Positioned.fill(child: _buildImage(logo)),
                    FittedBox(
                      fit: BoxFit.cover,
                      
                    
                      child: IconButton(
                        icon: const Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: onLogoRemoved,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            const Text('No logo selected'),

          const SizedBox(height: 20),

          // --- Upload Button (instead of InkWell container) ---
          SizedBox(
            width: screenWidth,
            height: 55,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _pickLogo,
              icon: const Icon(Icons.upload_file, color: Colors.white),
              label: const Text(
                'Upload Logo',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),
          const Text(
            'Click to select a brand logo from gallery',
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
