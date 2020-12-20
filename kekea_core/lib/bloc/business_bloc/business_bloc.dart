import '../../side_effects/database/firestore/business_db_firestore.dart';
import '../../data/business/business.dart';
import './bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  final BusinessDBFirestore businessDBFirestore;

  BusinessBloc({
    @required this.businessDBFirestore,
  })  : assert(businessDBFirestore != null),
        super(BusinessState.initial());

  @override
  Stream<BusinessState> mapEventToState(BusinessEvent event) async* {
    yield* event.when(
      updateBusiness: (Business business) async* {
        final updatedBusiness = businessDBFirestore.updateBusinessDocument(
          business: business,
        );
        yield BusinessState.businessUpdated(business: updatedBusiness);
      },
    );
  }
}
