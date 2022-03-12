import 'package:flutter/material.dart';
import 'package:simple_chat_application/module/auth/screens/splash_screen.dart';

import 'utils/shared_objects.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedObjects.prefs = await CachedSharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}
