import 'package:flutter/material.dart';

import '../../components/appbar_with_noactions.dart';
import '../../components/bottom_widget.dart';
import '../../components/coming_soon_widget.dart';
import '../../components/text_button_payment.dart';
import '../../settings/size_config.dart';
import 'payment_arguments.dart';
import 'payment_cash_body.dart';
import 'payment_constants.dart';
import 'tab_payment_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  static String routeName = '/payment';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late int _activeTab = 0;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PaymentArguments;

    return Scaffold(
      appBar: const AppBarWithNoActions(titlePage: 'Payment'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
          ),
          child: Container(
            height: SizeConfig.screenHeight * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                tabBarMethod(),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      PaymentCashBody(subTotal: args.totalHarga),
                      const ComingSoon(
                        text: 'e-Wallet Coming Soon',
                      ),
                      const ComingSoon(
                        text: 'debit Coming Soon',
                      ),
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
          // Navigator.pushNamed(context, CheckoutScreen.routeName);
        },
        child: TextPaymentButton(
          total: args.totalHarga,
          text: 'Pay',
        ),
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
        controller: tabController,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(8),
        ),
        tabs: tabPayments
            .map(
              (payment) => TabPaymentWidget(
                icon: payment['icon'],
                text: payment['title'],
                isActive: _activeTab == payment['id'],
              ),
            )
            .toList(),
      ),
    );
  }
}
