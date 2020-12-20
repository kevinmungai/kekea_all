import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/auth_bloc/bloc.dart';
import 'package:kekea_core/bloc/business_person_status_bloc/bloc.dart';
import 'package:kekea_core/bloc/product_list_status_bloc/bloc.dart';
import 'package:kekea_core/data/business_person/business_person.dart';
import 'package:kekea_merchant/ui/home/home_page.dart';
import 'package:kekea_merchant/ui/sign_in/sign_in_page.dart';
import 'package:kekea_merchant/ui/start/loading_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.when(
          absent: () => SignInPage(),
          present: (User user) {
            BlocProvider.of<BusinessPersonStatusBloc>(context).add(
              BusinessPersonStatusEvent.listenToChanges(
                firebaseId: user.uid,
              ),
            );
            return BlocBuilder<BusinessPersonStatusBloc,
                BusinessPersonStatusState>(
              builder: (context, state) {
                return state.when(
                  absent: () => const LoadingPage(),
                  present: (BusinessPerson businessPerson) {
                    if (businessPerson.defaultBusiness != null &&
                        businessPerson.defaultStore != null) {
                      BlocProvider.of<ProductListStatusBloc>(context).add(
                        ProductListStatusEvent.listen(
                          businessId: businessPerson.defaultBusiness,
                          storeId: businessPerson.defaultStore,
                        ),
                      );
                    }
                    return HomePage();
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
