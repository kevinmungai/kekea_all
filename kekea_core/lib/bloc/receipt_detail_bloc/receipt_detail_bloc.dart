import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:kekea_core/data/payment/payment.dart';
import 'package:kekea_core/data/payment_product/payment_product.dart';
import 'package:kekea_core/data/payment_result/payment_result.dart';
import 'package:kekea_core/side_effects/database/firestore/payment_db_firestore.dart';
import 'package:kekea_core/side_effects/database/firestore/payment_product_db_firestore.dart';

import './bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class ReceiptDetailBloc extends Bloc<ReceiptDetailEvent, ReceiptDetailState> {
  final PaymentDBFirestore paymentDBFirestore;
  final PaymentProductDBFirestore paymentProductDBFirestore;

  StreamSubscription<BuiltList<PaymentProduct>> _paymentProductsSubscription;
  StreamSubscription<PaymentResult> _paymentSubscription;

  ReceiptDetailBloc({
    @required this.paymentDBFirestore,
    @required this.paymentProductDBFirestore,
  })  : assert(paymentDBFirestore != null && paymentProductDBFirestore != null),
        super(ReceiptDetailState.initial());

  @override
  Stream<ReceiptDetailState> mapEventToState(
    ReceiptDetailEvent event,
  ) async* {
    yield* event.when(
      listenByPayment: (Payment payment) async* {
        yield* state.maybeWhen(
          present: (
            Payment currentPayment,
            BuiltList<PaymentProduct> paymentProducts,
          ) async* {
            if (payment.id != currentPayment.id) {
              yield* listenByPayment(payment: payment);
            }
          },
          orElse: () async* {
            yield* listenByPayment(payment: payment);
          },
        );
      },
      stopListening: () async* {
        _paymentSubscription?.cancel();
        _paymentProductsSubscription?.cancel();
        yield ReceiptDetailState.initial();
      },
      listenByUri: (Uri uri) async* {
        yield* listenByUri(uri: uri);
      },
      setNewData: (
        Payment payment,
        BuiltList<PaymentProduct> paymentProducts,
      ) async* {
        yield ReceiptDetailState.present(
          payment: payment,
          paymentProducts: paymentProducts,
        );
      },
      setPaymentAbsent: () async* {
        yield ReceiptDetailState.paymentAbsent();
      },
      setPayment: (Payment payment) async* {
        yield ReceiptDetailState.present(payment: payment);
        yield* listenByPayment(payment: payment);
      },
    );
  }

  @override
  Future<void> close() {
    _paymentProductsSubscription?.cancel();
    _paymentSubscription?.cancel();
    return super.close();
  }

  Stream<ReceiptDetailState> listenByPayment({
    @required Payment payment,
  }) async* {
    _paymentProductsSubscription?.cancel();
    _paymentProductsSubscription = paymentProductDBFirestore
        .streamPaymentProducts(
      businessId: payment.business.id,
      storeId: payment.store.id,
      paymentId: payment.id,
    )
        .listen(
      (BuiltList<PaymentProduct> paymentProducts) {
        add(
          ReceiptDetailEvent.setNewData(
            payment: payment,
            paymentProducts: paymentProducts,
          ),
        );
      },
    );
  }

  Stream<ReceiptDetailState> listenByUri({
    @required Uri uri,
  }) async* {
    _paymentSubscription?.cancel();
    _paymentSubscription = paymentDBFirestore
        .streamPaymentByUri(
      uri: uri,
    )
        .listen(
      (PaymentResult paymentResult) {
        paymentResult.when(
          absent: () {
            add(ReceiptDetailEvent.setPaymentAbsent());
          },
          present: (Payment payment) {
            add(ReceiptDetailEvent.setPayment(payment: payment));
          },
        );
      },
    );
  }
}
