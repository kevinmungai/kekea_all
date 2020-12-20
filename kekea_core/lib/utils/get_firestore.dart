import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:meta/meta.dart';

/// Uses the emulator for debug and profile builds of the application
FirebaseFirestore getFirestore({
  @required FirebaseApp firebaseApp,
}) {
  assert(firebaseApp != null);

  final FirebaseFirestore firestore = FirebaseFirestore.instanceFor(
    app: firebaseApp,
  );

  return kReleaseMode ? firestore : firestore
    ..settings = Settings(
      host: "192.168.100.18:8080",
      sslEnabled: false,
      persistenceEnabled: false,
    );
}
