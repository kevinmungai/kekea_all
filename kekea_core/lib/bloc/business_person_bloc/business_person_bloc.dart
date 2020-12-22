import 'package:kekea_core/utils/debug_print.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import '../../side_effects/database/firestore/business_person_db_firestore.dart';
import '../../data/business_person/business_person.dart';

class BusinessPersonBloc
    extends Bloc<BusinessPersonEvent, BusinessPersonState> {
  final BusinessPersonDBFirestore businessPersonDBFirestore;
  BusinessPersonBloc({
    @required this.businessPersonDBFirestore,
  })  : assert(businessPersonDBFirestore != null),
        super(BusinessPersonState.initial());

  @override
  Stream<BusinessPersonState> mapEventToState(
    BusinessPersonEvent event,
  ) async* {
    yield* event.when(
      createBusinessPerson: (BusinessPerson businessPerson) async* {
        final bizPerson = businessPersonDBFirestore.createBusinessPerson(
          businessPerson: businessPerson,
        );
        yield BusinessPersonState.createSuccess(
          businessPerson: bizPerson,
        );
      },
      updateBusinessPerson: (BusinessPerson businessPerson) async* {
        final updatedBusinessPerson =
            businessPersonDBFirestore.updateBusinessPerson(
          businessPerson: businessPerson,
        );
        dPrint("updatedBusinessPerson: $updatedBusinessPerson");
        yield BusinessPersonState.updateSuccess(
          businessPerson: updatedBusinessPerson,
        );
      },
    );
  }
}
