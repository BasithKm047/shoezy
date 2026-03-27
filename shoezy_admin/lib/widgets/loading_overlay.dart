import 'package:flutter/material.dart';

class LoadingOverlay {
  static OverlayEntry? _entry;


  static void show(BuildContext context,String title) {
    hide();

    _entry = OverlayEntry(
      builder: (context) {
        return Material(
          // ignore: deprecated_member_use
          color: Colors.black.withOpacity(0.3),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(color: Colors.blue),
                  SizedBox(height: 16),
                  Text(
                    '$title.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_entry!);
  }

  static void hide() {
    _entry?.remove();
    _entry = null;
  }
}