import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/login.dart';
import 'package:latihan_firebase/register.dart';
import 'firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    final auth = Firebase_service();
    return StreamBuilder(
        stream: auth.streamAuthStatus(),
        builder: (context, snapshot) {
          print(snapshot.data);
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: snapshot.data != null ? const MyHomePage() : Login(),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final auth = Firebase_service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dahsboard"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            auth.logout(context);
          },
          child: Text("logout"),
        ),
      ),
    );
  }
}
