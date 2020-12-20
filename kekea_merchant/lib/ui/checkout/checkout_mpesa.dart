import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/payment_input_bloc/bloc.dart';

class CheckOutMpesa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentInputBloc, PaymentInputState>(
      builder: (context, state) {
        return state.paymentMethod.maybeMap(
          mpesa: (_) => Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: 8,
            ),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  top: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 2,
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                          children: [
                            TextSpan(text: "MPESA\n"),
                            TextSpan(text: "reference\n"),
                            TextSpan(text: "number")
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.characters,
                        maxLines: 1,
                        onChanged: (String text) {
                          BlocProvider.of<PaymentInputBloc>(context).add(
                            PaymentInputEvent.changeMpesaRefNumber(
                              mpesaRefNumber: text,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          orElse: () => Visibility(
            child: Container(),
            visible: false,
          ),
        );
      },
    );
  }
}
