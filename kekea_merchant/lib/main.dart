import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kekea_core/bloc/auth_bloc/bloc.dart';
import 'package:kekea_core/bloc/business_bloc/bloc.dart';
import 'package:kekea_core/bloc/business_member_bloc/bloc.dart';
import 'package:kekea_core/bloc/business_person_bloc/bloc.dart';
import 'package:kekea_core/bloc/business_person_status_bloc/bloc.dart';
import 'package:kekea_core/bloc/create_product_bloc/bloc.dart';
import 'package:kekea_core/bloc/edit_or_view_payment_bloc/bloc.dart';
import 'package:kekea_core/bloc/edit_product_bloc/bloc.dart';
import 'package:kekea_core/bloc/payment_bloc/bloc.dart';
import 'package:kekea_core/bloc/payment_list_status_bloc/bloc.dart';
import 'package:kekea_core/bloc/product_list_status_bloc/bloc.dart';
import 'package:kekea_core/bloc/sign_in_bloc/bloc.dart';
import 'package:kekea_core/bloc/signal_bloc/bloc.dart';
import 'package:kekea_core/bloc/store_bloc/bloc.dart';
import 'package:kekea_core/bloc/store_status_bloc/bloc.dart';
import 'package:kekea_core/side_effects/auth/fire/auth_fire.dart';
import 'package:kekea_core/side_effects/database/firestore/business_db_firestore.dart';
import 'package:kekea_core/side_effects/database/firestore/business_member_db_firestore.dart';
import 'package:kekea_core/side_effects/database/firestore/business_person_db_firestore.dart';
import 'package:kekea_core/side_effects/database/firestore/payment_db_firestore.dart';
import 'package:kekea_core/side_effects/database/firestore/payment_product_db_firestore.dart';
import 'package:kekea_core/side_effects/database/firestore/product_db_firestore.dart';
import 'package:kekea_core/side_effects/database/firestore/store_db_firestore.dart';
import 'package:kekea_core/side_effects/dynamic_link/dynamic_link.dart';
import 'package:kekea_core/utils/get_firestore.dart';
import 'package:kekea_merchant/ui/start/start_page.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp firebaseApp = await Firebase.initializeApp();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instanceFor(
    app: firebaseApp,
  );
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final AuthFire authFire = AuthFire(
    firebaseAuth: firebaseAuth,
    googleSignIn: googleSignIn,
  );
  final FirebaseFirestore firestore = getFirestore(firebaseApp: firebaseApp);
  final BusinessPersonDBFirestore businessPersonDBFirestore =
      BusinessPersonDBFirestore(
    firestore: firestore,
  );

  final StoreDBFirestore storeDBFirestore = StoreDBFirestore(
    firestore: firestore,
  );

  final BusinessDBFirestore businessDBFirestore = BusinessDBFirestore(
    firestore: firestore,
  );

  final BusinessMemberDBFirestore businessMemberDBFirestore =
      BusinessMemberDBFirestore(
    firestore: firestore,
  );

  final ProductDBFirestore productDBFirestore = ProductDBFirestore(
    firestore: firestore,
  );

  final PaymentDBFirestore paymentDBFirestore = PaymentDBFirestore(
    firestore: firestore,
  );

  final PaymentProductDBFirestore paymentProductDBFirestore =
      PaymentProductDBFirestore(
    firestore: firestore,
  );

  final DynamicLink dynamicLink = DynamicLink(
    dynamicLinks: FirebaseDynamicLinks.instance,
  );

/**
 * Had to instantiate all BLOCs like this because **AuthBloc** doesn't
 * seem to start when instantiated inside the *lambda*.
 */

  final SignalBloc signalBloc = SignalBloc();

  final PaymentListStatusBloc paymentListStatusBloc = PaymentListStatusBloc(
    paymentDBFirestore: paymentDBFirestore,
  );

  final PaymentBloc paymentBloc = PaymentBloc(
    paymentDBFirestore: paymentDBFirestore,
    paymentProductDBFirestore: paymentProductDBFirestore,
    productDBFirestore: productDBFirestore,
  );

  final SignInBloc signInBloc = SignInBloc(
    authFire: authFire,
  );

  final BusinessPersonBloc businessPersonBloc = BusinessPersonBloc(
    businessPersonDBFirestore: businessPersonDBFirestore,
  );

  final BusinessMemberBloc businessMemberBloc = BusinessMemberBloc(
    businessMemberDBFirestore: businessMemberDBFirestore,
  );

  final ProductListStatusBloc productListStatusBloc = ProductListStatusBloc(
    productDBFirestore: productDBFirestore,
  );

  final StoreBloc storeBloc = StoreBloc(
    storeDBFirestore: storeDBFirestore,
  );

  final BusinessPersonStatusBloc businessPersonStatusBloc =
      BusinessPersonStatusBloc(
    businessPersonDBFirestore: businessPersonDBFirestore,
    businessPersonBloc: businessPersonBloc,
    businessMemberBloc: businessMemberBloc,
    paymentBloc: paymentBloc,
    paymentProductDBFirestore: paymentProductDBFirestore,
    productDBFirestore: productDBFirestore,
    productListStatusBloc: productListStatusBloc,
    paymentDBFirestore: paymentDBFirestore,
    businessDBFirestore: businessDBFirestore,
    storeDBFirestore: storeDBFirestore,
    dynamicLink: dynamicLink,
    businessMemberDBFirestore: businessMemberDBFirestore,
  );

  final StoreStatusBloc storeStatusBloc = StoreStatusBloc(
    storeDBFirestore: storeDBFirestore,
  );

  final AuthBloc authBloc = AuthBloc(
    authFire: authFire,
    businessPersonStatusBloc: businessPersonStatusBloc,
  )..add(AuthEvent.listenToAuthChanges());

  final BusinessBloc businessBloc = BusinessBloc(
    businessDBFirestore: businessDBFirestore,
  );

  final CreateProductBloc createProductBloc = CreateProductBloc(
    productDBFirestore: productDBFirestore,
    businessPersonStatusBloc: businessPersonStatusBloc,
  );

  final EditOrViewPaymentBloc editOrViewPaymentBloc = EditOrViewPaymentBloc(
    businessPersonStatusBloc: businessPersonStatusBloc,
    paymentProductDBFirestore: paymentProductDBFirestore,
  );

  final EditProductBloc editProductBloc = EditProductBloc(
    businessPersonStatusBloc: businessPersonStatusBloc,
    productDBFirestore: productDBFirestore,
    signalBloc: signalBloc,
  );

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProductDBFirestore>(
          create: (context) => productDBFirestore,
        ),
        RepositoryProvider<PaymentProductDBFirestore>(
          create: (context) => paymentProductDBFirestore,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<EditProductBloc>(
            create: (context) => editProductBloc,
          ),
          BlocProvider<SignalBloc>(
            create: (context) => signalBloc,
          ),
          BlocProvider<PaymentListStatusBloc>(
            create: (context) => paymentListStatusBloc,
          ),
          BlocProvider<PaymentBloc>(
            create: (context) => paymentBloc,
          ),
          BlocProvider<SignInBloc>(
            create: (context) => signInBloc,
          ),
          BlocProvider<BusinessPersonBloc>(
            create: (context) => businessPersonBloc,
          ),
          BlocProvider<BusinessMemberBloc>(
            create: (context) => businessMemberBloc,
          ),
          BlocProvider<ProductListStatusBloc>(
            create: (context) => productListStatusBloc,
          ),
          BlocProvider<StoreBloc>(
            create: (context) => storeBloc,
          ),
          BlocProvider<BusinessPersonStatusBloc>(
            create: (context) => businessPersonStatusBloc,
          ),
          BlocProvider<StoreStatusBloc>(
            create: (context) => storeStatusBloc,
          ),
          BlocProvider<AuthBloc>(
            create: (context) => authBloc,
          ),
          BlocProvider<BusinessBloc>(
            create: (context) => businessBloc,
          ),
          BlocProvider<CreateProductBloc>(
            create: (context) => createProductBloc,
          ),
          BlocProvider<EditOrViewPaymentBloc>(
            create: (context) => editOrViewPaymentBloc,
          ),
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
      title: 'Kekea Merchant',
      home: StartPage(),
    );
  }
}
