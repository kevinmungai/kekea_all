import '../data/discount/discount.dart';
import '../data/payment_product/payment_product.dart';
import '../data/sale_product/sale_product.dart';
import 'package:meta/meta.dart';

BigInt showDiscountIFPresent({
  @required Discount discount,
  @required BigInt fullPriceAmount,
}) {
  assert(fullPriceAmount != null);

  final BigInt discountAmount = discount?.price?.amount;

  return discountAmount ?? fullPriceAmount;
}

bool showDiscountSummary({
  @required SaleProduct saleProduct,
}) {
  assert(saleProduct != null);

  return saleProduct != null &&
      saleProduct.discount != null &&
      saleProduct.discount.price != null &&
      saleProduct.discount.price.amount != null &&
      saleProduct.discount.price.amount > BigInt.zero &&
      saleProduct.discount.price.amount != saleProduct.product.price.amount;
}

bool showDiscountSummaryPayment({
  @required PaymentProduct paymentProduct,
}) {
  assert(paymentProduct != null);

  return paymentProduct != null &&
      paymentProduct.discount != null &&
      paymentProduct.discount.price != null &&
      paymentProduct.discount.price.amount != null &&
      paymentProduct.discount.price.amount > BigInt.zero &&
      paymentProduct.discount.price.amount != paymentProduct.price.amount;
}
