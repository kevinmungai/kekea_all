import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/tax/tax.dart';
import 'package:meta/meta.dart';
import '../../../utils/firestore_paths.dart' as fp;

class TaxDBFirestore {
  final FirebaseFirestore firestore;

  const TaxDBFirestore({
    @required this.firestore,
  });

  Stream<Tax> streamTax({
    @required String taxId,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.taxDocumentPath(taxId),
    );

    return docRef.snapshots().map(
          (snap) => Tax.fromJson(
            snap.data(),
          ),
        );
  }

  Stream<BuiltList<Tax>> streamTaxes() {
    final CollectionReference collRef = firestore.collection(
      fp.taxCollectionPath,
    );

    return collRef.snapshots().map(
          (snap) => BuiltList<Tax>(
            snap.docs
                .map(
                  (doc) => Tax.fromJson(
                    doc.data(),
                  ),
                )
                .toBuiltList(),
          ),
        );
  }
}
