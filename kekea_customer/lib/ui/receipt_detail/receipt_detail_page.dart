import 'package:flutter/material.dart';
import 'package:kekea_core/bloc/receipt_detail_bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/data/payment/payment.dart';
import 'package:kekea_core/data/payment_product/payment_product.dart';
import 'package:built_collection/built_collection.dart';
import 'package:kekea_customer/ui/receipt_detail/receipt_payment_widget.dart';
import 'package:kekea_core/ui/sale_solo/sale_solo_tile.dart';

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
                  SliverToBoxAdapter(
                    child: ReceiptPaymentWidget(payment: payment),
                  ),
                  paymentProducts.isNotEmpty
                      ? SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, int index) {
                              return SaleSoloTile(
                                paymentProduct: paymentProducts[index],
                              );
                            },
                            childCount: paymentProducts.length,
                          ),
                        )
                      : SliverFillRemaining(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
