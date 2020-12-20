import 'package:flutter/material.dart';
import 'package:kekea_core/data/product/product.dart';
import 'package:kekea_core/formatters/format_amount.dart';

typedef ProductListTileOnTapCallBack = void Function();

class ProductListTile extends StatelessWidget {
  final Product product;
  final ProductListTileOnTapCallBack productListTileOnTapCallBack;

  const ProductListTile({
    @required this.product,
    @required this.productListTileOnTapCallBack,
  }) : assert(product != null && productListTileOnTapCallBack != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: productListTileOnTapCallBack,
        child: Material(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                        children: [
                          TextSpan(text: "qty: "),
                          TextSpan(
                            text: product.quantity.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 24),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                        children: [
                          TextSpan(text: "price: "),
                          TextSpan(
                            text: formatAmount(
                              amount: product.price.amount,
                              addCents: true,
                            ),
                            style: Theme.of(context).textTheme.subtitle1,
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
      ),
    );
  }
}
