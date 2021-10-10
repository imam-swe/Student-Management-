import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:i_school/screens/splash.dart';
import 'package:i_school/screens/homepage.dart';
import 'package:flutter/services.dart';
//import 'package:i_school/screens/studentScreens/student_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.orange,
            ),
            home: const MyHomePage(title: 'Student Management System'),
            // home:  const Student_Information(type, email),
          );
        }
      },
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
