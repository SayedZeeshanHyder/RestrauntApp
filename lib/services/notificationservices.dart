import 'dart:convert';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as https;

import '../apivariables.dart';

class NotiServices
{
  static final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final messaging = FirebaseMessaging.instance;

  static notificationApiCall(String username)
  async{
    try{
      final token = await messaging.getToken();
      final body = jsonEncode({
        "deviceToken":token,
        "message":"Your Account has been Successfully Created.",
        "title":"Congratulations $username !"
      });
      await https.post(Uri.parse(ApiVariables.notificationApi),headers: ApiVariables.headers,body: body);

    }catch(e){
      print("Error in Notification Api");
      print(e.toString());
    }
  }

  static localNotificationInit()
  async{

    var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static showNotification(RemoteMessage message)
  {

    AndroidNotificationChannel androidNotificationChannel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        "High Importance Notification",
        importance: Importance.max
    );


    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        androidNotificationChannel.id,
        androidNotificationChannel.name,
        channelDescription: "This is Channel Description",
        importance: Importance.high,
        priority: Priority.high,
        ticker: "ticker"
    );

    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

    Future.delayed(Duration.zero, ()=>{
      flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title,
          message.notification!.body,
          notificationDetails)
    });
  }

}