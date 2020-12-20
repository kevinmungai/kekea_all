import '../../data/store/store.dart';
import '../../side_effects/database/firestore/store_db_firestore.dart';

import './bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreDBFirestore storeDBFirestore;

  StoreBloc({
    @required this.storeDBFirestore,
  })  : assert(storeDBFirestore != null),
        super(StoreState.initial());

  @override
  Stream<StoreState> mapEventToState(StoreEvent event) async* {
    yield* event.when(
      createStore: (String businessId) async* {
        final Store store = storeDBFirestore.createStore(
          businessId: businessId,
          store: Store(),
        );
        yield StoreState.storeCreated(store: store);
      },
    );
  }
}
