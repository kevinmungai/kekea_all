import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/business_member/business_member.dart';
import '../../../data/shrinkage/shrinkage.dart';
import 'package:meta/meta.dart';
import '../../../utils/constants.dart' as c;
import '../../../utils/firestore_paths.dart' as fp;

class ShrinkageDBFirestore {
  final FirebaseFirestore firestore;

  const ShrinkageDBFirestore({
    @required this.firestore,
  });

  Shrinkage createShrinkage({
    @required String businessId,
    @required String storeId,
    @required Shrinkage shrinkage,
    String description,
  }) {
    final DocumentReference docRef = firestore
        .collection(
          fp.shrinkageCollectionPath(
            businessId: businessId,
            storeId: storeId,
          ),
        )
        .doc();

    final shrinkageWithId = shrinkage.copyWith(id: docRef.id);

    docRef.set(
      shrinkageWithId.toJson(),
      SetOptions(merge: false),
    );

    return shrinkageWithId;
  }

  Shrinkage updateShrinkage({
    @required String businessId,
    @required String storeId,
    @required Shrinkage shrinkage,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.shrinkageDocumentPath(
        businessId: businessId,
        storeId: storeId,
        shrinkageId: shrinkage.id,
      ),
    );

    docRef.set(
      shrinkage.toJson(),
      SetOptions(
        mergeFields: [
          c.shrinkageOccurrenceTime,
          c.shrinkageDescription,
        ],
      ),
    );

    return shrinkage;
  }

  Stream<Shrinkage> streamShrinkage({
    @required String businessId,
    @required String storeId,
    @required String shrinkageId,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.shrinkageDocumentPath(
        businessId: businessId,
        storeId: storeId,
        shrinkageId: shrinkageId,
      ),
    );

    return docRef.snapshots().map(
          (snap) => Shrinkage.fromJson(
            snap.data(),
          ),
        );
  }

  Stream<List<Shrinkage>> streamShrinkages({
    @required String businessId,
    @required String storeId,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.shrinkageCollectionPath(
        businessId: businessId,
        storeId: storeId,
      ),
    );

    final Query query = collRef.orderBy(
      c.shrinkageOccurrenceTime,
    );

    return query.snapshots().map(
          (snap) => snap.docs.map(
            (doc) => Shrinkage.fromJson(
              doc.data(),
            ),
          ),
        );
  }

  Stream<List<Shrinkage>> streamShrinkagesByReporterId({
    @required String businessId,
    @required String storeId,
    @required BusinessMember reporter,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.shrinkageCollectionPath(
        businessId: businessId,
        storeId: storeId,
      ),
    );

    final field = "${c.shrinkageReporter}.${c.businessMemberId}";

    final Query query = collRef
        .where(
          field,
          isEqualTo: reporter.id,
        )
        .orderBy(
          c.shrinkageOccurrenceTime,
        );

    return query.snapshots().map(
          (snap) => snap.docs.map(
            (doc) => Shrinkage.fromJson(
              doc.data(),
            ),
          ),
        );
  }
}
