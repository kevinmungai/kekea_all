import 'package:flutter/material.dart';
import 'package:kekea_core/data/payment_product/payment_product.dart';
import 'package:kekea_core/formatters/format_amount.dart';
import 'package:kekea_core/utils/colors.dart';
import 'package:kekea_core/utils/discount_utils.dart';

class SaleSoloTile extends StatelessWidget {
  final PaymentProduct paymentProduct;

  const SaleSoloTile({
    @required this.paymentProduct,
  }) : assert(paymentProduct != null);

  @override
  Widget build(BuildContext context) {
    final bool changed = showDiscountSummaryPayment(
      paymentProduct: paymentProduct,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Material(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      paymentProduct.name,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontSize: 22,
                          ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 28),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          changed
                              ? formatAmount(
                                  amount: showDiscountIFPresent(
                                      discount: paymentProduct?.discount,
                                      fullPriceAmount:
                                          paymentProduct.price.amount),
                                  addCents: true,
                                )
                              : formatAmount(
                                  amount: paymentProduct.price.amount,
                                  addCents: true,
                                ),
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                fontSize: 18,
                              ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.clear, size: 18),
                            Text(
                              paymentProduct.quantity.toString(),
                              maxLines: 1,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        Divider(
                          height: 8,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        Text(
                          changed
                              ? formatAmount(
                                  amount: showDiscountIFPresent(
                                        discount: paymentProduct?.discount,
                                        fullPriceAmount:
                                            paymentProduct.price.amount,
                                      ) *
                                      BigInt.from(paymentProduct.quantity),
                                  addCents: true,
                                )
                              : formatAmount(
                                  amount: paymentProduct.price.amount *
                                      BigInt.from(
                                        paymentProduct.quantity,
                                      ),
                                  addCents: true,
                                ),
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                fontSize: 18,
                              ),
                          maxLines: 1,
                        ),
                        Divider(
                          height: 8,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  RichText(
                    maxLines: 1,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                      children: [
                        TextSpan(text: "QTY: "),
                        TextSpan(
                          text: paymentProduct.quantity.toString(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  RichText(
                    maxLines: 1,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                      children: [
                        TextSpan(
                          text: "PRICE: ",
                        ),
                        if (changed) ...[
                          TextSpan(
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      color: spanishGray,
                                    ),
                            text: formatAmount(
                              amount: paymentProduct.price.amount,
                              addCents: true,
                            ),
                          ),
                          TextSpan(text: "  "),
                          TextSpan(
                            text: formatAmount(
                              amount: showDiscountIFPresent(
                                discount: paymentProduct?.discount,
                                fullPriceAmount: paymentProduct.price.amount,
                              ),
                              addCents: true,
                            ),
                          ),
                        ],
                        if (!changed)
                          TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            text: formatAmount(
                              amount: paymentProduct.price.amount,
                              addCents: true,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
