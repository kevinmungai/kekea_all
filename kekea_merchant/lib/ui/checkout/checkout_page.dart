import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/business_person_status_bloc/bloc.dart';
import 'package:kekea_core/bloc/payment_input_bloc/bloc.dart';
import 'package:kekea_core/bloc/product_list_status_bloc/bloc.dart';

import 'package:kekea_merchant/ui/checkout/checkout_card.dart';
import 'package:kekea_merchant/ui/checkout/checkout_cash.dart';
import 'package:kekea_merchant/ui/checkout/checkout_customer_phone.dart';
import 'package:kekea_merchant/ui/checkout/checkout_mpesa.dart';
import 'package:kekea_merchant/ui/checkout/checkout_submit.dart';
import 'package:kekea_merchant/ui/checkout/checkout_total.dart';
import 'package:kekea_merchant/ui/checkout/payment_method_list.dart';

class CheckOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentInputBloc>(
      create: (context) => PaymentInputBloc(
        productListStatusBloc: BlocProvider.of<ProductListStatusBloc>(context),
        businessPersonStatusBloc:
            BlocProvider.of<BusinessPersonStatusBloc>(context),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: CheckOutTotal(),
          actions: [CheckOutSubmit()],
        ),
        body: ListView(
          children: [
            PaymentMethodList(),
            CheckOutCash(),
            CheckOutCard(),
            CheckOutMpesa(),
            CheckOutCustomerPhone(),
          ],
        ),
      ),
    );
  }
}
