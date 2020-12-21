import 'package:flutter/material.dart';
import 'package:kekea_core/bloc/receipt_detail_bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/data/payment/payment.dart';
import 'package:kekea_core/data/payment_product/payment_product.dart';
import 'package:built_collection/built_collection.dart';

class ReceiptDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ReceiptDetailBloc, ReceiptDetailState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(
              child: CircularProgressIndicator(),
            ),
            paymentAbsent: () => Center(
              child: Text("Cannot Retrieve Receipt"),
            ),
            present: (
              Payment payment,
              BuiltList<PaymentProduct> paymentProducts,
            ) {
              return CustomScrollView(
                slivers: [
                  /// TODO: CREATE PAYMENT WIDGET
                  ///
                  ///
                  /// TODO: CREATE PAYMENT PRODUCT LIST
                ],
              );
            },
          );
        },
      ),
    );
  }
}
