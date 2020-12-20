import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/edit_product_bloc/bloc.dart';
import 'package:kekea_core/bloc/product_list_status_bloc/bloc.dart';
import 'package:kekea_core/data/sale_product/sale_product.dart';
import 'package:kekea_merchant/ui/edit_product/edit_product_page.dart';
import 'package:kekea_merchant/ui/product_list/add_new_product_button.dart';
import 'package:kekea_merchant/ui/product_list/product_list_tile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("PRODUCTS"),
            actions: [AddNewProductButton()],
            pinned: true,
          ),
          BlocBuilder<ProductListStatusBloc, ProductListStatusState>(
            builder: (context, state) {
              return state.when(
                loading: () => SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),
                present: (BuiltList<SaleProduct> saleProducts, _, __) {
                  if (saleProducts.isEmpty) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text("So much emptiness..."),
                      ),
                    );
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) => ProductListTile(
                        product: saleProducts[index].product,
                        productListTileOnTapCallBack: () {
                          pushNewScreen(
                            context,
                            screen: EditProductPage(
                              product: saleProducts[index].product,
                            ),
                          );
                          BlocProvider.of<EditProductBloc>(context).add(
                            EditProductEvent.loadProduct(
                              product: saleProducts[index].product,
                            ),
                          );
                        },
                      ),
                      childCount: saleProducts.length,
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
