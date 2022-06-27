import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inpos/bloc/checkout/checkout_bloc.dart';
import 'package:inpos/bloc/payment_cash/payment_cash_bloc.dart';
import 'package:inpos/models/payment_cash.dart';
import 'package:inpos/screens/payment/payment_screen.dart';

import '../../components/appbar_with_actions.dart';
import '../../components/bottom_widget.dart';
import '../../settings/size_config.dart';
import '../../components/text_button_payment.dart';
import 'body_checkout.dart';
import 'checkout_empty_data.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  static String routeName = '/checkout';

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late double totalSum = 345000;

  @override
  Widget build(BuildContext context) {
    CheckoutBloc myCheckout = context.read<CheckoutBloc>();
    PaymentCashBloc myPayment = context.read<PaymentCashBloc>();

    return Scaffold(
      appBar: AppBarWithActions(
        titlePage: 'Periksa Kembali',
        actions: [
          {
            'onPressed': () {
              myCheckout.add(const DeleteAllCheckoutData(products: []));
            },
            'icon': Icons.delete
          },
        ],
      ),
      body: BlocBuilder<CheckoutBloc, CheckoutState>(
        bloc: myCheckout,
        builder: (context, state) {
          if (state is CheckoutLoaded) {
            if (state.products.isNotEmpty) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(10),
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.products.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return BodyCheckout(
                      img: state.products[index].img,
                      titleItem: state.products[index].title,
                      totalItem: state.products[index].totalOrderItem,
                      harga: state.products[index].harga,
                      substractFunc: () {
                        if (state.products[index].totalOrderItem > 1) {
                          myCheckout.add(SubtractTotalOrderItem(
                              product: state.products[index]));
                        }
                      },
                      addFunc: () {
                        myCheckout.add(
                            AddTotalOrderItem(product: state.products[index]));
                      },
                      deleteFunc: () {
                        myCheckout.add(
                            DeleteCheckoutData(product: state.products[index]));
                      },
                    );
                  },
                ),
              );
            } else {
              return const EmptyDataCheckout();
            }
          } else {
            return const EmptyDataCheckout();
          }
        },
      ),
      bottomSheet: BlocBuilder<PaymentCashBloc, PaymentCashState>(
        bloc: myPayment,
        builder: (context, statePayment) {
          if (statePayment is PaymentCashLoaded) {
            return BlocBuilder<CheckoutBloc, CheckoutState>(
              bloc: myCheckout,
              builder: (context, state) {
                if (state is CheckoutLoaded && state.products.isNotEmpty) {
                  int sum = 0;
                  for (var element in state.products) {
                    sum += (element.harga * element.totalOrderItem);
                  }
                  return BottomWidget(
                    onPressed: () {
                      myPayment.add(ResetPaymentCash(
                        payment: PaymentCash(
                          subTotal: sum.toDouble(),
                          cash: 0,
                        ),
                      ));
                      // Navigator.pushNamed(context, PaymentScreen.routeName,
                      //     arguments: PaymentArguments(totalSum.toInt(), listCheckout));
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: myCheckout,
                            child: PaymentScreen(
                              totalCheckout: sum,
                            ),
                          ),
                        ),
                      );
                    },
                    child: TextPaymentButton(
                      total: sum,
                      text: 'Pembayaran',
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
}
