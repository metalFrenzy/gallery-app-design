import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  Widget Button(String text, Color color, BuildContext context, String image) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            child: Image(
              image: AssetImage(image),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // should function to access device gallery or camera using image picker package
            Navigator.of(context).pop();
          },
          child: Button(
            'Gallery',
            Color.fromARGB(255, 236, 199, 242),
            context,
            'assets/images/attach.png',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            // should function to access device gallery or camera using image picker package
            Navigator.of(context).pop();
          },
          child: Button(
            'Camera',
            Color.fromARGB(255, 166, 235, 235),
            context,
            'assets/images/camera.png',
          ),
        ),
      ],
    );
  }
}
