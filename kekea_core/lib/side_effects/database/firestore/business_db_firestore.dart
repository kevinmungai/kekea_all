import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/business/business.dart';
import '../../../data/business_result/business_result.dart';
import '../../../utils/firestore_paths.dart';
import '../../../utils/constants.dart' as c;
import 'package:meta/meta.dart';

class BusinessDBFirestore {
  final FirebaseFirestore firestore;

  const BusinessDBFirestore({
    @required this.firestore,
  }) : assert(firestore != null);

  Business createBusinessDocument({
    @required Business business,
  }) {
    assert(business != null);

    final DocumentReference docRef =
        firestore.collection(businessCollectionPath).doc();

    final Business businessWithId = business.copyWith(id: docRef.id);

    docRef.set(businessWithId.toJson());

    return businessWithId;
  }

  /// the [id] cannot be updated and is considered immutable
  Business updateBusinessDocument({
    @required Business business,
  }) {
    assert(business != null, "business cannot be null");

    final DocumentReference docRef =
        firestore.doc(businessDocumentPath(business.id));

    docRef.set(
      business.toJson(),
      SetOptions(
        merge: true,
      ),
    );

    return business;
  }

  Stream<BuiltList<Business>> streamBusinessDocumentsByIds({
    @required BuiltList<String> businessIds,
  }) {
    assert(businessIds != null, "businessIds should not be null");
    assert(businessIds.isNotEmpty, "businessIds should not be null");

    final CollectionReference collRef =
        firestore.collection(businessCollectionPath);

    final Query query = collRef.where(
      c.businessId,
      whereIn: businessIds.asList(),
    );

    return query.snapshots().map(
          (QuerySnapshot snapshot) => BuiltList<Business>(
            snapshot.docs.map(
              (QueryDocumentSnapshot document) => Business.fromJson(
                document.data(),
              ),
            ),
          ),
        );
  }

  Stream<BusinessResult> streamBusinessDocumentById({
    @required String businessId,
  }) {
    assert(businessId != null, "businessId cannot be null");
    assert(businessId.isNotEmpty, "businessId cannot be empty");

    final DocumentReference docRef =
        firestore.doc(businessDocumentPath(businessId));

    return docRef.snapshots().map(
          (document) => document.exists
              ? BusinessResult.present(
                  Business.fromJson(
                    document.data(),
                  ),
                )
              : BusinessResult.absent(),
        );
  }
}
