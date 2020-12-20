import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/business_member/business_member.dart';
import 'package:meta/meta.dart';
import '../../../utils/firestore_paths.dart' as fp;

class BusinessMemberDBFirestore {
  final FirebaseFirestore firestore;

  const BusinessMemberDBFirestore({
    @required this.firestore,
  });

  BusinessMember createBusinessMember({
    @required String businessId,
    @required BusinessMember businessMember,
  }) {
    assert(businessId != null, "businessId should not be null");
    assert(businessId.isNotEmpty, "businessId should not be empty");
    assert(businessMember != null);
    assert(businessMember.firebaseId != null, "firebaseId should not be null");
    assert(
        businessMember.firebaseId.isNotEmpty, "firebaseId should not be empty");

    final DocumentReference docRef = firestore
        .collection(
          fp.businessMemberCollectionPath(businessId),
        )
        .doc();

    final businessMemberWithId = businessMember.copyWith(id: docRef.id);

    docRef.set(
      businessMemberWithId.toJson(),
      SetOptions(merge: false),
    );

    return businessMemberWithId;
  }

  Stream<BuiltList<BusinessMember>> streamBusinessMembers({
    @required String businessId,
  }) {
    assert(businessId != null, "businessId should not be null");
    assert(businessId.isNotEmpty, "businessId should not be empty");

    final CollectionReference collRef = firestore.collection(
      fp.businessMemberCollectionPath(businessId),
    );

    return collRef.snapshots().map(
          (snap) => snap.docs
              .map(
                (doc) => BusinessMember.fromJson(
                  doc.data(),
                ),
              )
              .toBuiltList(),
        );
  }

  BusinessMember updateBusinessMember({
    @required String businessId,
    @required BusinessMember businessMember,
  }) {
    assert(businessId != null);
    assert(businessId.isNotEmpty);
    assert(businessMember != null);

    final DocumentReference docRef = firestore.doc(
      fp.businessMemberDocumentPath(
        businessId: businessId,
        businessMemberId: businessMember.id,
      ),
    );

    /// only setting the values of name, phone and email
    docRef.set(
      businessMember.toJson(),
      SetOptions(
        merge: true,
      ),
    );

    return businessMember;
  }
}
