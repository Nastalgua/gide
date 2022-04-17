import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gide/core/models/user_model.dart' as self_module;
import 'package:gide/core/services/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart' as google_module;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final googleSignIn = google_module.GoogleSignIn();

  AuthBloc() : super(AuthInitial()) {
    /*
    on<LoadAuth>((event, emit) {
      // TODO: check if user is already logged in
      print(FirebaseAuth.instance.currentUser);
      if (FirebaseAuth.instance.currentUser != null) {
        User resUser = FirebaseAuth.instance.currentUser!;
        self_module.User user = self_module.User(
            id: resUser.uid,
            fullName: resUser.displayName!,
            username: resUser.displayName! // TODO: this needs to change
            );

        emit(AuthConfirmed(user: user));
      }
    });
    */

    on<LoadAuth>((event, emit) async {
      // TODO: check if user is already logged in
      // await FirebaseAuth.instance.authStateChanges
      User? resUser = AuthenticationService.getCurrentUser();

      print(resUser);

      if (resUser != null) {
        self_module.User user = self_module.User(
          id: resUser.uid,
          fullName: resUser.displayName!,
          username: resUser.displayName! // TODO: this needs to change
        );

        emit(AuthConfirmed(user: user));
      }
    });

    on<LoginUser>((event, emit) async {
      if (state is AuthConfirmed) return;
      // print("${event.username} ${event.password}");
    });

    on<GoogleLoginUser>((event, emit) async {
      if (state is AuthConfirmed) return;

      User? res = await AuthenticationService.loginWithGoogle();
      if (res == null) return;

      // TODO: Update global user data
      self_module.User user = self_module.User(
        id: res.uid, fullName: res.displayName!, username: res.displayName! // TODO: this needs to change
      );

      /*
      if (res.additionalUserInfo!.isNewUser) {} // new user code
      */

      emit(AuthConfirmed(user: user));

      // SelfModule.User user = SelfModule.User(id: res.additionalUserInfo, name: name)
    });
  }
}
