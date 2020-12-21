import '../../data/business_person/business_person.dart';
import '../../data/currency/currency.dart';
import '../../data/price/price.dart';
import '../../data/product/product.dart';
import '../../side_effects/database/firestore/product_db_firestore.dart';
import '../../bloc/business_person_status_bloc/bloc.dart';

import 'bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final ProductDBFirestore productDBFirestore;
  final BusinessPersonStatusBloc businessPersonStatusBloc;

  CreateProductBloc({
    @required this.productDBFirestore,
    @required this.businessPersonStatusBloc,
  })  : assert(productDBFirestore != null && businessPersonStatusBloc != null),
        super(CreateProductState.initial());

  @override
  Stream<CreateProductState> mapEventToState(CreateProductEvent event) async* {
    yield* event.when(
      changeName: (String name) async* {
        yield* state.maybeWhen(
          currentProduct: (Product product) async* {
            yield CreateProductState.currentProduct(
              product: product.copyWith(name: name),
            );
          },
          orElse: () async* {
            yield CreateProductState.currentProduct(
              product: Product(name: name),
            );
          },
        );
      },
      changePriceAmount: (BigInt amount) async* {
        yield* state.maybeWhen(
          currentProduct: (Product product) async* {
            if (product.price != null) {
              yield CreateProductState.currentProduct(
                product: product.copyWith(
                  price: product.price.copyWith(
                    amount: amount,
                  ),
                ),
              );
            } else {
              yield CreateProductState.currentProduct(
                product: product.copyWith(
                  price: Price(
                    amount: amount,
                    currency: Currency(text: "KES"),
                  ),
                ),
              );
            }
          },
          orElse: () async* {
            yield CreateProductState.currentProduct(
              product: Product(
                price: Price(
                  amount: amount,
                  currency: Currency(text: "KES"),
                ),
              ),
            );
          },
        );
      },
      changeQuantity: (int quantity) async* {
        yield* state.maybeWhen(
          currentProduct: (Product product) async* {
            yield CreateProductState.currentProduct(
              product: product.copyWith(quantity: quantity),
            );
          },
          orElse: () async* {
            yield CreateProductState.currentProduct(
              product: Product(quantity: quantity),
            );
          },
        );
      },
      createProduct: () async* {
        yield* state.maybeWhen(
          currentProduct: (Product product) async* {
            yield* businessPersonStatusBloc.state.maybeWhen(
              present: (BusinessPerson businessPerson) async* {
                final Product createdProduct = productDBFirestore.createProduct(
                  businessId: businessPerson.defaultBusiness.id,
                  storeId: businessPerson.defaultStore.id,
                  product: product,
                );
                yield CreateProductState.created(product: createdProduct);
              },
              orElse: () async* {
                yield CreateProductState.cannotCreateProduct();
              },
            );
          },
          orElse: () async* {
            yield CreateProductState.cannotCreateProduct();
          },
        );
      },
    );
  }
}
