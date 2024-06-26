import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happyplant/view/welcome_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(
  );
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'key',
        projectId: 'myapp', appId: 'appid', messagingSenderId: 'zunera@adil',
      )
  );
  runApp(const HappyPlant());
}

class HappyPlant extends StatelessWidget {
  const HappyPlant({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(200, 844),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.white
          ),
        ),
        home: const WelcomePageView(),
      ),
    );
  }
}
