import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/currency/currency.dart';
import 'package:meta/meta.dart';
import '../../../utils/firestore_paths.dart' as fp;

class CurrencyDBFirestore {
  final FirebaseFirestore firestore;

  const CurrencyDBFirestore({
    @required this.firestore,
  });

  Stream<Currency> streamCurrency({
    @required String currencyId,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.currencyDocumentPath(currencyId),
    );

    return docRef.snapshots().map(
          (snap) => Currency.fromJson(
            snap.data(),
          ),
        );
  }

  Stream<List<Currency>> streamCurrencies() {
    final CollectionReference collRef = firestore.collection(
      fp.currencyCollectionPath,
    );

    return collRef.snapshots().map(
          (snap) => snap.docs.map(
            (doc) => Currency.fromJson(
              doc.data(),
            ),
          ),
        );
  }
}
