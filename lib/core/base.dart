import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gide/screens/auth/bloc/auth_bloc.dart';
import 'package:gide/screens/auth/page/login_page.dart';
import 'package:gide/screens/home/home.dart';

class Base extends StatefulWidget {
  const Base({ Key? key }) : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        print("auth changes");
        
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong..."));
        } else if (snapshot.hasData) {
          context.read<AuthBloc>().add(LoadAuth());
          return const Home();
        }

        return const LoginPage();
      },
    );
  }
}