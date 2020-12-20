import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/product_list_status_bloc/bloc.dart';
import 'package:kekea_core/data/sale_product/sale_product.dart';
import 'package:kekea_core/formatters/currency_input_formatter.dart';
import 'package:kekea_core/formatters/format_amount.dart';
import 'package:kekea_core/formatters/max_input_formatter.dart';
import 'package:kekea_merchant/ui/discount/discount_sale_product_tile.dart';
import 'package:kekea_core/extensions/string_extensions.dart';

class DiscountPage extends StatelessWidget {
  final SaleProduct saleProduct;

  const DiscountPage({
    @required this.saleProduct,
  }) : assert(saleProduct != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Discount"),
        actions: [
          CloseButton(
            onPressed: () {
              Navigator.maybePop(context);
              BlocProvider.of<ProductListStatusBloc>(context).add(
                ProductListStatusEvent.cancelDiscount(
                  productId: saleProduct.product.id,
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          DiscountProductSaleTile(
            saleProduct: saleProduct,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("New Price"),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: formatAmount(
                          amount: saleProduct?.discount?.price?.amount ??
                              BigInt.zero,
                          addCents: true,
                        ),
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: "20.00",
                          helperText: "The Discounted Price of the product",
                          suffix: Text("KES"),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (String text) {
                          final BigInt amount =
                              BigInt.tryParse(text.getPlainNum()) ??
                                  BigInt.zero;

                          BlocProvider.of<ProductListStatusBloc>(context).add(
                            ProductListStatusEvent.changeDiscount(
                              productId: saleProduct.product.id,
                              amount: amount,
                            ),
                          );
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          MaxInputFormatter(saleProduct.product.price.amount),
                          CurrencyInputFormatter(),
                        ],
                      ),
                    ),
                    SizedBox(width: 64),
                    ElevatedButton(
                      child: Text("Submit"),
                      onPressed: () {
                        Navigator.maybePop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
