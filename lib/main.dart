import 'package:flutter/material.dart';
import "package:flutter/services.dart";

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gide/screens/auth/bloc/auth_bloc.dart';
import 'package:gide/core/constants/colors_constants.dart';
import 'package:gide/core/constants/route_constants.dart';
import 'package:gide/router/route_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/.env");

  /*
  final firebaseAPIKey = dotenv.env['FIREBASE_API_KEY'];
  final firebaseAppId = dotenv.env['FIREBASE_APP_ID'];
  final firebaseMessagingSenderId = dotenv.env['FIREBASE_MESSAGING_SENDER_ID'];
  */

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(LoadAuth()))
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Gide',
      initialRoute: homeViewRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
      darkTheme: ThemeData(scaffoldBackgroundColor: mainBackgroundColor),
    );
  }
}
