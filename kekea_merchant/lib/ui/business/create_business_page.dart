import 'package:flutter/material.dart';
import 'package:kekea_merchant/ui/business/business_name_input.dart';
import 'package:kekea_merchant/ui/business/business_submit_input.dart';

class CreateBusinessPage extends StatefulWidget {
  @override
  _CreateBusinessPageState createState() => _CreateBusinessPageState();
}

class _CreateBusinessPageState extends State<CreateBusinessPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create Business"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: BusinessNameInput(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: BusinessSubmitInput(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
