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

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              StreamProvider<User?>.value(
                  value: AuthService().userAuthState,
                  initialData: FirebaseAuth.instance.currentUser),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme:
                  ThemeData(fontFamily: "Nunito", brightness: Brightness.light),
              home: SplashScreen(),
              routes: {
                '/splash': (context) => SplashScreen(),
                '/login': (context) => LoginScreen(),
                '/signup': (context) => SignUpScreen(),
                '/home': (context) => HomeScreen(),
              },
            ),
          );
        }
        return SplashScreen();
      },
    );
  }
}
