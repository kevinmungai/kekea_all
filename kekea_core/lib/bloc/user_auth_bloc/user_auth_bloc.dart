import 'dart:async';

import '../../data/google_sign_in_result/google_sign_in_result.dart';
import 'user_auth_event.dart';
import '../../data/user_result/user_result.dart';
import '../../data/kekea_user/kekea_user.dart';
import '../../side_effects/auth/fire/auth_fire.dart';

import './bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  final AuthFire authFire;

  StreamSubscription<UserResult> _streamSubscription;
  UserAuthBloc({
    @required this.authFire,
  })  : assert(authFire != null),
        super(UserAuthState.absent());

  @override
  Stream<UserAuthState> mapEventToState(
    UserAuthEvent event,
  ) async* {
    yield* event.when(
      listen: () async* {
        _streamSubscription?.cancel();
        _streamSubscription =
            authFire.streamUserResult().listen((UserResult userResult) {
          userResult.when(
            kekeaUser: (KekeaUser kekeaUser) => add(
              UserAuthEvent.setPresent(
                kekeaUser: kekeaUser,
              ),
            ),
            absent: () => add(
              UserAuthEvent.setAbsent(),
            ),
          );
        });
      },
      signInViaGoogle: () async* {
        final GoogleSignInResult googleSignInResult =
            await authFire.signInViaGoogle();
      },
      signOut: () async* {
        await authFire.signOut();
      },
      setPresent: (KekeaUser kekeaUser) async* {
        yield UserAuthState.present(kekeaUser: kekeaUser);
      },
      setAbsent: () async* {
        yield UserAuthState.absent();
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
