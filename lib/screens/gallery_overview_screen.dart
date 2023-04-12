import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../widgets/dialog_buttons.dart';
import '../widgets/gallery_grid.dart';
import '../widgets/glass_box.dart';

import '../widgets/icon.dart';

class GalleryOverview extends StatelessWidget {
  final Dialog errorDialog = Dialog(
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: GlassBox(
      width: 200.0,
      height: 200.0,
      child: DialogButton(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/gradient1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 25,
                      top: 25,
                      bottom: 10,
                      right: 10,
                    ),
                    child: Text(
                      'Welcome\n metalFrenzy',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 25,
                      top: 25,
                      left: 10,
                      bottom: 10,
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        'assets/images/dead.jpg',
                      ),
                    ),
                  ),
                ],
              ),
              //row of the 2 icon buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Icon Row
                  GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: IconRow(
                      text: 'Log out',
                      image: 'assets/images/left-arrow.png',
                      gradColors: [
                        Color.fromARGB(255, 243, 74, 62),
                        Color.fromARGB(255, 246, 9, 9),
                      ],
                      color: Color.fromARGB(255, 247, 78, 66),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => errorDialog,
                      );
                    },
                    child: IconRow(
                      text: 'Upload',
                      image: 'assets/images/up-arrow.png',
                      gradColors: [
                        Color.fromARGB(255, 255, 193, 7),
                        Color.fromARGB(255, 247, 200, 60)
                      ],
                      color: Color.fromARGB(255, 250, 191, 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: GalleryGrid(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
