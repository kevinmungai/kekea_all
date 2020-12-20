import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
