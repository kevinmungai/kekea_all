import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../utils/sale_product_utils/add_or_replace.dart';
import '../../utils/sale_product_utils/update_sale_products.dart';
import '../../data/discount/discount.dart';
import '../../data/price/price.dart';
import '../../data/product/product.dart';
import '../../data/sale_product/sale_product.dart';
import '../../side_effects/database/firestore/product_db_firestore.dart';

import 'bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class ProductListStatusBloc
    extends Bloc<ProductListStatusEvent, ProductListStatusState> {
  final ProductDBFirestore productDBFirestore;

  StreamSubscription<BuiltList<Product>> _streamSubscription;

  ProductListStatusBloc({
    @required this.productDBFirestore,
  })  : assert(productDBFirestore != null),
        super(ProductListStatusState.loading());

  @override
  Stream<ProductListStatusState> mapEventToState(
    ProductListStatusEvent event,
  ) async* {
    yield* event.when(
      listen: (String businessId, String storeId) async* {
        _streamSubscription?.cancel();
        _streamSubscription = productDBFirestore
            .streamProducts(
          businessId: businessId,
          storeId: storeId,
        )
            .listen(
          (BuiltList<Product> products) {
            add(ProductListStatusEvent.setPresent(products: products));
          },
        );
      },
      stopListening: () async* {
        _streamSubscription?.cancel();
        yield ProductListStatusState.loading();
      },
      setPresent: (BuiltList<Product> products) async* {
        yield* state.maybeWhen(
          present: (
            BuiltList<SaleProduct> saleProducts,
            _,
            bool showSelected,
          ) async* {
            final BuiltList<SaleProduct> updatedSaleProducts =
                updateSaleProduct(
              saleProducts: saleProducts,
              products: products,
            );
            yield ProductListStatusState.present(
              saleProducts: updatedSaleProducts,
              selectedProducts: getSelectedSaleProducts(
                saleProducts: updatedSaleProducts,
              ),
              showSelected: showSelected,
            );
          },
          orElse: () async* {
            yield ProductListStatusState.present(
              saleProducts: products
                  .map(
                    (product) => SaleProduct(
                      product: product,
                      quantity: 0,
                    ),
                  )
                  .toBuiltList(),
              selectedProducts: BuiltList<SaleProduct>([]),
              showSelected: false,
            );
          },
        );
      },
      cancel: () async* {
        yield* state.maybeWhen(
          present: (
            BuiltList<SaleProduct> saleProducts,
            _,
            bool showSelected,
          ) async* {
            yield ProductListStatusState.present(
              saleProducts: saleProducts
                  .map(
                    (saleProduct) => saleProduct.copyWith(
                      quantity: 0,
                      discount: null,
                    ),
                  )
                  .toBuiltList(),
              selectedProducts: BuiltList<SaleProduct>([]),
              showSelected: false,
            );
          },
          orElse: () async* {},
        );
      },
      toggleSelected: () async* {
        yield* state.maybeWhen(
          present: (
            BuiltList<SaleProduct> saleProducts,
            BuiltList<SaleProduct> selectedProducts,
            bool showSelected,
          ) async* {
            yield ProductListStatusState.present(
              saleProducts: saleProducts,
              selectedProducts: selectedProducts,
              showSelected: !showSelected,
            );
          },
          orElse: () async* {},
        );
      },
      addSaleQuantity: (SaleProduct saleProduct) async* {
        yield* state.maybeWhen(
          present: (
            BuiltList<SaleProduct> saleProducts,
            _,
            bool showSelected,
          ) async* {
            final BuiltList<SaleProduct> updatedSaleProducts = addOrReplace(
              saleProducts: saleProducts,
              saleProduct: saleProduct.copyWith(
                quantity: saleProduct.quantity < saleProduct.product.quantity
                    ? saleProduct.quantity + 1
                    : saleProduct.product.quantity,
              ),
            );
            yield ProductListStatusState.present(
              saleProducts: updatedSaleProducts,
              selectedProducts: getSelectedSaleProducts(
                saleProducts: updatedSaleProducts,
              ),
              showSelected: showSelected,
            );
          },
          orElse: () async* {},
        );
      },
      minusSaleQuantity: (SaleProduct saleProduct) async* {
        yield* state.maybeWhen(
          present: (
            BuiltList<SaleProduct> saleProducts,
            _,
            showSelected,
          ) async* {
            final BuiltList<SaleProduct> updatedSaleProducts = addOrReplace(
              saleProducts: saleProducts,
              saleProduct: saleProduct.copyWith(
                quantity:
                    saleProduct.quantity > 0 ? saleProduct.quantity - 1 : 0,
              ),
            );
            yield ProductListStatusState.present(
              saleProducts: updatedSaleProducts,
              selectedProducts: getSelectedSaleProducts(
                saleProducts: updatedSaleProducts,
              ),
              showSelected: showSelected,
            );
          },
          orElse: () async* {},
        );
      },
      selectAllSaleProduct: (SaleProduct saleProduct) async* {
        yield* state.maybeWhen(
          present: (
            BuiltList<SaleProduct> saleProducts,
            _,
            showSelected,
          ) async* {
            final BuiltList<SaleProduct> updatedSaleProducts = addOrReplace(
              saleProducts: saleProducts,
              saleProduct: saleProduct.copyWith(
                quantity: saleProduct.product.quantity,
              ),
            );
            yield ProductListStatusState.present(
              saleProducts: updatedSaleProducts,
              selectedProducts: getSelectedSaleProducts(
                saleProducts: updatedSaleProducts,
              ),
              showSelected: showSelected,
            );
          },
          orElse: () async* {},
        );
      },
      changeDiscount: (String productId, BigInt amount) async* {
        yield* state.maybeWhen(
          present: (
            BuiltList<SaleProduct> saleProducts,
            _,
            bool showSelected,
          ) async* {
            final int possibleIndex = saleProducts.indexWhere(
              (SaleProduct saleProduct) => saleProduct.product.id == productId,
            );
            if (possibleIndex != -1) {
              final SaleProduct saleProduct = saleProducts[possibleIndex];
              if (saleProduct != null) {
                final BuiltList<SaleProduct> updatedSaleProducts = addOrReplace(
                  providedIndex: possibleIndex,
                  saleProducts: saleProducts,
                  saleProduct: saleProduct.copyWith(
                    discount: Discount(
                      price: Price(
                        amount: amount,
                      ),
                    ),
                  ),
                );

                yield ProductListStatusState.present(
                  saleProducts: updatedSaleProducts,
                  selectedProducts: getSelectedSaleProducts(
                    saleProducts: updatedSaleProducts,
                  ),
                  showSelected: showSelected,
                );
              }
            }
          },
          orElse: () async* {},
        );
      },
      cancelDiscount: (String productId) async* {
        yield* state.maybeWhen(
          present: (
            BuiltList<SaleProduct> saleProducts,
            _,
            bool showSelected,
          ) async* {
            final int possibleIndex = saleProducts.indexWhere(
              (SaleProduct saleProduct) => saleProduct.product.id == productId,
            );

            if (possibleIndex != -1) {
              final BuiltList<SaleProduct> updatedSaleProducts = addOrReplace(
                saleProducts: saleProducts,
                saleProduct: saleProducts[possibleIndex].copyWith(
                  discount: null,
                ),
              );
              yield ProductListStatusState.present(
                saleProducts: updatedSaleProducts,
                selectedProducts: getSelectedSaleProducts(
                  saleProducts: updatedSaleProducts,
                ),
                showSelected: showSelected,
              );
            }
          },
          orElse: () async* {},
        );
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  @override
  void onTransition(
    Transition<ProductListStatusEvent, ProductListStatusState> transition,
  ) {
    super.onTransition(transition);
  }

  @override
  void onEvent(ProductListStatusEvent event) {
    super.onEvent(event);
  }
}
