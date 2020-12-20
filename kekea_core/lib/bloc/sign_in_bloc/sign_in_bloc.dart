import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../side_effects/auth/fire/auth_fire.dart';
import '../../data/sign_in_result/sign_in_result.dart';
import '../../data/sign_out_result/sign_out_result.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthFire authFire;
  SignInBloc({
    @required this.authFire,
  })  : assert(authFire != null),
        super(SignInState.signedOut());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    yield* event.when(
      signIn: () async* {
        final SignInResult signInResult = await authFire.signInWithGoogle();

        yield* signInResult.maybeWhen(
          success: (UserCredential userCredential) async* {
            yield SignInState.signedIn(userCredential);
          },
          orElse: () async* {
            SignInState.error();
          },
        );
      },
      signOut: () async* {
        final SignOutResult signOutResult = await authFire.signOutFirebase();
        yield* signOutResult.when(
          success: () async* {
            yield SignInState.signedOut();
          },

          /// TODO: FIND A WAY TO FIX THIS
          failure: () async* {
            yield SignInState.signedOut();
          },
        );
      },
    );
  }
}
