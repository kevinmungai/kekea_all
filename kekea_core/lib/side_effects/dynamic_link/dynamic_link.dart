import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:kekea_core/data/business/business.dart';
import 'package:kekea_core/data/link_result/link_result.dart';
import 'package:kekea_core/data/payment/payment.dart';
import 'package:kekea_core/formatters/date_formatter.dart';
import 'package:kekea_core/utils/uri.dart';
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

  Future<Payment> createDynamicLink({
    @required Payment payment,
    @required Business business,
  }) async {
    assert(payment != null);
    assert(payment.id != null);
    assert(payment.id.isNotEmpty);
    assert(business != null);
    assert(business.id != null);
    assert(business.id.isNotEmpty);

    /// TODO: MAKE SURE TO ADD BUSINESS NAME
    // assert(business.name != null);
    // assert(business.name.isNotEmpty);

    final String bizName = business?.name ?? business.id;

    final String dateTime = getDateFormat(payment.timestamp.toDate());
    final Uri uri = getReceiptUri(payment.id);
    final DynamicLinkParameters dynamicLinkParameters = DynamicLinkParameters(
      link: uri,
      uriPrefix: getPageLink().toString(),
      androidParameters: AndroidParameters(
        packageName: packageNameCustomer,
      ),
      // iosParameters: IosParameters(
      //   bundleId: bundleIdCustomer,
      // ),
      googleAnalyticsParameters: GoogleAnalyticsParameters(
        campaign: "receipts",
        content: payment.id,
        medium: "link-sms",
        source: "${business.id} $bizName",
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        description: "Receipt from $bizName at $dateTime",
        title: "Receipt",
      ),
    );

    final ShortDynamicLink shortDynamicLink =
        await dynamicLinkParameters.buildShortLink();

    dPrint(shortDynamicLink.warnings);

    return payment.copyWith(
      shortUri: shortDynamicLink.shortUrl,
      uri: uri,
    );
  }
}
