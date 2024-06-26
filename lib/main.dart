import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mprapp/screens/splash/splashscreen.dart';
import 'package:mprapp/services/notificationservices.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotiServices.localNotificationInit();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  FirebaseMessaging.onMessage.listen((message) {
    print(message.notification!.body);
    NotiServices.showNotification(message);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crimson Royale',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.brown.shade100,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.brown.shade100,
          foregroundColor: Colors.white
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
        ),
      ),
      home: SplashScreen()
    );
  }
}