import '../../data/link_result/link_result.dart';
import '../../side_effects/dynamic_link/dynamic_link.dart';

import './bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class DynamicLinkBloc extends Bloc<DynamicLinkEvent, DynamicLinkState> {
  final DynamicLink dynamicLink;
  DynamicLinkBloc({
    @required this.dynamicLink,
  })  : assert(dynamicLink != null),
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
          },
          absent: () async* {
            DynamicLinkState.absent();
          },
        );
      },
    );
  }
}
