import 'package:flutter/material.dart';

class ImageDetailScreen2 extends StatelessWidget {
  final String imagePath;

  const ImageDetailScreen2({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Detail 2'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
