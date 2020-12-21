import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:kekea_core/data/payment/payment.dart';
import 'package:kekea_core/data/payment_product/payment_product.dart';
import 'package:kekea_core/side_effects/database/firestore/payment_db_firestore.dart';

import './bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class ReceiptDetailBloc extends Bloc<ReceiptDetailEvent, ReceiptDetailState> {
  final PaymentDBFirestore paymentDBFirestore;

  StreamSubscription<BuiltList<PaymentProduct>> _paymentProductsSubscription;
  StreamSubscription<Payment> _paymentSubscription;

  ReceiptDetailBloc({
    @required this.paymentDBFirestore,
  })  : assert(paymentDBFirestore != null),
        super(ReceiptDetailState.initial());

  @override
  Stream<ReceiptDetailState> mapEventToState(
    ReceiptDetailEvent event,
  ) async* {
    yield* event.when(
      listenByPayment: (Payment payment) async* {},
      stopListening: null,
      listenByUri: null,
      setPayment: null,
      setPaymentProducts: null,
    );
  }

  @override
  Future<void> close() {
    _paymentProductsSubscription?.cancel();
    _paymentSubscription?.cancel();
    return super.close();
  }
}
