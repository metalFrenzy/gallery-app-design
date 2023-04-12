import 'package:flutter/material.dart';

class IconRow extends StatelessWidget {
  final String text;
  final String image;
  final List<Color> gradColors;
  final Color color;

  const IconRow({
    required this.text,
    required this.image,
    required this.gradColors,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.78),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: gradColors,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: color
                  )
                ]),
            child: Image.asset(
              image,
              height: 15,
              width: 15,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Lato',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
