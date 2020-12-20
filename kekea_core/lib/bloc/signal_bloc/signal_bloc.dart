import 'package:kekea_core/data/product/product.dart';

import './bloc.dart';
import 'package:bloc/bloc.dart';

class SignalBloc extends Bloc<SignalEvent, SignalState> {
  SignalBloc() : super(SignalState.nothing());

  @override
  Stream<SignalState> mapEventToState(
    SignalEvent event,
  ) async* {
    yield* event.when(
      productUpdated: (Product product) async* {
        yield SignalState.productUpdated(product);
      },
    );
  }
}
