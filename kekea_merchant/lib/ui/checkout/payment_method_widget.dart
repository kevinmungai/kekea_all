import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/payment_input_bloc/bloc.dart';
import 'package:kekea_core/data/payment_method/payment_method.dart';
import 'package:kekea_core/utils/colors.dart';

/**
 * Returns a Widget that can switch between selected and unselected.
 */
class PaymentMethodWidget extends StatelessWidget {
  /**
   * The Payment Method that is to be displayed.
   */
  final PaymentMethod paymentMethod;

  /**
   * The url to the payment method.
   * Which should be the path to a local image asset.
   */
  final String url;

  const PaymentMethodWidget({
    @required this.paymentMethod,
    @required this.url,
  }) : assert(paymentMethod != null && url != null);

  @override
  Widget build(BuildContext context) {
    final String paymentMethodDisplayText = PaymentMethod.toDisplayText(
      paymentMethod,
    );

    return BlocBuilder<PaymentInputBloc, PaymentInputState>(
      builder: (context, state) {
        final selected = paymentMethodDisplayText ==
            PaymentMethod.toDisplayText(state.paymentMethod);
        return GestureDetector(
          onTap: () {
            BlocProvider.of<PaymentInputBloc>(context).add(
              PaymentInputEvent.selectPaymentMethod(
                paymentMethod: paymentMethod,
              ),
            );
          },
          child: ConstrainedBox(
            constraints: BoxConstraints.loose(
              Size(89, 80),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Material(
                color: selected ? highLightedColor : unselectedColor,
                animationDuration: Duration(milliseconds: 300),
                elevation: selected ? 4 : 0,
                borderRadius: BorderRadius.circular(8),
                child: Center(
                  child: Text(
                    paymentMethodDisplayText,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: selected
                              ? Theme.of(context).colorScheme.onSurface
                              : onUnSelected,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/**
 * Returns the currently selected Payment Method.
 */
class PaymentMethodSelected extends StatelessWidget {
  final String paymentMethod;
  final String url;
  final Key key;

  const PaymentMethodSelected({
    @required this.paymentMethod,
    @required this.url,
    @required this.key,
  }) : assert(paymentMethod != null && url != null && key != null);

  @override
  Widget build(BuildContext context) {
    /**
     * TODO: SHOULD IT RETURN JUST AN IMAGE
     */
    return Material(
      color: highLightedColor,
      elevation: 4,
      child: Text(
        paymentMethod,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

/**
 * Returns the currently unselected payment widget.
 */
class PaymentMethodUnSelected extends StatelessWidget {
  final String paymentMethod;
  final String url;
  final Key key;

  const PaymentMethodUnSelected({
    @required this.paymentMethod,
    @required this.url,
    @required this.key,
  }) : assert(paymentMethod != null && url != null && key != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: unselectedColor,
      elevation: 0,
      child: Text(
        paymentMethod,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
