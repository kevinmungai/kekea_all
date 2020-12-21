import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kekea_core/data/business/business.dart';
import 'package:kekea_core/data/business_person/business_person.dart';
import 'package:kekea_core/data/customer/customer.dart';
import 'package:kekea_core/data/payment/payment.dart';
import 'package:kekea_core/data/payment_method/payment_method.dart';
import 'package:kekea_core/data/place/place.dart';
import 'package:kekea_core/data/price/price.dart';
import 'package:kekea_core/data/store/store.dart';
import '../../../lib/side_effects/dynamic_link/dynamic_link.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final Business business = Business(
    id: "2343",
    name: "Wakamau Store",
  );

  final Store store = Store(
    id: "dfih9d",
    name: "first store",
    place: Place(
      geoPoint: GeoPoint(23, 32),
      description: "description",
      directions: "some directions",
      extraInfo: "extra information",
      propertyName: "the property name",
      streetName: "street name is here",
    ),
  );

  final Payment payment = Payment(
    cashier: BusinessPerson(
      firebaseId: "firebase-id",
    ),
    customer: Customer(
      phone: "0715761632",
    ),
    paymentMethod: PaymentMethod.cash(
      amountGiven: BigInt.from(200),
      change: BigInt.from(20),
      total: BigInt.from(180),
    ),
    price: Price(
      amount: BigInt.from(180),
    ),
    timestamp: Timestamp.now(),
    business: business,
    store: store,
    id: "payment_id_1",
  );

  /// CANNOT RUN THE TEST HERE!! HAS TO BE DONE INSIDE A PROJECT THAT HAS
  /// THE PLUGIN INSTALLED
}
