import 'package:built_collection/built_collection.dart';
import '../../data/payment/payment.dart';
import '../../data/payment_product/payment_product.dart';
import '../../side_effects/database/firestore/payment_db_firestore.dart';
import '../../side_effects/database/firestore/payment_product_db_firestore.dart';
import '../../side_effects/database/firestore/product_db_firestore.dart';

import 'bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentDBFirestore paymentDBFirestore;
  final PaymentProductDBFirestore paymentProductDBFirestore;
  final ProductDBFirestore productDBFirestore;

  PaymentBloc({
    @required this.paymentDBFirestore,
    @required this.paymentProductDBFirestore,
    @required this.productDBFirestore,
  })  : assert(paymentDBFirestore != null &&
            paymentProductDBFirestore != null &&
            productDBFirestore != null),
        super(PaymentState.initial());

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    yield* event.when(
      businessPersonDoesExist: () async* {
        yield PaymentState.businessPersonDoesNotExist();
      },
      paymentCreated: (Payment payment) async* {
        yield PaymentState.paymentCreated(payment);
      },
      paymentProductsSaved: (BuiltList<PaymentProduct> paymentProducts) async* {
        yield PaymentState.paymentProductsCreated();
      },
      productsUpdated: () async* {
        yield PaymentState.productsUpdated();
      },
    );
  }
}
