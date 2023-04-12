import 'package:flutter/material.dart';

class GalleryItem extends StatelessWidget {
  final String image;
  GalleryItem(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 60, 59, 59),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
          BoxShadow(
            offset: Offset(-5, 0),
            color: Colors.transparent,
          ),
          BoxShadow(
            offset: Offset(5, 0),
            color: Colors.transparent,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
