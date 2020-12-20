import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/business_member/business_member.dart';
import '../../../data/payment/payment.dart';
import '../../../data/payment_method/payment_method.dart';
import '../../../data/person/person.dart';
import 'package:meta/meta.dart';
import '../../../utils/constants.dart' as c;
import '../../../utils/firestore_paths.dart' as fp;

class PaymentDBFirestore {
  final FirebaseFirestore firestore;

  const PaymentDBFirestore({
    @required this.firestore,
  });

  Payment createPayment({
    @required Payment payment,
  }) {
    assert(payment != null);
    assert(payment.cashier != null);
    assert(payment.cashier.defaultBusiness != null);
    assert(payment.cashier.defaultStore != null);

    final DocumentReference docRef = firestore
        .collection(
          fp.paymentCollectionPath(
            businessId: payment.cashier.defaultBusiness,
            storeId: payment.cashier.defaultStore,
          ),
        )
        .doc();

    /**
     * Stripping away the defaultStore and defaultBusiness
     * so that they don't show up in the receipt.
     */
    final paymentWithId = payment.copyWith(
      id: docRef.id,
      cashier: payment.cashier.copyWith(
        defaultStore: null,
        defaultBusiness: null,
      ),
    );

    docRef.set(
      paymentWithId.toJson(),
      SetOptions(
        merge: false,
      ),
    );

    /// TODO: REMEMBER TO CALL PaymentProductDBFirestore.createPaymentProducts
    /// to create the PaymentProducts
    return paymentWithId;
  }

  Stream<BuiltList<Payment>> streamPayments({
    @required String businessId,
    @required String storeId,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.paymentCollectionPath(
        businessId: businessId,
        storeId: storeId,
      ),
    );

    final Query query = collRef.orderBy(
      c.paymentTimeStamp,
      descending: true,
    );

    return query.snapshots().map((snap) {
      final List<Payment> res = snap.docs
          .map(
            (doc) => Payment.fromJson(
              doc.data(),
            ),
          )
          .toList();
      return BuiltList<Payment>(res);
    });
  }

  Stream<Payment> streamPayment({
    @required String businessId,
    @required String storeId,
    @required String paymentId,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.paymentDocumentPath(
        businessId: businessId,
        storeId: storeId,
        paymentId: paymentId,
      ),
    );

    return docRef.snapshots().map(
          (snap) => Payment.fromJson(
            snap.data(),
          ),
        );
  }

  Stream<BuiltList<Payment>> streamPaymentsByPaymentMethodId({
    @required String businessId,
    @required String storeId,
    @required PaymentMethod paymentMethod,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.paymentCollectionPath(
        businessId: businessId,
        storeId: storeId,
      ),
    );

    final String field = "${c.paymentPaymentMethod}.${c.paymentMethodUnionKey}";

    final String paymentMethodType =
        paymentMethod.toJson()[c.paymentMethodUnionKey];

    final Query query = collRef.where(
      field,
      isEqualTo: paymentMethodType,
    );

    return query.snapshots().map(
          (snap) => snap.docs
              .map(
                (doc) => Payment.fromJson(
                  doc.data(),
                ),
              )
              .toBuiltList(),
        );
  }

  Stream<BuiltList<Payment>> streamPaymentsByPersonPhone({
    @required String businessId,
    @required String storeId,
    @required Person person,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.paymentCollectionPath(
        businessId: businessId,
        storeId: storeId,
      ),
    );

    final String field = "${c.paymentCustomer}.${c.personPhone}";

    final Query query = collRef.where(
      field,
      isEqualTo: person.phone,
    );

    return query.snapshots().map(
          (snap) => snap.docs
              .map(
                (doc) => Payment.fromJson(
                  doc.data(),
                ),
              )
              .toBuiltList(),
        );
  }

  Stream<BuiltList<Payment>> streamPaymentsByPersonId({
    @required String businessId,
    @required String storeId,
    @required Person person,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.paymentCollectionPath(
        businessId: businessId,
        storeId: storeId,
      ),
    );

    final String field = "${c.paymentCustomer}.${c.personId}";

    final Query query = collRef.where(
      field,
      isEqualTo: person.id,
    );

    return query.snapshots().map(
          (snap) => snap.docs
              .map(
                (doc) => Payment.fromJson(
                  doc.data(),
                ),
              )
              .toBuiltList(),
        );
  }

  Stream<BuiltList<Payment>> streamPaymentsByBusinessMemberId({
    @required String businessId,
    @required String storeId,
    @required BusinessMember businessMember,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.paymentCollectionPath(
        businessId: businessId,
        storeId: storeId,
      ),
    );

    final String field = "${c.paymentCashier}.${c.businessPersonBusinessId}";

    final Query query = collRef.where(
      field,
      isEqualTo: businessMember.id,
    );

    return query.snapshots().map(
          (snap) => snap.docs
              .map(
                (doc) => Payment.fromJson(
                  doc.data(),
                ),
              )
              .toBuiltList(),
        );
  }
}
