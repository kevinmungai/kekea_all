import 'package:kekea_core/bloc/receipt_detail_bloc/bloc.dart';
import 'package:kekea_core/utils/uri.dart';

import 'package:kekea_core/data/link_result/link_result.dart';
import 'package:kekea_core/side_effects/dynamic_link/dynamic_link.dart';

import './bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class DynamicLinkBloc extends Bloc<DynamicLinkEvent, DynamicLinkState> {
  final DynamicLink dynamicLink;
  final ReceiptDetailBloc receiptDetailBloc;

  DynamicLinkBloc({
    @required this.dynamicLink,
    @required this.receiptDetailBloc,
  })  : assert(dynamicLink != null && receiptDetailBloc != null),
        super(DynamicLinkState.absent());

  @override
  Stream<DynamicLinkState> mapEventToState(
    DynamicLinkEvent event,
  ) async* {
    yield* event.when(
      checkForLink: () async* {
        final LinkResult linkResult = await dynamicLink.getLink();
        yield* linkResult.when(
          present: (Uri uri) async* {
            yield DynamicLinkState.present(uri: uri);
            if (isReceiptUri(uri)) {
              receiptDetailBloc.add(
                ReceiptDetailEvent.listenByUri(uri: uri),
              );
            }
          },
          absent: () async* {
            yield DynamicLinkState.absent();
          },
        );
      },
    );
  }
}
