import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../../utils/debug_print.dart';
import '../../bloc/business_person_status_bloc/business_person_status_bloc.dart';
import '../../bloc/signal_bloc/bloc.dart';
import '../../data/business_person/business_person.dart';
import '../../data/edit_product/edit_product.dart';
import '../../data/product/product.dart';
import '../../side_effects/database/firestore/product_db_firestore.dart';
import './bloc.dart';

class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
  final ProductDBFirestore productDBFirestore;
  final BusinessPersonStatusBloc businessPersonStatusBloc;
  final SignalBloc signalBloc;

  EditProductBloc({
    @required this.productDBFirestore,
    @required this.businessPersonStatusBloc,
    @required this.signalBloc,
  })  : assert(productDBFirestore != null &&
            businessPersonStatusBloc != null &&
            signalBloc != null),
        super(EditProductState.absent());

  @override
  Stream<EditProductState> mapEventToState(
    EditProductEvent event,
  ) async* {
    yield* event.when(
      loadProduct: (Product product) async* {
        yield EditProductState.present(
          editProduct: EditProduct(
            original: product,
            editable: product,
          ),
        );
      },
      reset: () async* {
        yield* state.when(
          present: (EditProduct editProduct) async* {
            yield EditProductState.present(
              editProduct: editProduct.copyWith(editable: editProduct.original),
            );
          },
          absent: () async* {},
        );
      },
      changeName: (String name) async* {
        yield* state.when(
          present: (EditProduct editProduct) async* {
            yield EditProductState.present(
              editProduct: editProduct.copyWith.editable(name: name),
            );
          },
          absent: () async* {},
        );
      },
      changeQuantity: (int quantity) async* {
        yield* state.when(
          present: (EditProduct editProduct) async* {
            yield EditProductState.present(
              editProduct: editProduct.copyWith.editable(
                quantity: quantity,
              ),
            );
          },
          absent: () async* {},
        );
      },
      changePriceAmount: (BigInt amount) async* {
        yield* state.when(
          present: (EditProduct editProduct) async* {
            yield EditProductState.present(
              editProduct: editProduct.copyWith.editable.price(
                amount: amount,
              ),
            );
          },
          absent: () async* {},
        );
      },
      setAbsent: () async* {
        yield EditProductState.absent();
      },
      submit: () async* {
        yield* state.when(
          present: (EditProduct editProduct) async* {
            yield* businessPersonStatusBloc.state.maybeWhen(
              present: (BusinessPerson businessPerson) async* {
                final Product updatedProduct = productDBFirestore.updateProduct(
                  businessId: businessPerson.defaultBusiness.id,
                  storeId: businessPerson.defaultStore.id,
                  newProduct: editProduct.editable,
                );

                signalBloc.add(
                  SignalEvent.productUpdated(updatedProduct),
                );
                add(EditProductEvent.setAbsent());
              },
              orElse: () async* {},
            );
          },
          absent: () async* {},
        );
      },
    );
  }

  @override
  void onTransition(Transition<EditProductEvent, EditProductState> transition) {
    dPrint(transition);
    super.onTransition(transition);
  }
}
