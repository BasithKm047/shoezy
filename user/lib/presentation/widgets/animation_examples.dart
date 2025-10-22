
import 'package:flutter/material.dart';

class FallingFieldsPage extends StatefulWidget {
  const FallingFieldsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  FallingFieldsPageState createState() => FallingFieldsPageState();
}

class FallingFieldsPageState extends State<FallingFieldsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    // Step 1: Create controller
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Step 2: Define falling movement
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, -1), // start above the screen
      end: Offset(0, 0),    // final position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut, // smooth + natural fall
    ));

    // Step 3: Start animation automatically
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Falling Fields Animation")),
      body: Center(
        child: SlideTransition(
          position: _offsetAnimation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField("Username"),
              SizedBox(height: 16),
              _buildTextField("Password"),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return SizedBox(
      width: 250,
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}