import 'package:kekea_core/side_effects/database/firestore/payment_db_firestore.dart';
import 'package:kekea_core/utils/uri.dart';

import '../../data/link_result/link_result.dart';
import '../../side_effects/dynamic_link/dynamic_link.dart';

import './bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class DynamicLinkBloc extends Bloc<DynamicLinkEvent, DynamicLinkState> {
  final DynamicLink dynamicLink;
  final PaymentDBFirestore paymentDBFirestore;

  DynamicLinkBloc({
    @required this.dynamicLink,
    @required this.paymentDBFirestore,
  })  : assert(dynamicLink != null && paymentDBFirestore != null),
        super(DynamicLinkState.absent());

  @override
  Stream<DynamicLinkState> mapEventToState(
    DynamicLinkEvent event,
  ) async* {
    yield* event.when(
      checkForLink: () async* {
        final LinkResult linkResult = await dynamicLink.getLink();
        linkResult.when(
          present: (Uri uri) async* {
            DynamicLinkState.present(uri: uri);

            final bool isReceipt = isReceiptUri(uri);
          },
          absent: () async* {
            DynamicLinkState.absent();
          },
        );
      },
    );
  }
}
