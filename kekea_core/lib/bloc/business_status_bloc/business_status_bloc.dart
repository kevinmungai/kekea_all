import 'dart:async';

import '../../data/business/business.dart';
import '../../data/business_result/business_result.dart';
import '../../side_effects/database/firestore/business_db_firestore.dart';

import './bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class BusinessStatusBloc
    extends Bloc<BusinessStatusEvent, BusinessStatusState> {
  final BusinessDBFirestore businessDBFirestore;
  StreamSubscription<BusinessResult> _streamSubscription;

  BusinessStatusBloc({
    @required this.businessDBFirestore,
  })  : assert(businessDBFirestore != null),
        super(BusinessStatusState.absent());

  @override
  Stream<BusinessStatusState> mapEventToState(
    BusinessStatusEvent event,
  ) async* {
    yield* event.when(
      listen: (String businessId) async* {
        _streamSubscription?.cancel();
        _streamSubscription = businessDBFirestore
            .streamBusinessDocumentById(businessId: businessId)
            .listen(
          (BusinessResult businessResult) {
            businessResult.when(
              present: (Business business) {
                add(BusinessStatusEvent.setPresent(business: business));
              },
              absent: () {
                add(BusinessStatusEvent.setAbsent());
              },
            );
          },
          onError: (error) {
            add(BusinessStatusEvent.setError());
          },
        );
      },
      setPresent: (Business business) async* {
        yield BusinessStatusState.present(business: business);
      },
      setAbsent: () async* {
        yield BusinessStatusState.absent();
      },
      setError: () async* {
        yield* state.when(
          present: (Business business) async* {
            yield state;
          },
          absent: () async* {
            yield state;
          },
        );
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
