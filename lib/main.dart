import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gratitude/screens/auth/getstarted.dart';
import 'package:gratitude/screens/auth/login.dart';
import 'package:gratitude/screens/auth/signup.dart';
import 'package:gratitude/screens/home/home.dart';
import 'package:gratitude/screens/splash.dart';
import 'package:gratitude/services/auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>.value(
            value: AuthService().userAuthState,
            initialData: FirebaseAuth.instance.currentUser),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Nunito", brightness: Brightness.light),
        routes: {
          '/': (context) => SplashScreen(),
          '/started': (context) => GettingStartedScreen(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignUpScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
