import 'package:flutter/material.dart';

class BusinessSubmitInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("Submit"),
      onPressed: () {
        if (Form.of(context).validate()) {
          throw (UnimplementedError());
        }
      },
    );
  }
}
