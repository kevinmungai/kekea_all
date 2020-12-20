import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/edit_or_view_payment_bloc/bloc.dart';
import 'package:kekea_core/data/payment/payment.dart';
import 'package:kekea_merchant/ui/sale_solo/sale_solo_cashier_widget.dart';
import 'package:kekea_merchant/ui/sale_solo/sale_solo_customer_widget.dart';
import 'package:kekea_merchant/ui/sale_solo/sale_solo_id_widget.dart';
import 'package:kekea_merchant/ui/sale_solo/sale_solo_list.dart';
import 'package:kekea_merchant/ui/sale_solo/sale_solo_time_widget.dart';
import 'package:kekea_merchant/ui/sale_solo/sale_solo_total.dart';

class SaleSoloPage extends StatefulWidget {
  final Payment payment;

  const SaleSoloPage({
    @required this.payment,
  }) : assert(payment != null);

  @override
  _SaleSoloPageState createState() => _SaleSoloPageState();
}

class _SaleSoloPageState extends State<SaleSoloPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<EditOrViewPaymentBloc>(context).add(
      EditOrViewPaymentEvent.listenToPaymentProducts(
        payment: widget.payment,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text("DETAILS"),
          ),
          SaleSoloCustomerWidget(),
          SaleSoloCashierWidget(),
          SaleSoloTimeWidget(),
          SaleSoloIdWidget(),
          SaleSoloTotal(),
          SaleSoloList(),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 64),
          )
        ],
      ),
    );
  }
}
