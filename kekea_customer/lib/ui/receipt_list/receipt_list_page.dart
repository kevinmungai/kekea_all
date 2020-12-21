import 'package:flutter/material.dart';
import 'package:kekea_core/data/kekea_user/kekea_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/receipt_list_bloc/bloc.dart';
import 'package:kekea_core/data/payment/payment.dart';
import 'package:built_collection/built_collection.dart';
import 'package:kekea_customer/ui/receipt_list/receipt_list_tile.dart';

class ReceiptListPage extends StatefulWidget {
  final KekeaUser kekeaUser;

  const ReceiptListPage({
    @required this.kekeaUser,
  }) : assert(kekeaUser != null);

  @override
  _ReceiptListPageState createState() => _ReceiptListPageState();
}

class _ReceiptListPageState extends State<ReceiptListPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReceiptListBloc>(context).add(
      ReceiptListEvent.listen(kekeaUser: widget.kekeaUser),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ReceiptListBloc, ReceiptListState>(
        builder: (context, state) {
          return state.when(
            absent: () => Center(
              child: CircularProgressIndicator(),
            ),
            present: (BuiltList<Payment> receipts) {
              if (receipts.isNotEmpty) {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ReceiptListTile(payment: receipts[index]);
                  },
                  itemCount: receipts.length,
                );
              }

              return Center(
                child: Text("No Receipts"),
              );
            },
          );
        },
      ),
    );
  }
}
