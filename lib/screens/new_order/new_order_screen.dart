import 'package:flutter/material.dart';
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
  late TabController tabController;
  late int _activeTab = 0;

  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    controller: tabController,
                    children: [
                      GridBuilderItemWidget(listData: listAyam),
                      GridBuilderItemWidget(listData: listIkan),
                      GridBuilderItemWidget(listData: listNasi),
                      GridBuilderItemWidget(listData: listBurger),
                      GridBuilderItemWidget(listData: listMinumanPanas),
                      GridBuilderItemWidget(listData: listMinumanDingin),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BottomWidget(
        onPressed: () {
          Navigator.pushNamed(context, CheckoutScreen.routeName);
        },
        child: const TextCheckoutButton(total: 167000),
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
        tabs: tabItems
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
