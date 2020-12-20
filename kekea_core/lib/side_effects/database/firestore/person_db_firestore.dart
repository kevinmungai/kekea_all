import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/person/person.dart';
import 'package:meta/meta.dart';
import '../../../utils/firestore_paths.dart' as fp;
import '../../../utils/constants.dart' as c;

class PersonDBFirestore {
  final FirebaseFirestore firestore;

  const PersonDBFirestore({
    @required this.firestore,
  });

  Person createPerson({
    @required String phone,
    String name,
    String email,
  }) {
    assert(phone != null);
    assert(phone.isNotEmpty);

    final DocumentReference docRef =
        firestore.collection(fp.personCollectionPath).doc();

    final person = Person(
      id: docRef.id,
      phone: phone,
      email: email,
      name: name,
    );

    docRef.set(
      person.toJson(),
      SetOptions(
        merge: false,
      ),
    );

    return person;
  }

  Person updatePerson({
    @required Person newPerson,
  }) {
    assert(newPerson != null);

    final DocumentReference docRef = firestore.doc(
      fp.personDocumentPath(
        newPerson.id,
      ),
    );

    docRef.set(
      newPerson.toJson(),
      SetOptions(
        mergeFields: [
          c.personEmail,
          c.personName,
          c.personPhone,
        ],
      ),
    );

    return newPerson;
  }

  Stream<Person> streamPerson({
    @required String personId,
  }) {
    final DocumentReference docRef = firestore.doc(
      fp.personDocumentPath(personId),
    );

    return docRef.snapshots().map(
          (snap) => Person.fromJson(
            snap.data(),
          ),
        );
  }

  Stream<BuiltList<Person>> streamPersons() {
    final CollectionReference collRef =
        firestore.collection(fp.personCollectionPath);

    return collRef.snapshots().map(
          (snap) => snap.docs
              .map(
                (doc) => Person.fromJson(
                  doc.data(),
                ),
              )
              .toBuiltList(),
        );
  }

  Stream<BuiltList<Person>> streamPersonByPhone({
    @required String phone,
  }) {
    final CollectionReference collRef =
        firestore.collection(fp.personCollectionPath);

    final Query query = collRef.where(
      c.personPhone,
      isEqualTo: phone,
    );

    return query.snapshots().map(
          (snap) => snap.docs
              .map(
                (doc) => Person.fromJson(
                  doc.data(),
                ),
              )
              .toBuiltList(),
        );
  }
}
