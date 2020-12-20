import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/store_result/store_result.dart';
import 'package:meta/meta.dart';
import '../../../utils/firestore_paths.dart' as fp;
import '../../../data/store/store.dart';
import '../../../utils/constants.dart' as c;

class StoreDBFirestore {
  final FirebaseFirestore firestore;

  const StoreDBFirestore({
    @required this.firestore,
  });

  Store createStore({
    @required String businessId,
    @required Store store,
  }) {
    assert(businessId != null);
    assert(businessId.isNotEmpty);

    final DocumentReference docRef = firestore
        .collection(
          fp.storeCollectionPath(businessId),
        )
        .doc();

    final Store storeWithId = store.copyWith(id: docRef.id);

    docRef.set(
      storeWithId.toJson(),
      SetOptions(merge: false),
    );

    return storeWithId;
  }

  Store updateStore({
    @required String businessId,
    @required Store store,
  }) {
    assert(businessId != null);
    assert(businessId.isNotEmpty);
    assert(store != null);

    final DocumentReference docRef = firestore
        .collection(
          fp.storeCollectionPath(businessId),
        )
        .doc(store.id);

    docRef.set(
      store.toJson(),
      SetOptions(
        mergeFields: [
          c.storeName,
          c.storePlace,
        ],
      ),
    );

    return store;
  }

  Stream<StoreResult> streamStore({
    @required String businessId,
    @required String storeId,
  }) {
    assert(businessId != null);
    assert(storeId != null);

    final DocumentReference docRef = firestore.doc(
      fp.storeDocumentPath(
        businessId: businessId,
        storeId: storeId,
      ),
    );

    return docRef.snapshots().map(
          (snap) => snap.exists
              ? StoreResult.present(
                  store: Store.fromJson(
                    snap.data(),
                  ),
                )
              : StoreResult.absent(),
        );
  }

  Stream<BuiltList<Store>> streamStores({
    @required String businessId,
  }) {
    assert(businessId != null);

    final CollectionReference collRef = firestore.collection(
      fp.storeCollectionPath(businessId),
    );

    return collRef.snapshots().map(
          (snap) => BuiltList<Store>(
            snap.docs
                .map(
                  (doc) => Store.fromJson(
                    doc.data(),
                  ),
                )
                .toBuiltList(),
          ),
        );
  }
}
