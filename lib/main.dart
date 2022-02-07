import 'package:flutter/material.dart';
import "package:flutter/services.dart";

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gide/constants/route_constants.dart';
import 'package:gide/router/route_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(const MyApp());
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

    return const MaterialApp(
      title: 'Gide',
      initialRoute: homeViewRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
