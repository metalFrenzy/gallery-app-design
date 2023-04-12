import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gallery_app/firebase_options.dart';
import 'package:provider/provider.dart';

import './screens/gallery_overview_screen.dart';
import './screens/auth_screen.dart';
import './providers/image_provder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ImageProv(),
        ),
      ],
      child: MaterialApp(
        title: 'Gallery App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                fontFamily: 'Lato',
                fontSize: 36,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
              headline2: const TextStyle(
                fontFamily: 'Lato',
                fontSize: 24,
                color: Colors.black54,
              )),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GalleryOverview();
            }
            return AuthScreen();
          },
        ),
      ),
    );
  }
}
