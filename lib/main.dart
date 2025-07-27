import 'package:custom_notification_sound/firebase_options.dart';
import 'package:custom_notification_sound/services/custom_notification_sound_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CustomNotificationSoundService().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Notification Sound',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Custom Notification Sound",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.indigo),
          ),
          onPressed: () {
            CustomNotificationSoundService().showNotification(
              RemoteMessage(
                notification: RemoteNotification(
                  title: "Test Notification",
                  body: "This is a test notification",
                ),
              ),
            );
          },
          child: Text(
            "Send Test Notification",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
