import 'package:flutter/material.dart';

class ImageDetailScreen1 extends StatelessWidget {
  final String imagePath;
  final String description;

  const ImageDetailScreen1({super.key, required this.imagePath, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Details'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(imagePath),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
