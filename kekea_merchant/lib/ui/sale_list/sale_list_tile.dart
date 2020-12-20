import 'package:flutter/material.dart';
import 'package:kekea_core/data/business_person/business_person.dart';
import 'package:kekea_core/data/payment/payment.dart';
import 'package:kekea_core/data/payment_method/payment_method.dart';
import 'package:kekea_core/formatters/date_formatter.dart';
import 'package:kekea_core/formatters/format_amount.dart';
import 'package:kekea_core/utils/business_person_utils.dart';
import 'package:kekea_core/utils/colors.dart';
import 'package:kekea_core/utils/customer_utils.dart';
import 'package:kekea_core/utils/payment_utils.dart';
import 'package:kekea_merchant/ui/sale_solo/sale_solo_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SaleListTile extends StatelessWidget {
  final Payment payment;
  final BusinessPerson currentBusinessPerson;

  const SaleListTile({
    @required this.payment,
    @required this.currentBusinessPerson,
  }) : assert(payment != null && currentBusinessPerson != null);

  @override
  Widget build(BuildContext context) {
    final String paymentId = getPaymentId(payment.id);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          pushNewScreen(
            context,
            screen: SaleSoloPage(payment: payment),
            withNavBar: false,
          );
        },
        child: Material(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: AspectRatio(
              aspectRatio: 3.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getDateFormat(payment.timestamp.toDate()),
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Visibility(
                        visible: paymentId != null,
                        child: Text(
                          paymentId,
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 10,
                                color: spanishGray,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                  children: [
                                    TextSpan(
                                      text: "By: ",
                                    ),
                                    TextSpan(
                                      text: getBusinessPerson(
                                        businessPerson: payment.cashier,
                                        currentBusinessPerson:
                                            currentBusinessPerson,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                  children: [
                                    TextSpan(
                                      text: "Customer: ",
                                    ),
                                    TextSpan(
                                      text: getCustomer(payment.customer),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                formatAmount(
                                  amount: payment.price.amount,
                                  addCents: true,
                                ),
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                PaymentMethod.toDisplayTextPayment(
                                  payment.paymentMethod,
                                ),
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
