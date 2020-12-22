import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kekea_core/bloc/dynamic_link_bloc/bloc.dart';
import 'package:kekea_core/bloc/receipt_detail_bloc/bloc.dart';
import 'package:kekea_core/bloc/receipt_list_bloc/bloc.dart';
import 'package:kekea_core/bloc/user_auth_bloc/bloc.dart';
import 'package:kekea_core/side_effects/auth/fire/auth_fire.dart';
import 'package:kekea_core/side_effects/database/firestore/payment_db_firestore.dart';
import 'package:kekea_core/side_effects/database/firestore/payment_product_db_firestore.dart';
import 'package:kekea_core/side_effects/dynamic_link/dynamic_link.dart';
import 'package:kekea_core/utils/get_firestore.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:kekea_customer/ui/start/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp firebaseApp = await Firebase.initializeApp();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instanceFor(
    app: firebaseApp,
  );
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseFirestore firestore = getFirestore(firebaseApp: firebaseApp);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthFire>(
          create: (context) => AuthFire(
            firebaseAuth: firebaseAuth,
            googleSignIn: googleSignIn,
          ),
        ),
        RepositoryProvider<PaymentDBFirestore>(
          create: (context) => PaymentDBFirestore(
            firestore: firestore,
          ),
        ),
        RepositoryProvider<PaymentProductDBFirestore>(
          create: (context) => PaymentProductDBFirestore(
            firestore: firestore,
          ),
        ),
        RepositoryProvider<DynamicLink>(
          create: (context) => DynamicLink(
            dynamicLinks: FirebaseDynamicLinks.instance,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UserAuthBloc>(
            create: (context) => UserAuthBloc(
              authFire: RepositoryProvider.of<AuthFire>(context),
            )..add(UserAuthEvent.listen()),
          ),
          BlocProvider<ReceiptDetailBloc>(
            create: (context) => ReceiptDetailBloc(
              paymentDBFirestore:
                  RepositoryProvider.of<PaymentDBFirestore>(context),
              paymentProductDBFirestore:
                  RepositoryProvider.of<PaymentProductDBFirestore>(context),
            ),
          ),
          BlocProvider<DynamicLinkBloc>(
            create: (context) => DynamicLinkBloc(
              dynamicLink: RepositoryProvider.of<DynamicLink>(context),
              receiptDetailBloc: BlocProvider.of<ReceiptDetailBloc>(context),
            )..add(DynamicLinkEvent.checkForLink()),
          ),
          BlocProvider<ReceiptListBloc>(
            create: (context) => ReceiptListBloc(
              paymentDBFirestore:
                  RepositoryProvider.of<PaymentDBFirestore>(context),
            ),
          )
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kekea',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartPage(),
    );
  }
}
