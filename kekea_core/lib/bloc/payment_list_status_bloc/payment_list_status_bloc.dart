import 'dart:async';

import 'package:built_collection/built_collection.dart';
import '../../data/payment/payment.dart';
import '../../side_effects/database/firestore/payment_db_firestore.dart';

import './bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class PaymentListStatusBloc
    extends Bloc<PaymentListStatusEvent, PaymentListStatusState> {
  final PaymentDBFirestore paymentDBFirestore;

  StreamSubscription<BuiltList<Payment>> _streamSubscription;

  PaymentListStatusBloc({
    @required this.paymentDBFirestore,
  })  : assert(paymentDBFirestore != null),
        super(PaymentListStatusState.loading());

  @override
  Stream<PaymentListStatusState> mapEventToState(
    PaymentListStatusEvent event,
  ) async* {
    yield* event.when(
      listen: (String businessId, String storeId) async* {
        _streamSubscription?.cancel();
        _streamSubscription = paymentDBFirestore
            .streamPayments(
          businessId: businessId,
          storeId: storeId,
        )
            .listen(
          (BuiltList<Payment> payments) {
            add(PaymentListStatusEvent.setPresent(payments: payments));
          },
          onError: (error) {
            add(PaymentListStatusEvent.setError());
          },
        );
      },
      stop: () async* {
        _streamSubscription?.cancel();
        yield PaymentListStatusState.loading();
      },
      setPresent: (BuiltList<Payment> payments) async* {
        yield PaymentListStatusState.present(payments: payments);
      },
      setError: () async* {
        /**
         * Choosing to do nothing about an error.
         */
        yield state;
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
