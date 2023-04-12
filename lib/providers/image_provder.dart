import 'package:flutter/material.dart';

import '../models/image_model.dart';

class ImageProv with ChangeNotifier {
  List<ImageModel> _gallery = [
    ImageModel(
      'assets/images/Cali.jpg',
      1,
    ),
    ImageModel(
      'assets/images/Canada.jpg',
      2,
    ),
    ImageModel(
      'assets/images/deadpool.jpg',
      3,
    ),
    ImageModel(
      'assets/images/ezio.jpg',
      4,
    ),
    ImageModel(
      'assets/images/image1.jpg',
      5,
    ),
    ImageModel(
      'assets/images/image2.jpg',
      6,
    ),
    ImageModel(
      'assets/images/last.jpg',
      7,
    ),
    ImageModel(
      'assets/images/santa monica.jpg',
      8,
    ),
    ImageModel(
      'assets/images/stones.jpg',
      9,
    ),
    ImageModel(
      'assets/images/syndicate.jpg',
      10,
    ),
    ImageModel(
      'assets/images/tokyo.jpg',
      11,
    ),
    ImageModel(
      'assets/images/sons.jpg',
      12,
    ),
  ];

  List<ImageModel> get gallery {
    return [..._gallery];
  }
}
