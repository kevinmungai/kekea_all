import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/payment_product/payment_product.dart';
import 'package:meta/meta.dart';
import '../../../utils/constants.dart' as c;
import '../../../utils/firestore_paths.dart' as fp;

class PaymentProductDBFirestore {
  final FirebaseFirestore firestore;

  const PaymentProductDBFirestore({
    @required this.firestore,
  });

  BuiltList<PaymentProduct> createPaymentProducts({
    @required String businessId,
    @required String storeId,
    @required String paymentId,
    @required BuiltList<PaymentProduct> paymentProducts,
  }) {
    assert(businessId != null);
    assert(storeId != null);
    assert(paymentId != null);
    assert(paymentProducts != null);
    assert(paymentProducts.isNotEmpty);

    final CollectionReference collRef = firestore.collection(
      fp.paymentProductCollectionPath(
        businessId: businessId,
        storeId: storeId,
        paymentId: paymentId,
      ),
    );

    final BuiltList<PaymentProduct> paymentProductsWithId = paymentProducts
        .map(
          (paymentProduct) => paymentProduct.copyWith(
            id: collRef.doc().id,
          ),
        )
        .toBuiltList();

    paymentProductsWithId.forEach(
      (paymentProduct) => collRef.doc(paymentProduct.id).set(
            paymentProduct.toJson(),
            SetOptions(
              merge: false,
            ),
          ),
    );

    return paymentProductsWithId;
  }

  PaymentProduct createPaymentProduct({
    @required String businessId,
    @required String storeId,
    @required String paymentId,
    @required PaymentProduct paymentProduct,
  }) {
    final DocumentReference docRef = firestore
        .collection(
          fp.paymentProductCollectionPath(
            businessId: businessId,
            storeId: storeId,
            paymentId: paymentId,
          ),
        )
        .doc();

    final paymentProductWithId = paymentProduct.copyWith(
      id: docRef.id,
    );

    docRef.set(
      paymentProductWithId.toJson(),
      SetOptions(
        merge: false,
      ),
    );

    return paymentProductWithId;
  }

  Stream<BuiltList<PaymentProduct>> streamPaymentProducts({
    @required String businessId,
    @required String storeId,
    @required String paymentId,
  }) {
    assert(businessId != null);
    assert(storeId != null);
    assert(paymentId != null);

    final CollectionReference collRef = firestore.collection(
      fp.paymentProductCollectionPath(
        businessId: businessId,
        storeId: storeId,
        paymentId: paymentId,
      ),
    );

    return collRef.snapshots().map((snap) {
      final List<PaymentProduct> res = snap.docs
          .map(
            (doc) => PaymentProduct.fromJson(
              doc.data(),
            ),
          )
          .toList();

      return BuiltList<PaymentProduct>(res);
    });
  }

  PaymentProduct updatePaymentProduct({
    @required String businessId,
    @required String storeId,
    @required String paymentId,
    @required PaymentProduct paymentProduct,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.paymentProductDocumentPath(
        businessId: businessId,
        storeId: storeId,
        paymentId: paymentId,
        paymentProductId: paymentProduct.id,
      ),
    );

    docRef.set(
      paymentProduct.toJson(),
      SetOptions(
        mergeFields: [
          c.paymentProductName,
          c.paymentProductPrice,
          c.paymentProductTax,
          c.paymentProductRefId,
        ],
      ),
    );

    return paymentProduct;
  }
}
