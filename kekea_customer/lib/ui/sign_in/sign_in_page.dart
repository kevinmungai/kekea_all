import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kekea_core/bloc/user_auth_bloc/bloc.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            BlocProvider.of<UserAuthBloc>(context).add(
              UserAuthEvent.signInViaGoogle(),
            );
          },
          child: Material(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 11,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/google_logo.png",
                    height: 18,
                  ),
                  SizedBox(width: 24),
                  Text(
                    "SIGN IN WITH GOOGLE",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
