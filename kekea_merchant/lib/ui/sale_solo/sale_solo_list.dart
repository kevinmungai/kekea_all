import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/edit_or_view_payment_bloc/bloc.dart';
import 'package:kekea_core/data/edit_or_view_payment/edit_or_view_payment.dart';
import 'package:kekea_merchant/ui/sale_solo/sale_solo_tile.dart';

class SaleSoloList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditOrViewPaymentBloc, EditOrViewPaymentState>(
      builder: (context, state) {
        return state.when(
          present: (EditOrViewPayment editOrViewPayment) {
            if (editOrViewPayment.paymentProducts != null) {
              if (editOrViewPayment.paymentProducts.isNotEmpty) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return SaleSoloTile(
                        paymentProduct:
                            editOrViewPayment.paymentProducts[index],
                      );
                    },
                    childCount: editOrViewPayment.paymentProducts.length,
                  ),
                );
              }
            }

            return SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          absent: () {
            return SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      },
    );
  }
}
