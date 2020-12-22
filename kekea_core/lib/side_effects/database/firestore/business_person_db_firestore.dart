import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kekea_core/utils/debug_print.dart';
import '../../../data/business_person_result/business_person_result.dart';
import 'package:meta/meta.dart';
import '../../../data/business_person/business_person.dart';
import '../../../utils/firestore_paths.dart' as fp;

class BusinessPersonDBFirestore {
  final FirebaseFirestore firestore;

  const BusinessPersonDBFirestore({
    @required this.firestore,
  });

  /// a business_person must always have a firebase id
  BusinessPerson createBusinessPerson({
    @required BusinessPerson businessPerson,
  }) {
    assert(businessPerson != null);
    assert(businessPerson.firebaseId != null, "firebaseId cannot be null");
    assert(businessPerson.firebaseId.isNotEmpty, "firebaseId cannot be empty");

    final DocumentReference docRef = firestore.doc(
      fp.businessPersonDocumentPath(businessPerson.firebaseId),
    );

    docRef.set(
      businessPerson.toJson(),
      SetOptions(merge: true),
    );

    return businessPerson;
  }

  Stream<BusinessPersonResult> streamBusinessPerson({
    @required String firebaseId,
  }) {
    assert(firebaseId != null, "firebaseId should not be null");
    assert(firebaseId.isNotEmpty, "firebaseId should not be empty");

    final DocumentReference docRef = firestore.doc(
      fp.businessPersonDocumentPath(firebaseId),
    );

    return docRef.snapshots().map(
          (DocumentSnapshot snapshot) => snapshot.exists
              ? BusinessPersonResult.present(
                  BusinessPerson.fromJson(
                    snapshot.data(),
                  ),
                )
              : BusinessPersonResult.absent(
                  firebaseId: firebaseId,
                ),
        );
  }

  BusinessPerson updateBusinessPerson({
    @required BusinessPerson businessPerson,
  }) {
    assert(businessPerson != null);
    dPrint("businessPerson: $businessPerson");
    final DocumentReference docRef = firestore.doc(
      fp.businessPersonDocumentPath(businessPerson.firebaseId),
    );

    // docRef.set(
    //   businessPerson.toJson(),
    //   SetOptions(
    //     merge: true,
    //   ),
    // );

    docRef.update(businessPerson.toJson());
    dPrint("update succeeded");

    return businessPerson;
  }
}
