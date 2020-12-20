import '../data/business_person/business_person.dart';
import 'package:meta/meta.dart';

String getBusinessPerson({
  @required BusinessPerson businessPerson,
  @required BusinessPerson currentBusinessPerson,
}) {
  assert(businessPerson != null);
  assert(currentBusinessPerson != null);

  if (businessPerson.firebaseId == currentBusinessPerson.firebaseId) {
    return "You";
  }

  if (businessPerson.name != null) {
    return businessPerson.name;
  }

  return businessPerson.firebaseId;
}
