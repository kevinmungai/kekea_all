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
  final FirebaseFirestore firestore = getFirestore(firebaseApp: firebaseApp);

/**
 * Had to instantiate all BLOCs like this because **AuthBloc** doesn't
 * seem to start when instantiated inside the *lambda*.
 */

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthFire>(
          create: (context) => AuthFire(
            firebaseAuth: firebaseAuth,
            googleSignIn: googleSignIn,
          ),
        ),
        RepositoryProvider<BusinessPersonDBFirestore>(
          create: (context) => BusinessPersonDBFirestore(
            firestore: firestore,
          ),
        ),
        RepositoryProvider<StoreDBFirestore>(
          create: (context) => StoreDBFirestore(
            firestore: firestore,
          ),
        ),
        RepositoryProvider<BusinessDBFirestore>(
          create: (context) => BusinessDBFirestore(
            firestore: firestore,
          ),
        ),
        RepositoryProvider<BusinessMemberDBFirestore>(
          create: (context) => BusinessMemberDBFirestore(
            firestore: firestore,
          ),
        ),
        RepositoryProvider<ProductDBFirestore>(
          create: (context) => ProductDBFirestore(
            firestore: firestore,
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
          BlocProvider<SignalBloc>(
            create: (context) => SignalBloc(),
          ),
          BlocProvider<PaymentListStatusBloc>(
            create: (context) => PaymentListStatusBloc(
              paymentDBFirestore:
                  RepositoryProvider.of<PaymentDBFirestore>(context),
            ),
          ),
          BlocProvider<PaymentBloc>(
            create: (context) => PaymentBloc(
              paymentDBFirestore:
                  RepositoryProvider.of<PaymentDBFirestore>(context),
              paymentProductDBFirestore:
                  RepositoryProvider.of<PaymentProductDBFirestore>(context),
              productDBFirestore:
                  RepositoryProvider.of<ProductDBFirestore>(context),
            ),
          ),
          BlocProvider<SignInBloc>(
            create: (context) => SignInBloc(
              authFire: RepositoryProvider.of<AuthFire>(context),
            ),
          ),
          BlocProvider<BusinessPersonBloc>(
            create: (context) => BusinessPersonBloc(
              businessPersonDBFirestore:
                  RepositoryProvider.of<BusinessPersonDBFirestore>(context),
            ),
          ),
          BlocProvider<BusinessMemberBloc>(
            create: (context) => BusinessMemberBloc(
              businessMemberDBFirestore:
                  RepositoryProvider.of<BusinessMemberDBFirestore>(context),
            ),
          ),
          BlocProvider<ProductListStatusBloc>(
            create: (context) => ProductListStatusBloc(
              productDBFirestore:
                  RepositoryProvider.of<ProductDBFirestore>(context),
            ),
          ),
          BlocProvider<StoreBloc>(
            create: (context) => StoreBloc(
              storeDBFirestore:
                  RepositoryProvider.of<StoreDBFirestore>(context),
            ),
          ),
          BlocProvider<BusinessPersonStatusBloc>(
            create: (context) => BusinessPersonStatusBloc(
              businessPersonDBFirestore:
                  RepositoryProvider.of<BusinessPersonDBFirestore>(context),
              businessPersonBloc: BlocProvider.of<BusinessPersonBloc>(context),
              businessMemberBloc: BlocProvider.of<BusinessMemberBloc>(context),
              paymentBloc: BlocProvider.of<PaymentBloc>(context),
              paymentProductDBFirestore:
                  RepositoryProvider.of<PaymentProductDBFirestore>(context),
              productDBFirestore:
                  RepositoryProvider.of<ProductDBFirestore>(context),
              productListStatusBloc:
                  BlocProvider.of<ProductListStatusBloc>(context),
              paymentDBFirestore:
                  RepositoryProvider.of<PaymentDBFirestore>(context),
              businessDBFirestore:
                  RepositoryProvider.of<BusinessDBFirestore>(context),
              storeDBFirestore:
                  RepositoryProvider.of<StoreDBFirestore>(context),
              dynamicLink: RepositoryProvider.of<DynamicLink>(context),
              businessMemberDBFirestore:
                  RepositoryProvider.of<BusinessMemberDBFirestore>(context),
            ),
          ),
          BlocProvider<EditProductBloc>(
            create: (context) => EditProductBloc(
              businessPersonStatusBloc:
                  BlocProvider.of<BusinessPersonStatusBloc>(context),
              productDBFirestore:
                  RepositoryProvider.of<ProductDBFirestore>(context),
              signalBloc: BlocProvider.of<SignalBloc>(context),
            ),
          ),
          BlocProvider<StoreStatusBloc>(
            create: (context) => StoreStatusBloc(
              storeDBFirestore:
                  RepositoryProvider.of<StoreDBFirestore>(context),
            ),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authFire: RepositoryProvider.of<AuthFire>(context),
              businessPersonStatusBloc:
                  BlocProvider.of<BusinessPersonStatusBloc>(context),
            )..add(AuthEvent.listenToAuthChanges()),
          ),
          BlocProvider<BusinessBloc>(
            create: (context) => BusinessBloc(
              businessDBFirestore:
                  RepositoryProvider.of<BusinessDBFirestore>(context),
            ),
          ),
          BlocProvider<CreateProductBloc>(
            create: (context) => CreateProductBloc(
              productDBFirestore:
                  RepositoryProvider.of<ProductDBFirestore>(context),
              businessPersonStatusBloc:
                  BlocProvider.of<BusinessPersonStatusBloc>(context),
            ),
          ),
          BlocProvider<EditOrViewPaymentBloc>(
            create: (context) => EditOrViewPaymentBloc(
              businessPersonStatusBloc:
                  BlocProvider.of<BusinessPersonStatusBloc>(context),
              paymentProductDBFirestore:
                  RepositoryProvider.of<PaymentProductDBFirestore>(context),
            ),
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
