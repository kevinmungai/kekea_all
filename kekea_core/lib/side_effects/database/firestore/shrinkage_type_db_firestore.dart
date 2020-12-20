import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/shrinkage_type/shrinkage_type.dart';
import 'package:meta/meta.dart';
import '../../../utils/firestore_paths.dart' as fp;

class ShrinkageTypeDBFirestore {
  final FirebaseFirestore firestore;

  const ShrinkageTypeDBFirestore({
    @required this.firestore,
  });

  Stream<ShrinkageType> streamShrinkageType({
    @required String shrinkageTypeId,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.shrinkageTypeDocumentPath(shrinkageTypeId),
    );

    return docRef.snapshots().map(
          (snap) => ShrinkageType.fromJson(
            snap.data(),
          ),
        );
  }

  Stream<List<ShrinkageType>> streamShrinkageTypes() {
    final CollectionReference collRef = firestore.collection(
      fp.shrinkageTypeCollectionPath,
    );

    return collRef.snapshots().map(
          (snap) => snap.docs.map(
            (doc) => ShrinkageType.fromJson(
              doc.data(),
            ),
          ),
        );
  }
}
