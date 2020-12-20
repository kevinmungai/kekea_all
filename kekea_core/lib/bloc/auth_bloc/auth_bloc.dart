import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../business_person_status_bloc/bloc.dart';
import '../../side_effects/auth/fire/auth_fire.dart';
import '../../data/auth_result/auth_result.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthFire authFire;
  final BusinessPersonStatusBloc businessPersonStatusBloc;

  StreamSubscription<AuthResult> _authResultSubscription;

  AuthBloc({
    @required this.authFire,
    @required this.businessPersonStatusBloc,
  })  : assert(authFire != null && businessPersonStatusBloc != null),
        super(AuthState.absent());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield* event.when(
      listenToAuthChanges: () async* {
        _authResultSubscription?.cancel();
        _authResultSubscription = authFire.streamUser().listen(
          (AuthResult authResult) {
            authResult.when(
              present: (User user) {
                add(AuthEvent.setPresent(user));
              },
              absent: () {
                add(AuthEvent.setAbsent());
              },
            );
          },
          onError: (error) {
            add(AuthEvent.setError());
          },
        );
      },
      setAbsent: () async* {
        yield AuthState.absent();
        businessPersonStatusBloc.add(BusinessPersonStatusEvent.stopListening());
      },
      setPresent: (User user) async* {
        yield AuthState.present(user);
        businessPersonStatusBloc.add(
          BusinessPersonStatusEvent.listenToChanges(firebaseId: user.uid),
        );
      },
      setError: () async* {
        yield* state.when(
          present: (User user) async* {
            yield AuthState.present(user);
          },
          absent: () async* {
            yield AuthState.absent();
          },
        );
      },
    );
  }

  @override
  Future<void> close() {
    _authResultSubscription?.cancel();
    return super.close();
  }

  @override
  void onEvent(AuthEvent event) {
    print(event);
    super.onEvent(event);
  }
}
