import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:kekea_core/data/kekea_user/kekea_user.dart';
import 'package:kekea_core/data/payment/payment.dart';
import 'package:kekea_core/side_effects/database/firestore/payment_db_firestore.dart';

import './bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class ReceiptListBloc extends Bloc<ReceiptListEvent, ReceiptListState> {
  final PaymentDBFirestore paymentDBFirestore;

  StreamSubscription<BuiltList<Payment>> _streamSubscription;

  ReceiptListBloc({
    @required this.paymentDBFirestore,
  })  : assert(paymentDBFirestore != null),
        super(ReceiptListState.absent());

  @override
  Stream<ReceiptListState> mapEventToState(
    ReceiptListEvent event,
  ) async* {
    yield* event.when(
      listen: (KekeaUser kekeaUser) async* {
        _streamSubscription?.cancel();
        _streamSubscription = paymentDBFirestore
            .streamPaymentsByCustomerPhone(
          phone: kekeaUser.phoneNumber,
        )
            .listen(
          (BuiltList<Payment> paymentList) {
            add(
              ReceiptListEvent.setPresent(receipts: paymentList),
            );
          },
        );
      },
      stopListening: () async* {
        _streamSubscription?.cancel();
        yield ReceiptListState.absent();
      },
      setPresent: (BuiltList<Payment> paymentList) async* {
        yield ReceiptListState.present(receipts: paymentList);
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
