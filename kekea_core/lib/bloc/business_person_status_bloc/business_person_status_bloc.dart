import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kekea_core/side_effects/dynamic_link/dynamic_link.dart';
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../utils/sale_product_utils/get_sale_totals.dart';
import '../business_member_bloc/bloc.dart';
import '../payment_bloc/bloc.dart';
import '../product_list_status_bloc/bloc.dart';
import '../../side_effects/database/firestore/business_db_firestore.dart';
import '../../side_effects/database/firestore/business_person_db_firestore.dart';
import '../../side_effects/database/firestore/payment_db_firestore.dart';
import '../../side_effects/database/firestore/payment_product_db_firestore.dart';
import '../../side_effects/database/firestore/product_db_firestore.dart';
import '../../side_effects/database/firestore/store_db_firestore.dart';
import '../../data/business/business.dart';
import '../../data/business_member/business_member.dart';
import '../../data/business_person/business_person.dart';

import '../../data/business_person_result/business_person_result.dart';

import '../../data/currency/currency.dart';
import '../../data/customer/customer.dart';
import '../../data/payment/payment.dart';
import '../../data/payment_method/payment_method.dart';
import '../../data/payment_product/payment_product.dart';

import '../../data/price/price.dart';

import '../../data/sale_product/sale_product.dart';
import '../../data/store/store.dart';
import '../../bloc/business_person_bloc/bloc.dart' as bpc;

import './bloc.dart';

class BusinessPersonStatusBloc
    extends Bloc<BusinessPersonStatusEvent, BusinessPersonStatusState> {
  final BusinessPersonDBFirestore businessPersonDBFirestore;
  final bpc.BusinessPersonBloc businessPersonBloc;
  final BusinessMemberBloc businessMemberBloc;
  final BusinessDBFirestore businessDBFirestore;
  final ProductListStatusBloc productListStatusBloc;

  final PaymentDBFirestore paymentDBFirestore;
  final PaymentBloc paymentBloc;
  final PaymentProductDBFirestore paymentProductDBFirestore;
  final ProductDBFirestore productDBFirestore;
  final DynamicLink dynamicLink;

  final StoreDBFirestore storeDBFirestore;

  StreamSubscription<BusinessPersonResult> _streamSubscription;

  BusinessPersonStatusBloc({
    @required this.businessPersonDBFirestore,
    @required this.businessPersonBloc,
    @required this.businessMemberBloc,
    @required this.businessDBFirestore,
    @required this.storeDBFirestore,
    @required this.productListStatusBloc,
    @required this.paymentDBFirestore,
    @required this.paymentBloc,
    @required this.paymentProductDBFirestore,
    @required this.productDBFirestore,
    @required this.dynamicLink,
  })  : assert(businessPersonDBFirestore != null &&
            businessPersonBloc != null &&
            businessMemberBloc != null &&
            businessDBFirestore != null &&
            storeDBFirestore != null &&
            productListStatusBloc != null &&
            paymentDBFirestore != null &&
            paymentBloc != null &&
            paymentProductDBFirestore != null &&
            productDBFirestore != null &&
            dynamicLink != null),
        super(BusinessPersonStatusState.absent());

  @override
  Stream<BusinessPersonStatusState> mapEventToState(
    BusinessPersonStatusEvent event,
  ) async* {
    yield* event.when(
      listenToChanges: (String firebaseId) async* {
        _streamSubscription?.cancel();
        _streamSubscription = businessPersonDBFirestore
            .streamBusinessPerson(
          firebaseId: firebaseId,
        )
            .listen(
          (BusinessPersonResult businessPersonResult) {
            businessPersonResult.when(
              present: (BusinessPerson businessPerson) {
                add(
                  BusinessPersonStatusEvent.setPresent(
                    businessPerson: businessPerson,
                  ),
                );
              },
              absent: (String firebaseId) {
                add(
                  BusinessPersonStatusEvent.setAbsent(
                    firebaseId: firebaseId,
                  ),
                );
              },
            );
          },
        );
      },
      setPresent: (BusinessPerson businessPerson) async* {
        yield BusinessPersonStatusState.present(
          businessPerson: businessPerson,
        );
        final _defaultBusiness = businessPerson?.defaultBusiness?.id;
        if (_defaultBusiness == null) {
          final Business defaultBusiness =
              businessDBFirestore.createBusinessDocument(business: Business());

          add(
            BusinessPersonStatusEvent.setDefaultBusiness(
              defaultBusiness: defaultBusiness,
            ),
          );

          add(
            BusinessPersonStatusEvent.createBusinessMember(
              businessId: defaultBusiness.id,
            ),
          );
          final _defaultStore = businessPerson?.defaultStore?.id;
          if (_defaultStore == null) {
            final Store store = storeDBFirestore.createStore(
              businessId: defaultBusiness.id,
              store: Store(),
            );

            add(
              BusinessPersonStatusEvent.setDefaultStore(
                store: store,
                businessId: defaultBusiness.id,
              ),
            );
          }
        }
      },
      setAbsent: (String firebaseId) async* {
        yield BusinessPersonStatusState.absent();
        businessPersonBloc.add(
          bpc.BusinessPersonEvent.createBusinessPerson(
            businessPerson: BusinessPerson(
              firebaseId: firebaseId,
            ),
          ),
        );
      },
      stopListening: () async* {
        _streamSubscription?.cancel();
        yield BusinessPersonStatusState.absent();
      },
      setDefaultBusiness: (Business defaultBusiness) async* {
        yield* state.maybeWhen(
          present: (BusinessPerson businessPerson) async* {
            businessPersonBloc.add(
              bpc.BusinessPersonEvent.updateBusinessPerson(
                businessPerson: businessPerson.copyWith(
                  defaultBusiness: defaultBusiness,
                ),
              ),
            );
          },
          orElse: () async* {
            yield state;
          },
        );
      },
      createBusinessMember: (String businessId) async* {
        yield* state.maybeWhen(
          present: (BusinessPerson businessPerson) async* {
            businessMemberBloc.add(
              BusinessMemberEvent.create(
                businessId: businessId,
                businessMember: BusinessMember(
                  firebaseId: businessPerson.firebaseId,
                ),
              ),
            );
          },
          orElse: () async* {
            yield state;
          },
        );
      },
      setDefaultStore: (Store store, String businessId) async* {
        yield* state.maybeWhen(
          present: (BusinessPerson businessPerson) async* {
            businessPersonBloc.add(
              bpc.BusinessPersonEvent.updateBusinessPerson(
                businessPerson: businessPerson.copyWith(
                  defaultStore: store,
                ),
              ),
            );
          },
          orElse: () async* {
            yield state;
          },
        );
      },
      submitPayment: (
        PaymentMethod paymentMethod,
        Customer customer,
      ) async* {
        yield* submitPayment(
          paymentMethod: paymentMethod,
          customer: customer,
        );
      },
    );
  }

  Stream<BusinessPersonStatusState> submitPayment({
    @required PaymentMethod paymentMethod,
    @required Customer customer,
  }) async* {
    assert(paymentMethod != null);
    assert(customer != null);

    yield* state.maybeWhen(
      present: (BusinessPerson businessPerson) async* {
        yield* productListStatusBloc.state.maybeWhen(
          present: (_, BuiltList<SaleProduct> selectedProducts, __) async* {
            /// Get Payment Id
            final String paymentId = paymentDBFirestore.getPaymentId(
              businessId: businessPerson.defaultBusiness.id,
              storeId: businessPerson.defaultStore.id,
            );

            /// Create Payment
            final Payment payment = Payment(
              id: paymentId,
              cashier: businessPerson,
              customer: customer,
              paymentMethod: paymentMethod,
              price: Price(
                amount: getSaleTotals(saleProducts: selectedProducts),
                currency: Currency(text: "KES"),
              ),
              timestamp: Timestamp.now(),
              business: businessPerson.defaultBusiness,
              store: businessPerson.defaultStore,
            );

            /// Create Dynamic Link and update the Payment.
            final Payment updatedPayment = await dynamicLink.createDynamicLink(
              payment: payment,
              business: businessPerson.defaultBusiness,
            );

            /// Save Payment to the database
            final Payment savedPayment = paymentDBFirestore.createPayment(
              payment: updatedPayment,
            );

            /// Report the saved payment to the Payment Bloc
            paymentBloc.add(PaymentEvent.paymentCreated(savedPayment));

            /// Created the PaymentProducts that are to be saved under payment
            final BuiltList<PaymentProduct> paymentProducts = selectedProducts
                .map(
                  (SaleProduct selectedProduct) => PaymentProduct(
                    name: selectedProduct.product.name,
                    price: selectedProduct.product.price,
                    refId: selectedProduct.product.id,
                    quantity: selectedProduct.quantity,
                    discount: selectedProduct.discount,
                  ),
                )
                .toBuiltList();

            /// Save the PaymentProducts in the database
            final BuiltList<PaymentProduct> savedPaymentProducts =
                paymentProductDBFirestore.createPaymentProducts(
              businessId: businessPerson.defaultBusiness.id,
              storeId: businessPerson.defaultStore.id,
              paymentId: savedPayment.id,
              paymentProducts: paymentProducts,
            );

            /// Report that the PaymentProducts have been saved in Cloud Firestore
            paymentBloc.add(
              PaymentEvent.paymentProductsSaved(savedPaymentProducts),
            );

            /// Update the products of the change in Quantity.
            final BuiltList<PaymentProduct> afterUpdatingProducts =
                productDBFirestore.updateSoldProducts(
              businessId: businessPerson.defaultBusiness.id,
              storeId: businessPerson.defaultStore.id,
              paymentProducts: savedPaymentProducts,
            );

            /// Report that the products have been updated.
            paymentBloc.add(PaymentEvent.productsUpdated());

            /// Reset the state of the Product List Status Bloc.
            productListStatusBloc.add(ProductListStatusEvent.cancel());
          },
          orElse: () async* {},
        );
      },
      orElse: () async* {
        /// FORWARDING THE ERROR TO PAYMENT BLOC
        paymentBloc.add(PaymentEvent.businessPersonDoesExist());
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
