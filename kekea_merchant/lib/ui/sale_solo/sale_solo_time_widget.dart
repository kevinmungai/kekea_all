import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/edit_or_view_payment_bloc/bloc.dart';
import 'package:kekea_core/data/edit_or_view_payment/edit_or_view_payment.dart';
import 'package:kekea_core/formatters/date_formatter.dart';

class SaleSoloTimeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditOrViewPaymentBloc, EditOrViewPaymentState>(
      builder: (context, state) {
        return state.when(
          present: (EditOrViewPayment editOrViewPayment) {
            return SliverToBoxAdapter(
              child: Material(
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      getDateFormat(
                        editOrViewPayment.payment.timestamp.toDate(),
                      ),
                      style: Theme.of(context).textTheme.bodyText2,
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
