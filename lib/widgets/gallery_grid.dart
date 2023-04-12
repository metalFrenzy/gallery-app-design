import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/image_provder.dart';
import './gallery_grid_item.dart';

class GalleryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gallery = Provider.of<ImageProv>(context).gallery;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => GalleryItem(gallery[index].image),
      itemCount: gallery.length,
    );
  }
}
