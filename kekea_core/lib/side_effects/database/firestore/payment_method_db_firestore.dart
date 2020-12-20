import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/payment_method/payment_method.dart';
import 'package:meta/meta.dart';
import '../../../utils/firestore_paths.dart' as fp;

class PaymentMethodDBFirestore {
  final FirebaseFirestore firestore;

  const PaymentMethodDBFirestore({
    @required this.firestore,
  });

  Stream<PaymentMethod> streamPaymentMethod({
    @required String paymentMethodId,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.paymentMethodDocumentPath(
        paymentMethodId,
      ),
    );

    return docRef.snapshots().map(
          (snap) => PaymentMethod.fromJson(
            snap.data(),
          ),
        );
  }

  Stream<BuiltList<PaymentMethod>> streamPaymentMethods() {
    final CollectionReference collRef = firestore.collection(
      fp.paymentMethodCollectionPath,
    );

    return collRef.snapshots().map(
          (snap) => snap.docs
              .map(
                (doc) => PaymentMethod.fromJson(
                  doc.data(),
                ),
              )
              .toBuiltList(),
        );
  }
}
