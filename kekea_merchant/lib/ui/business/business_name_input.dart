import 'package:flutter/material.dart';

class BusinessNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Business Name"),
        TextFormField(
          decoration: InputDecoration(
            hintText: "e.g. Big Business",
            helperText: "The name of your business",
            errorText: null,
          ),
          validator: (String text) {
            return text.isNotEmpty ? null : "The business name cannot be null";
          },
          onChanged: (String text) {
            throw (UnimplementedError());
          },
        ),
      ],
    );
  }
}
