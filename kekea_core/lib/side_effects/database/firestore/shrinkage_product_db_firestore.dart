import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/shrinkage_product/shrinkage_product.dart';
import 'package:meta/meta.dart';
import '../../../utils/constants.dart' as c;
import '../../../utils/firestore_paths.dart' as fp;

class ShrinkageProductDBFirestore {
  final FirebaseFirestore firestore;

  const ShrinkageProductDBFirestore({
    @required this.firestore,
  });

  ShrinkageProduct createShrinkageProduct({
    @required String businessId,
    @required String storeId,
    @required String shrinkageId,
    @required ShrinkageProduct shrinkageProduct,
  }) {
    final DocumentReference docRef = firestore
        .collection(
          fp.shrinkageProductCollectionPath(
            businessId: businessId,
            storeId: storeId,
            shrinkageId: shrinkageId,
          ),
        )
        .doc();

    final shrinkageProductWithId = shrinkageProduct.copyWith(
      id: docRef.id,
    );

    docRef.set(
      shrinkageProductWithId.toJson(),
      SetOptions(merge: false),
    );

    return shrinkageProductWithId;
  }

  List<ShrinkageProduct> createShrinkageProducts({
    @required String businessId,
    @required String storeId,
    @required String shrinkageId,
    @required List<ShrinkageProduct> shrinkageProducts,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.shrinkageProductCollectionPath(
        businessId: businessId,
        storeId: storeId,
        shrinkageId: shrinkageId,
      ),
    );

    final shrinkageProductsWithIds = shrinkageProducts
        .map(
          (shrinkageProduct) => shrinkageProduct.copyWith(
            id: collRef.doc().id,
          ),
        )
        .toList();

    shrinkageProductsWithIds.forEach(
      (shrinkageProductWithId) => collRef
          .doc(
            shrinkageProductWithId.id,
          )
          .set(
            shrinkageProductWithId.toJson(),
            SetOptions(merge: false),
          ),
    );

    return shrinkageProductsWithIds;
  }

  ShrinkageProduct updateShrinkageProduct({
    @required String businessId,
    @required String storeId,
    @required String shrinkageId,
    @required ShrinkageProduct shrinkageProduct,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.shrinkageProductDocumentPath(
        businessId: businessId,
        storeId: storeId,
        shrinkageId: shrinkageId,
        shrinkageProductId: shrinkageProduct.id,
      ),
    );

    docRef.set(
      shrinkageProduct.toJson(),
      SetOptions(
        mergeFields: [
          c.shrinkageProductName,
          c.shrinkageProductQuantity,
          c.shrinkageProductRefId,
        ],
      ),
    );

    return shrinkageProduct;
  }

  Stream<List<ShrinkageProduct>> streamShrinkageProducts({
    @required String businessId,
    @required String storeId,
    @required String shrinkageId,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.shrinkageProductCollectionPath(
        businessId: businessId,
        storeId: storeId,
        shrinkageId: shrinkageId,
      ),
    );

    return collRef.snapshots().map(
          (snap) => snap.docs.map(
            (doc) => ShrinkageProduct.fromJson(
              doc.data(),
            ),
          ),
        );
  }

  Stream<List<ShrinkageProduct>> streamShrinkageProductsByRefId({
    @required String businessId,
    @required String storeId,
    @required String shrinkageId,
    @required String refId,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.shrinkageProductCollectionPath(
        businessId: businessId,
        storeId: storeId,
        shrinkageId: shrinkageId,
      ),
    );

    final Query query = collRef.where(
      c.shrinkageProductRefId,
      isEqualTo: refId,
    );

    return query.snapshots().map(
          (snap) => snap.docs.map(
            (doc) => ShrinkageProduct.fromJson(
              doc.data(),
            ),
          ),
        );
  }
}
