import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kekea_core/bloc/sign_in_bloc/bloc.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: OutlineButton(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Image.asset(
                    "assets/google_logo.png",
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text("SIGN IN WITH GOOGLE"),
                  ),
                ],
              ),
            ),
            onPressed: () {
              BlocProvider.of<SignInBloc>(context).add(SignInEvent.signIn());
            },
          ),
        ),
      ),
    );
  }
}
