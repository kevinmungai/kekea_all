import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/edit_or_view_payment_bloc/bloc.dart';
import 'package:kekea_core/data/edit_or_view_payment/edit_or_view_payment.dart';
import 'package:kekea_core/utils/customer_utils.dart';

class SaleSoloCustomerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
    return BlocBuilder<EditOrViewPaymentBloc, EditOrViewPaymentState>(
      builder: (context, state) {
        return state.when(
          present: (EditOrViewPayment editOrViewPayment) {
            return SliverToBoxAdapter(
              child: Material(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 12,
                        fit: FlexFit.tight,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Customer:",
                            style: textStyle,
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Container(),
                      ),
                      Flexible(
                        flex: 12,
                        fit: FlexFit.tight,
                        child: Text(
                          getCustomer(editOrViewPayment.payment.customer),
                          style: textStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          absent: () {
            return SliverToBoxAdapter();
          },
        );
      },
    );
  }
}
