import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inpos/bloc/checkout/checkout_bloc.dart';
import 'package:inpos/screens/new_order/new_order_screen.dart';

import '../../../../settings/size_config.dart';
import '../header_constants.dart';

class NewOrderWidget extends StatelessWidget {
  const NewOrderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutBloc myCheckout = context.read<CheckoutBloc>();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
      ),
      child: IconButton(
          onPressed: () {
            // Navigator.pushNamed(context, NewOrderScreen.routeName);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: myCheckout,
                child: const NewOrderScreen(),
              ),
            ));
          },
          icon: SvgPicture.asset(
            newOrderHeader,
            width: 30,
          )),
    );
  }
}
