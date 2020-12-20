import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/payment_product/payment_product.dart';
import '../../../data/product/product.dart';
import 'package:meta/meta.dart';
import '../../../utils/constants.dart' as c;
import '../../../utils/firestore_paths.dart' as fp;

class ProductDBFirestore {
  final FirebaseFirestore firestore;

  const ProductDBFirestore({
    @required this.firestore,
  });

  Product createProduct({
    @required String businessId,
    @required String storeId,
    @required Product product,
  }) {
    assert(businessId != null);
    assert(storeId != null);
    assert(product != null);

    final DocumentReference docRef = firestore
        .collection(
          fp.productCollectionPath(
            businessId: businessId,
            storeId: storeId,
          ),
        )
        .doc();

    final Product productWithId = product.copyWith(id: docRef.id);

    docRef.set(
      productWithId.toJson(),
      SetOptions(merge: false),
    );

    return productWithId;
  }

  Stream<Product> streamProduct({
    @required String businessId,
    @required String storeId,
    @required String productId,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.productDocumentPath(
        businessId: businessId,
        storeId: storeId,
        productId: productId,
      ),
    );

    return docRef.snapshots().map(
          (snap) => Product.fromJson(
            snap.data(),
          ),
        );
  }

  Stream<BuiltList<Product>> streamProducts({
    @required String businessId,
    @required String storeId,
  }) {
    final CollectionReference collRef = firestore.collection(
      fp.productCollectionPath(
        businessId: businessId,
        storeId: storeId,
      ),
    );

    return collRef.snapshots().map(
          (snap) => BuiltList<Product>(
            snap.docs
                .map(
                  (doc) => Product.fromJson(
                    doc.data(),
                  ),
                )
                .toBuiltList(),
          ),
        );
  }

  Product updateProduct({
    @required String businessId,
    @required String storeId,
    @required Product newProduct,
  }) {
    assert(businessId != null);
    assert(storeId != null);
    assert(newProduct != null);
    assert(newProduct.id != null);

    final DocumentReference docRef = firestore.doc(
      fp.productDocumentPath(
        businessId: businessId,
        storeId: storeId,
        productId: newProduct.id,
      ),
    );

    docRef.set(
      newProduct.toJson(),
      SetOptions(
        merge: true,
      ),
    );
    return newProduct;
  }

  /**
   * Updates a list of Products via the PaymentProducts.
   * 
   * **NOTE: The PaymentProduct already contains the amount to decrement.**
   */
  BuiltList<PaymentProduct> updateSoldProducts({
    @required String businessId,
    @required String storeId,
    @required BuiltList<PaymentProduct> paymentProducts,
  }) {
    paymentProducts.forEach(
      (PaymentProduct paymentProduct) {
        firestore
            .doc(
          fp.productDocumentPath(
            businessId: businessId,
            storeId: storeId,
            productId: paymentProduct.refId,
          ),
        )
            .update(
          {
            c.productQuantity: FieldValue.increment(-paymentProduct.quantity),
          },
        );
      },
    );

    return paymentProducts;
  }
}
