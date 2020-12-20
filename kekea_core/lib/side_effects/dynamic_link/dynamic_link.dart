import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:kekea_core/data/link_result/link_result.dart';
import '../../utils/debug_print.dart';
import 'package:meta/meta.dart';

class DynamicLink {
  final FirebaseDynamicLinks dynamicLinks;

  const DynamicLink({
    @required this.dynamicLinks,
  }) : assert(dynamicLinks != null);

  Future<LinkResult> getLink() async {
    LinkResult linkResult = LinkResult.absent();
    dynamicLinks.onLink(
      onSuccess: (PendingDynamicLinkData pendingDynamicLinkData) async {
        final Uri uri = pendingDynamicLinkData?.link;
        if (uri != null) {
          linkResult = LinkResult.present(uri: uri);
        }
      },
      onError: (OnLinkErrorException onLinkErrorException) async {
        dPrint(onLinkErrorException);
      },
    );

    return linkResult;
  }
}
