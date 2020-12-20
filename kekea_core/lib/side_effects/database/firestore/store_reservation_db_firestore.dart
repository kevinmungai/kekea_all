import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/business_member/business_member.dart';
import '../../../data/person/person.dart';
import '../../../data/store_reservation/store_reservation.dart';
import 'package:meta/meta.dart';
import '../../../utils/constants.dart' as c;
import '../../../utils/firestore_paths.dart' as fp;

class StoreReservationDBFirestore {
  final FirebaseFirestore firestore;

  const StoreReservationDBFirestore({
    @required this.firestore,
  });

  StoreReservation createStoreReservation({
    @required String businessId,
    @required String storeId,
    @required StoreReservation storeReservation,
  }) {
    final DocumentReference docRef = firestore
        .collection(
          fp.storeReservationCollectionPath(
            businessId: businessId,
            storeId: storeId,
          ),
        )
        .doc();

    final storeReservationWithId = storeReservation.copyWith(
      id: docRef.id,
    );

    docRef.set(
      storeReservationWithId.toJson(),
      SetOptions(merge: false),
    );

    return storeReservationWithId;
  }

  Stream<StoreReservation> streamStoreReservation({
    @required String businessId,
    @required String storeId,
    @required String storeReservationId,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.storeReservationDocumentPath(
        businessId: businessId,
        storeId: storeId,
        storeReservationId: storeReservationId,
      ),
    );

    return docRef.snapshots().map(
          (snap) => StoreReservation.fromJson(
            snap.data(),
          ),
        );
  }

  Stream<List<StoreReservation>> streamStoreReservations({
    @required String businessId,
    @required String storeId,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.storeReservationCollectionPath(
        businessId: businessId,
        storeId: storeId,
      ),
    );

    return collRef.snapshots().map(
          (snap) => snap.docs.map(
            (doc) => StoreReservation.fromJson(
              doc.data(),
            ),
          ),
        );
  }

  Stream<List<StoreReservation>> streamStoreReservationsByCustomerId({
    @required String businessId,
    @required String storeId,
    @required Person customer,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.storeReservationCollectionPath(
        businessId: businessId,
        storeId: storeId,
      ),
    );

    final String field = "${c.storeReservationCustomer}.${c.personId}";

    final Query query = collRef.where(
      field,
      isEqualTo: customer.id,
    );

    return query.snapshots().map(
          (snap) => snap.docs.map(
            (doc) => StoreReservation.fromJson(
              doc.data(),
            ),
          ),
        );
  }

  Stream<List<StoreReservation>> streamStoreReservationsByCustomerPhone({
    @required String businessId,
    @required String storeId,
    @required Person customer,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.storeReservationCollectionPath(
        businessId: businessId,
        storeId: storeId,
      ),
    );

    final String field = "${c.storeReservationCustomer}.${c.personPhone}";

    final Query query = collRef.where(
      field,
      isEqualTo: customer.phone,
    );

    return query.snapshots().map(
          (snap) => snap.docs.map(
            (doc) => StoreReservation.fromJson(
              doc.data(),
            ),
          ),
        );
  }

  Stream<List<StoreReservation>> streamStoreReservationByCashierId({
    @required String businessId,
    @required String storeId,
    @required BusinessMember cashier,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.storeReservationCollectionPath(
        businessId: businessId,
        storeId: storeId,
      ),
    );

    final field = "${c.storeReservationCashier}.${c.businessMemberId}";

    final Query query = collRef.where(
      field,
      isEqualTo: cashier.id,
    );

    return query.snapshots().map(
          (snap) => snap.docs.map(
            (doc) => StoreReservation.fromJson(
              doc.data(),
            ),
          ),
        );
  }

  Stream<List<StoreReservation>> streamStoreReservationValidReservations({
    @required String businessId,
    @required String storeId,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.storeReservationCollectionPath(
        businessId: businessId,
        storeId: storeId,
      ),
    );

    final Query query = collRef
        .where(
          c.storeReservationEndTime,
          isGreaterThan: Timestamp.now(),
        )
        .orderBy(c.storeReservationEndTime);

    return query.snapshots().map(
          (snap) => snap.docs.map(
            (doc) => StoreReservation.fromJson(
              doc.data(),
            ),
          ),
        );
  }

  Stream<List<StoreReservation>> streamStoreReservationExpiredReservations({
    @required String businessId,
    @required String storeId,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.storeReservationCollectionPath(
        businessId: businessId,
        storeId: storeId,
      ),
    );

    final Query query = collRef
        .where(
          c.storeReservationEndTime,
          isLessThan: Timestamp.now(),
        )
        .orderBy(c.storeReservationEndTime);

    return query.snapshots().map(
          (snap) => snap.docs.map(
            (doc) => StoreReservation.fromJson(
              doc.data(),
            ),
          ),
        );
  }

  StoreReservation updateStoreReservation({
    @required String businessId,
    @required String storeId,
    @required StoreReservation storeReservation,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.storeReservationDocumentPath(
        businessId: businessId,
        storeId: storeId,
        storeReservationId: storeReservation.id,
      ),
    );

    docRef.set(
      storeReservation.toJson(),
      SetOptions(
        mergeFields: [
          c.storeReservationCustomer,
          c.storeReservationCashier,
          c.storeReservationEndTime,
          c.storeReservationStartTime,
          c.storeReservationEndTime,
        ],
      ),
    );

    return storeReservation;
  }
}
