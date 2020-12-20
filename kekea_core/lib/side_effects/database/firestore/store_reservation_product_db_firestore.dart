import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/store_reservation_product/store_reservation_product.dart';
import 'package:meta/meta.dart';
import '../../../utils/constants.dart' as c;
import '../../../utils/firestore_paths.dart' as fp;

class StoreReservationProductDBFirestore {
  final FirebaseFirestore firestore;

  const StoreReservationProductDBFirestore({
    @required this.firestore,
  });

  StoreReservationProduct createStoreReservationProduct({
    @required String businessId,
    @required String storeId,
    @required String storeReservationId,
    @required StoreReservationProduct storeReservationProduct,
  }) {
    final DocumentReference docRef = firestore
        .collection(
          fp.storeReservationProductCollectionPath(
            businessId: businessId,
            storeId: storeId,
            storeReservationId: storeReservationId,
          ),
        )
        .doc();

    final storeReservationProductWithId = storeReservationProduct.copyWith(
      id: docRef.id,
    );

    docRef.set(
      storeReservationProductWithId.toJson(),
      SetOptions(merge: false),
    );

    return storeReservationProductWithId;
  }

  List<StoreReservationProduct> createStoreReservationProducts({
    @required String businessId,
    @required String storeId,
    @required String storeReservationId,
    @required List<StoreReservationProduct> storeReservationProducts,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.storeReservationProductCollectionPath(
        businessId: businessId,
        storeId: storeId,
        storeReservationId: storeReservationId,
      ),
    );

    final List<StoreReservationProduct> storeReservationProductsWithIds =
        storeReservationProducts
            .map(
              (storeReservationProduct) => storeReservationProduct.copyWith(
                id: collRef.doc().id,
              ),
            )
            .toList();

    storeReservationProductsWithIds.forEach(
      (storeReservationProductWithId) => collRef
          .doc(
            storeReservationProductWithId.id,
          )
          .set(
            storeReservationProductWithId.toJson(),
            SetOptions(merge: false),
          ),
    );

    return storeReservationProductsWithIds;
  }

  Stream<List<StoreReservationProduct>> streamStoreReservationProducts({
    @required String businessId,
    @required String storeId,
    @required String storeReservationId,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.storeReservationProductCollectionPath(
        businessId: businessId,
        storeId: storeId,
        storeReservationId: storeReservationId,
      ),
    );

    return collRef.snapshots().map(
          (snap) => snap.docs.map(
            (doc) => StoreReservationProduct.fromJson(
              doc.data(),
            ),
          ),
        );
  }

  Stream<List<StoreReservationProduct>> streamStoreReservationProductsByRefId({
    @required String businessId,
    @required String storeId,
    @required String storeReservationId,
    @required String refId,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.storeReservationProductCollectionPath(
        businessId: businessId,
        storeId: storeId,
        storeReservationId: storeReservationId,
      ),
    );

    final Query query = collRef.where(
      c.storeReservationProductRefId,
      isEqualTo: refId,
    );

    return query.snapshots().map(
          (snap) => snap.docs.map(
            (doc) => StoreReservationProduct.fromJson(
              doc.data(),
            ),
          ),
        );
  }
}
