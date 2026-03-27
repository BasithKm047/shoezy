import 'package:flutter/material.dart';

class NewWidget extends StatefulWidget {
  const NewWidget({super.key});

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
 int i=0;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _controller.addListener(() {
      setState(() {
        i++;
      });
    });
    _controller.forward();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(_controller),
          child: Text(
            'Hello, World! $i',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}