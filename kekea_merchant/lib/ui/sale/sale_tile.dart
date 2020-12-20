import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/product_list_status_bloc/bloc.dart';
import 'package:kekea_core/data/sale_product/sale_product.dart';
import 'package:kekea_core/formatters/format_amount.dart';
import 'package:kekea_core/utils/colors.dart';
import 'package:kekea_core/utils/discount_utils.dart';
import 'package:kekea_merchant/ui/discount/discount_page.dart';
import 'package:kekea_merchant/ui/sale/select_quantity.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SaleTile extends StatelessWidget {
  final SaleProduct saleProduct;
  final Key key;

  const SaleTile({
    @required this.saleProduct,
    this.key,
  }) : assert(saleProduct != null);

  @override
  Widget build(BuildContext context) {
    final bool changed = showDiscountSummary(
      saleProduct: saleProduct,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: Card(
        color: saleProduct.quantity > 0
            ? highLightedColor
            : Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: AspectRatio(
            aspectRatio: 2.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 6,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            saleProduct.product.name,
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      fontSize: 22,
                                    ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(width: 28),
                      Flexible(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: DiscountPage(
                                    saleProduct: saleProduct,
                                  ),
                                );
                                BlocProvider.of<ProductListStatusBloc>(context)
                                    .add(
                                  ProductListStatusEvent.changeDiscount(
                                    productId: saleProduct.product.id,
                                    amount:
                                        saleProduct?.discount?.price?.amount ??
                                            BigInt.zero,
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if (changed)
                                    Text(
                                      formatAmount(
                                        amount:
                                            saleProduct.product.price.amount,
                                        addCents: true,
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: spanishGray,
                                          ),
                                    ),
                                  Text(
                                    changed
                                        ? formatAmount(
                                            amount: showDiscountIFPresent(
                                              fullPriceAmount: saleProduct
                                                  .product.price.amount,
                                              discount: saleProduct.discount,
                                            ),
                                            addCents: true,
                                          )
                                        : formatAmount(
                                            amount: saleProduct
                                                .product.price.amount,
                                            addCents: true,
                                          ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                          fontSize: 18,
                                        ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.clear,
                                        size: 18,
                                      ),
                                      Text(
                                        saleProduct.quantity > 0
                                            ? saleProduct.quantity.toString()
                                            : "0",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: 8,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              saleProduct.quantity > 0
                                  ? formatAmount(
                                      amount:
                                          BigInt.from(saleProduct.quantity) *
                                              showDiscountIFPresent(
                                                fullPriceAmount: saleProduct
                                                    .product.price.amount,
                                                discount: saleProduct.discount,
                                              ),
                                      addCents: true,
                                    )
                                  : "0.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
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
                ),
                SelectQuantity(
                  saleProduct: saleProduct,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
