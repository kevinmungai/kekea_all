import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import '../../../data/google_sign_in_result/google_sign_in_result.dart';
import '../../../data/kekea_user/kekea_user.dart';
import '../../../data/user_result/user_result.dart';
import '../../../data/auth_result/auth_result.dart';
import '../../../data/sign_in_result/sign_in_result.dart';
import '../../../data/sign_out_result/sign_out_result.dart';

class AuthFire {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  const AuthFire({
    @required this.firebaseAuth,
    @required this.googleSignIn,
  }) : assert(firebaseAuth != null && googleSignIn != null);

  Stream<AuthResult> streamUser() {
    return firebaseAuth.authStateChanges().map(
          (User user) =>
              user != null ? AuthResult.present(user) : AuthResult.absent(),
        );
  }

  Future<SignInResult> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await GoogleSignIn().signIn();

    if (googleSignInAccount == null) {
      return SignInResult.abortedGoogleSignIn();
    } else {
      try {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final GoogleAuthCredential googleAuthCredential =
            GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await firebaseAuth.signInWithCredential(
            googleAuthCredential,
          );

          return SignInResult.success(
            userCredential: userCredential,
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == "account-exists-with-different-credential") {
            return SignInResult.accountExistsWithDifferentCredential();
          } else if (e.code == "invalid-credential") {
            return SignInResult.invalidCredential();
          } else if (e.code == "operation-not-allowed") {
            return SignInResult.operationNotAllowed();
          } else if (e.code == "user-disabled") {
            return SignInResult.userDisabled();
          } else if (e.code == "user-not-found") {
            return SignInResult.userNotFound();
          } else if (e.code == "wrong-password") {
            return SignInResult.wrongPassword();
          } else if (e.code == "invalid-verification-code") {
            return SignInResult.invalidVerificationCode();
          } else if (e.code == "invalid-verification-id") {
            return SignInResult.invalidVerificationId();
          } else {
            return SignInResult.unknownError();
          }
        } catch (e) {
          return SignInResult.unknownError();
        }
      } on PlatformException catch (e) {
        if (e.code == GoogleSignInAccount.kFailedToRecoverAuthError) {
          return SignInResult.failedToRecoverAuthError();
        } else if (e.code == GoogleSignInAccount.kUserRecoverableAuthError) {
          return SignInResult.userRecoverableAuthError();
        } else {
          return SignInResult.unknownError();
        }
      } catch (e) {
        return SignInResult.unknownError();
      }
    }
  }

  Future<SignOutResult> signOutFirebase() async {
    try {
      await firebaseAuth.signOut();
      return SignOutResult.success();
    } catch (e) {
      return SignOutResult.failure();
    }
  }

  Stream<UserResult> streamUserResult() {
    return firebaseAuth.authStateChanges().map((User user) {
      if (user != null) {
        return UserResult.kekeaUser(
          kekeaUser: KekeaUser(
            id: user.uid,
            displayName: user.displayName,
            email: user.email,
            phoneNumber: user.phoneNumber,
            photoUrl: user.photoURL,
          ),
        );
      }

      return UserResult.absent();
    });
  }

  Future<GoogleSignInResult> signInViaGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      try {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final GoogleAuthCredential googleAuthCredential =
            GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await firebaseAuth.signInWithCredential(
          googleAuthCredential,
        );
        return GoogleSignInResult.success(
          kekeaUser: KekeaUser(
            id: userCredential.user.uid,
            displayName: userCredential.user.displayName,
            email: userCredential.user.email,
            phoneNumber: userCredential.user.phoneNumber,
            photoUrl: userCredential.user.photoURL,
          ),
        );
      } catch (e) {
        return GoogleSignInResult.failure();
      }
    }
    return GoogleSignInResult.failure();
  }

  Future<Null> signOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }
}
