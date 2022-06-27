import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inpos/bloc/checkout/checkout_bloc.dart';
import 'package:inpos/bloc/payment_cash/payment_cash_bloc.dart';

import '../../components/appbar_with_noactions.dart';
import '../../components/bottom_widget.dart';
import '../../components/coming_soon_widget.dart';
import '../../components/text_button_payment.dart';
import '../../settings/size_config.dart';
import 'payment_cash_body.dart';
import 'payment_constants.dart';
import 'payment_ewallet_body.dart';
import 'payment_wallet_bank_grid.dart';
import 'tab_payment_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.totalCheckout})
      : super(key: key);
  final int totalCheckout;

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
    CheckoutBloc myCheckout = context.read<CheckoutBloc>();
    PaymentCashBloc myPayment = context.read<PaymentCashBloc>();

    return Scaffold(
      appBar: const AppBarWithNoActions(titlePage: 'Pembayaran'),
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
                      PaymentCashBody(subTotal: widget.totalCheckout),
                      GridBuilderPaymentBankWallet(listData: paymentBanks),
                      GridBuilderPaymentBankWallet(listData: paymentEWallets),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BlocBuilder<CheckoutBloc, CheckoutState>(
        bloc: myCheckout,
        builder: (context, checkoutState) {
          if (checkoutState is CheckoutLoaded && _activeTab == 0) {
            return BlocBuilder<PaymentCashBloc, PaymentCashState>(
              bloc: myPayment,
              builder: (context, paymentCashState) {
                if (paymentCashState is PaymentCashLoaded &&
                    paymentCashState.payment.change >= 0) {
                  return BottomWidget(
                    onPressed: () {
                      // Navigator.pushNamed(context, CheckoutScreen.routeName);
                      // print struk dan balik ke dashboard/checkoutpage
                    },
                    child: TextPaymentButton(
                      total: paymentCashState.payment.total.toInt(),
                      text: 'Cetak Struk',
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
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
