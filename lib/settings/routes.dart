import 'package:flutter/widgets.dart';
import 'package:inpos/screens/checkout/checkout_screen.dart';
import 'package:inpos/screens/new_order/new_order_screen.dart';

import '../screens/main_screen.dart';

final Map<String, WidgetBuilder> routes = {
  MainScreen.routeName: (context) => const MainScreen(),
  NewOrderScreen.routeName: (context) => const NewOrderScreen(),
  CheckoutScreen.routeName: (context) => const CheckoutScreen(),
};
