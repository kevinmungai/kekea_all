import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/business_person_status_bloc/bloc.dart';
import 'package:kekea_core/bloc/payment_list_status_bloc/bloc.dart';
import 'package:kekea_core/data/business_person/business_person.dart';
import 'package:kekea_core/data/payment/payment.dart';
import 'package:kekea_merchant/ui/sale_list/sale_list_tile.dart';

class SaleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("SALES"),
            pinned: true,
          ),
          BlocBuilder<BusinessPersonStatusBloc, BusinessPersonStatusState>(
            builder: (context, state) {
              return state.when(
                absent: () => SliverFillRemaining(
                  child: Center(
                    child: Text("WEIRD ERROR: BUSINESS PERSON IS MISSING"),
                  ),
                ),
                present: (BusinessPerson businessPerson) {
                  BlocProvider.of<PaymentListStatusBloc>(context).add(
                    PaymentListStatusEvent.listen(
                      businessId: businessPerson.defaultBusiness.id,
                      storeId: businessPerson.defaultStore.id,
                    ),
                  );
                  return BlocBuilder<PaymentListStatusBloc,
                      PaymentListStatusState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => SliverFillRemaining(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        present: (BuiltList<Payment> payments) {
                          if (payments.isEmpty) {
                            return SliverFillRemaining(
                              child: Center(
                                child: Text("So much emptiness.."),
                              ),
                            );
                          }
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) => SaleListTile(
                                payment: payments[index],
                                currentBusinessPerson: businessPerson,
                              ),
                              childCount: payments.length,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
