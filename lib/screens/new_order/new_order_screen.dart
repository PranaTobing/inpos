import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inpos/bloc/checkout/checkout_bloc.dart';
import 'package:inpos/bloc/product_bloc/product_bloc.dart';
import 'package:inpos/screens/checkout/checkout_screen.dart';
import 'package:inpos/settings/constants.dart';

import '../../components/bottom_widget.dart';
import '../../settings/size_config.dart';
import 'grid_builder_item_widget.dart';
import 'new_order_constants.dart';
import 'tab_item_widget.dart';
import 'text_button_checkout.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({Key? key}) : super(key: key);

  static String routeName = '/new_order';

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen>
    with SingleTickerProviderStateMixin {
  final ProductBloc _productBloc = ProductBloc();

  late TabController tabController;
  late int _activeTab = 0;

  @override
  void initState() {
    tabController = TabController(length: 7, vsync: this);
    _productBloc.add(GetProductList());
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CheckoutBloc myCheckout = context.read<CheckoutBloc>();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(
          appBarTitile,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
          ),
          child: Container(
            height: SizeConfig.screenHeight * 0.8,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                tabBarMethod(),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                // state.productModel.data.where((product) => product.category == 'listAyam').toList()
                Expanded(
                  child: BlocBuilder<ProductBloc, ProductState>(
                    bloc: _productBloc,
                    buildWhen: (prev, state) {
                      if (state is ProductLoaded) {
                        return true;
                      } else {
                        return false;
                      }
                    },
                    builder: (context, state) {
                      if (state is ProductLoaded) {
                        return TabBarView(
                          physics: const BouncingScrollPhysics(),
                          controller: tabController,
                          children: [
                            GridBuilderItemWidget(
                              listData: state.productModel.data
                                  .where((product) => product.category == 'mie')
                                  .toList(),
                            ),
                            GridBuilderItemWidget(
                              listData: state.productModel.data
                                  .where((product) =>
                                      product.category == 'makanan')
                                  .toList(),
                            ),
                            GridBuilderItemWidget(
                              listData: state.productModel.data
                                  .where((product) =>
                                      product.category == 'minuman')
                                  .toList(),
                            ),
                            GridBuilderItemWidget(
                              listData: state.productModel.data
                                  .where(
                                      (product) => product.category == 'susu')
                                  .toList(),
                            ),
                            GridBuilderItemWidget(
                              listData: state.productModel.data
                                  .where(
                                      (product) => product.category == 'kopi')
                                  .toList(),
                            ),
                            GridBuilderItemWidget(
                              listData: state.productModel.data
                                  .where(
                                      (product) => product.category == 'beras')
                                  .toList(),
                            ),
                            GridBuilderItemWidget(
                              listData: state.productModel.data
                                  .where(
                                      (product) => product.category == 'minyak')
                                  .toList(),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BlocBuilder<CheckoutBloc, CheckoutState>(
        bloc: myCheckout,
        builder: (context, state) {
          if (state is CheckoutLoaded && state.products.isNotEmpty) {
            int sum = 0;
            int totalItem = 0;
            for (var element in state.products) {
              sum += (element.harga * element.totalOrderItem);
              totalItem += element.totalOrderItem;
            }
            return BottomWidget(
              onPressed: () {
                // Navigator.pushNamed(context, CheckoutScreen.routeName);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: myCheckout,
                    child: const CheckoutScreen(),
                  ),
                ));
              },
              child: TextCheckoutButton(
                total: sum,
                totalItem: totalItem,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Padding tabBarMethod() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(5),
      ),
      child: TabBar(
        onTap: (index) {
          setState(() {
            _activeTab = tabController.index;
          });
        },
        indicatorColor: Colors.transparent,
        isScrollable: true,
        physics: const BouncingScrollPhysics(),
        controller: tabController,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(8),
        ),
        tabs: tabGroceries
            .map(
              (item) => TabItemWidget(
                icon: item['icon'],
                text: item['title'],
                isActive: _activeTab == item['id'],
              ),
            )
            .toList(),
      ),
    );
  }
}
