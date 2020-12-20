import 'package:flutter/material.dart';
import 'package:kekea_core/data/sale_product/sale_product.dart';
import 'package:kekea_merchant/ui/discount/disount_price.dart';

class DiscountProductSaleTile extends StatelessWidget {
  final SaleProduct saleProduct;

  const DiscountProductSaleTile({
    @required this.saleProduct,
  }) : assert(saleProduct != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                saleProduct.product.name,
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
                          text: saleProduct.product.quantity.toString(),
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 24),
                  DiscountPrice(saleProduct: saleProduct),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
