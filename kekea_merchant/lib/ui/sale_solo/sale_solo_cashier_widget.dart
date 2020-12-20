import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/business_person_status_bloc/bloc.dart';
import 'package:kekea_core/bloc/edit_or_view_payment_bloc/bloc.dart';
import 'package:kekea_core/data/business_person/business_person.dart';
import 'package:kekea_core/data/edit_or_view_payment/edit_or_view_payment.dart';
import 'package:kekea_core/utils/business_person_utils.dart';

class SaleSoloCashierWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
    return BlocBuilder<BusinessPersonStatusBloc, BusinessPersonStatusState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => Text("WEIRD ERROR"),
          present: (BusinessPerson businessPerson) {
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
                                    "Cashier:",
                                    style: textStyle,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(),
                              ),
                              Flexible(
                                flex: 12,
                                fit: FlexFit.tight,
                                child: Text(
                                  getBusinessPerson(
                                    businessPerson:
                                        editOrViewPayment.payment.cashier,
                                    currentBusinessPerson: businessPerson,
                                  ),
                                  style: textStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  absent: () => SliverToBoxAdapter(),
                );
              },
            );
          },
        );
      },
    );
  }
}
