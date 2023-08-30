import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class ImageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String imagePath;
  final double width;
  final double height;

  const ImageButton({
    super.key,
    required this.onPressed,
    required this.imagePath,
    this.width = 60.0,
    this.height = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    return GrockContainer(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
