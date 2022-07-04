import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inpos/bloc/checkout/checkout_bloc.dart';
import 'package:inpos/bloc/payment_cash/payment_cash_bloc.dart';
import 'package:inpos/bloc/product_bloc/product_bloc.dart';
import 'package:inpos/models/payment_cash.dart';
import 'package:inpos/screens/main_screen.dart';
import 'package:inpos/screens/splash_screen.dart';
import 'package:inpos/settings/constants.dart';
import 'package:inpos/settings/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductBloc(),
          ),
          BlocProvider(
            create: (context) =>
                CheckoutBloc()..add(const LoadCheckoutData(products: [])),
          ),
          BlocProvider(
            create: (context) => PaymentCashBloc()
              ..add(const LoadPaymentCash(
                  payment: PaymentCash(subTotal: 0, cash: 0))),
          )
        ],
        child: MaterialApp(
          title: 'Inpos Application Demo',
          theme: ThemeData(
            primaryColor: primaryColor,
            appBarTheme: const AppBarTheme(
                color: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(color: primaryColor),
                titleTextStyle: TextStyle(color: primaryColor, fontSize: 18)),
          ),
          home: const SplashScreen(),
          routes: routes,
        ),
      ),
    );
  }
}
