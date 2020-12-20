import '../../data/business_member/business_member.dart';
import '../../side_effects/database/firestore/business_member_db_firestore.dart';

import './bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class BusinessMemberBloc
    extends Bloc<BusinessMemberEvent, BusinessMemberState> {
  final BusinessMemberDBFirestore businessMemberDBFirestore;

  BusinessMemberBloc({
    @required this.businessMemberDBFirestore,
  })  : assert(businessMemberDBFirestore != null),
        super(BusinessMemberState.initial());

  @override
  Stream<BusinessMemberState> mapEventToState(
    BusinessMemberEvent event,
  ) async* {
    yield* event.when(
      create: (String businessId, BusinessMember businessMember) async* {
        final createdBusinessMember =
            businessMemberDBFirestore.createBusinessMember(
          businessId: businessId,
          businessMember: businessMember,
        );
        yield BusinessMemberState.created(
          businessMember: createdBusinessMember,
        );
      },
      update: (String businessId, BusinessMember businessMember) async* {
        final updatedBusinessMember =
            businessMemberDBFirestore.updateBusinessMember(
          businessId: businessId,
          businessMember: businessMember,
        );
        yield BusinessMemberState.updated(
          businessMember: updatedBusinessMember,
        );
      },
    );
  }
}
