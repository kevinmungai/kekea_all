import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';

import '../../utils/debug_print.dart';
import '../../bloc/business_person_status_bloc/business_person_status_bloc.dart';
import '../../data/business_person/business_person.dart';
import '../../data/edit_or_view_payment/edit_or_view_payment.dart';
import '../../data/payment/payment.dart';
import '../../data/payment_product/payment_product.dart';
import '../../side_effects/database/firestore/payment_product_db_firestore.dart';
import './bloc.dart';

class EditOrViewPaymentBloc
    extends Bloc<EditOrViewPaymentEvent, EditOrViewPaymentState> {
  final PaymentProductDBFirestore paymentProductDBFirestore;
  final BusinessPersonStatusBloc businessPersonStatusBloc;

  StreamSubscription<BuiltList<PaymentProduct>> _streamSubscription;

  EditOrViewPaymentBloc({
    @required this.paymentProductDBFirestore,
    @required this.businessPersonStatusBloc,
  })  : assert(paymentProductDBFirestore != null &&
            businessPersonStatusBloc != null),
        super(EditOrViewPaymentState.absent());

  @override
  Stream<EditOrViewPaymentState> mapEventToState(
    EditOrViewPaymentEvent event,
  ) async* {
    yield* event.when(
      listenToPaymentProducts: (Payment payment) async* {
        add(EditOrViewPaymentEvent.setPaymentPresent(payment: payment));
        yield* businessPersonStatusBloc.state.maybeWhen(
          orElse: () async* {},
          present: (BusinessPerson businessPerson) async* {
            _streamSubscription?.cancel();
            _streamSubscription = paymentProductDBFirestore
                .streamPaymentProducts(
              businessId: businessPerson.defaultBusiness,
              storeId: businessPerson.defaultStore,
              paymentId: payment.id,
            )
                .listen(
              (BuiltList<PaymentProduct> paymentProducts) {
                add(
                  EditOrViewPaymentEvent.setPaymentProductsPresent(
                    paymentProducts: paymentProducts,
                    payment: payment,
                  ),
                );
              },
              onError: (Object error, StackTrace stackTrace) {
                add(
                  EditOrViewPaymentEvent.setError(
                    error: error,
                    stackTrace: stackTrace,
                  ),
                );
              },
            );
          },
        );
      },
      setPaymentProductsPresent: (
        BuiltList<PaymentProduct> paymentProducts,
        Payment payment,
      ) async* {
        yield EditOrViewPaymentState.present(
          editOrViewPayment: EditOrViewPayment(
            payment: payment,
            paymentProducts: paymentProducts,
          ),
        );
      },
      setPaymentPresent: (Payment payment) async* {
        yield EditOrViewPaymentState.present(
          editOrViewPayment: EditOrViewPayment(
            payment: payment,
          ),
        );
      },
      setError: (Error error, StackTrace stackTrace) async* {
        dPrint(
          "error: ${error != null ? error : null}\n\nstackTrace: ${stackTrace != null ? stackTrace : null}",
        );
      },
      stopListening: () async* {
        _streamSubscription?.cancel();
        yield EditOrViewPaymentState.absent();
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
