import 'dart:async';

import '../../data/store/store.dart';
import '../../data/store_result/store_result.dart';
import '../../side_effects/database/firestore/store_db_firestore.dart';

import './bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class StoreStatusBloc extends Bloc<StoreStatusEvent, StoreStatusState> {
  final StoreDBFirestore storeDBFirestore;
  StreamSubscription<StoreResult> _streamSubscription;

  StoreStatusBloc({
    @required this.storeDBFirestore,
  })  : assert(storeDBFirestore != null),
        super(StoreStatusState.absent());

  @override
  Stream<StoreStatusState> mapEventToState(StoreStatusEvent event) async* {
    yield* event.when(
      listen: (String businessId, String storeId) async* {
        _streamSubscription?.cancel();
        _streamSubscription = storeDBFirestore
            .streamStore(
          businessId: businessId,
          storeId: storeId,
        )
            .listen(
          (StoreResult storeResult) {
            storeResult.when(
              present: (Store store) {
                add(StoreStatusEvent.setPresent(store: store));
              },
              absent: () {
                add(StoreStatusEvent.setAbsent());
              },
            );
          },
        );
      },
      setPresent: (Store store) async* {
        yield StoreStatusState.present(store: store);
      },
      setAbsent: () async* {
        yield StoreStatusState.absent();
      },
      stopListening: () async* {
        _streamSubscription?.cancel();
        yield StoreStatusState.absent();
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
