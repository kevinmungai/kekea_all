import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/business_person_business/business_person_business.dart';
import '../../../data/business_person_business_result/business_person_business_result.dart';
import 'package:meta/meta.dart';
import '../../../utils/firestore_paths.dart' as fp;
import '../../../utils/constants.dart' as c;

class BusinessPersonBusinessesDBFirestore {
  final FirebaseFirestore firestore;

  const BusinessPersonBusinessesDBFirestore({
    @required this.firestore,
  });

  BusinessPersonBusiness createBusinessPersonBusiness({
    @required String businessPersonId,
    @required BusinessPersonBusiness businessPersonBusinesses,
  }) {
    assert(businessPersonId != null);
    assert(businessPersonBusinesses != null);

    final DocumentReference docRef = firestore.doc(
      fp.businessPersonBusinessesDocumentPath(
        businessPersonId: businessPersonId,
        businessPersonBusinessesId: businessPersonBusinesses.id,
      ),
    );

    final businessPersonBusinessesWithId = businessPersonBusinesses.copyWith(
      id: docRef.id,
    );

    docRef.set(
      businessPersonBusinessesWithId.toJson(),
      SetOptions(
        merge: false,
      ),
    );

    return businessPersonBusinessesWithId;
  }

  Stream<BusinessPersonBusinessResult> streamBusinessPersonBusinessById({
    @required String businessPersonId,
    @required String businessPersonBusinessesId,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.businessPersonBusinessesDocumentPath(
        businessPersonId: businessPersonId,
        businessPersonBusinessesId: businessPersonBusinessesId,
      ),
    );

    return docRef.snapshots().map(
          (snap) => snap.exists
              ? BusinessPersonBusinessResult.present(
                  businessPersonBusiness: BusinessPersonBusiness.fromJson(
                    snap.data(),
                  ),
                )
              : BusinessPersonBusinessResult.absent(),
        );
  }

  Stream<BuiltList<BusinessPersonBusiness>> streamBusinessPersonBusinessAll({
    @required String businessPersonId,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.businessPersonBusinessesCollectionPath(businessPersonId),
    );

    final Query query = collRef.orderBy(c.businessPersonBusinessDefault);

    return query.snapshots().map(
          (snap) => snap.docs
              .map(
                (doc) => BusinessPersonBusiness.fromJson(
                  doc.data(),
                ),
              )
              .toBuiltList(),
        );
  }

  Stream<BusinessPersonBusinessResult> streamBusinessPersonBusinessDefault({
    @required String businessPersonBusinessId,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.businessPersonBusinessesCollectionPath(businessPersonBusinessId),
    );

    final Query query = collRef
        .where(
          c.businessPersonBusinessDefault,
          isEqualTo: c.businessPersonBusinessDefaultValue,
        )
        .orderBy(c.businessPersonBusinessDefault)
        .limit(1);

    return query.snapshots().map(
          (snap) => snap.docs.isNotEmpty
              ? BusinessPersonBusinessResult.present(
                  businessPersonBusiness: BusinessPersonBusiness.fromJson(
                    snap.docs.first.data(),
                  ),
                )
              : BusinessPersonBusinessResult.absent(),
        );
  }

  BusinessPersonBusiness updateBusinessPersonBusiness({
    @required String businessPersonId,
    @required BusinessPersonBusiness businessPersonBusiness,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.businessPersonBusinessesDocumentPath(
        businessPersonId: businessPersonId,
        businessPersonBusinessesId: businessPersonBusiness.id,
      ),
    );

    docRef.set(
      businessPersonBusiness.toJson(),
      SetOptions(
        merge: true,
      ),
    );

    return businessPersonBusiness;
  }

  BusinessPersonBusiness setDefaultBusinessPersonBusiness({
    @required String businessPersonId,
    @required BusinessPersonBusiness businessPersonBusiness,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.businessPersonBusinessesDocumentPath(
        businessPersonId: businessPersonId,
        businessPersonBusinessesId: businessPersonBusiness.id,
      ),
    );

    final defaultBusinessPersonBusiness = businessPersonBusiness.copyWith(
      def: c.businessPersonBusinessDefaultValue,
    );

    docRef.set(
      defaultBusinessPersonBusiness.toJson(),
      SetOptions(
        mergeFields: [
          c.businessPersonBusinessDefault,
        ],
      ),
    );

    return defaultBusinessPersonBusiness;
  }

  BusinessPersonBusiness removeDefaultBusinessPersonBusiness({
    @required String businessPersonId,
    @required BusinessPersonBusiness businessPersonBusiness,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.businessPersonBusinessesDocumentPath(
        businessPersonId: businessPersonId,
        businessPersonBusinessesId: businessPersonBusiness.id,
      ),
    );

    final updatedBusinessPersonBusiness = businessPersonBusiness.copyWith(
      def: null,
    );

    docRef.set(
      updatedBusinessPersonBusiness.toJson(),
      SetOptions(
        mergeFields: [
          c.businessPersonBusinessDefault,
        ],
      ),
    );

    return updatedBusinessPersonBusiness;
  }
}
