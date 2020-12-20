import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/dynamic_link_bloc/bloc.dart';
import 'package:kekea_core/bloc/user_auth_bloc/bloc.dart';

import 'package:kekea_core/data/kekea_user/kekea_user.dart';
import 'package:kekea_customer/ui/receipt_detail/receipt_detail_page.dart';
import 'package:kekea_customer/ui/receipt_list/receipt_list_page.dart';
import 'package:kekea_customer/ui/sign_in/sign_in_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAuthBloc, UserAuthState>(
      builder: (context, state) {
        return state.when(
          absent: () => SignInPage(),
          present: (KekeaUser kekeaUser) =>
              BlocBuilder<DynamicLinkBloc, DynamicLinkState>(
            builder: (context, state) {
              return state.when(
                absent: () {
                  return ReceiptListPage();
                },
                present: (Uri uri) {
                  return ReceiptDetailPage();
                },
              );
            },
          ),
        );
      },
    );
  }
}
