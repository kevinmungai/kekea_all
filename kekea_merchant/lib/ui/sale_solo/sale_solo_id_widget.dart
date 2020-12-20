import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/edit_or_view_payment_bloc/bloc.dart';
import 'package:kekea_core/data/edit_or_view_payment/edit_or_view_payment.dart';
import 'package:kekea_core/utils/payment_utils.dart';

class SaleSoloIdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditOrViewPaymentBloc, EditOrViewPaymentState>(
      builder: (context, state) {
        return state.when(
          present: (EditOrViewPayment editOrViewPayment) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: Text(
                    getPaymentId(editOrViewPayment.payment.id),
                    style: Theme.of(context).textTheme.caption.copyWith(
                          fontSize: 10,
                        ),
                  ),
                ),
              ),
            );
          },
          absent: () => SliverToBoxAdapter(),
        );
      },
    );
  }
}
