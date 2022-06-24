import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inpos/bloc/checkout/checkout_bloc.dart';
import 'package:inpos/models/product_checkout.dart';
import 'package:inpos/models/product_model.dart';

import '../../settings/currency_format.dart';
import '../../settings/size_config.dart';

class ItemOrderWidget extends StatelessWidget {
  const ItemOrderWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    CheckoutBloc myCheckout = context.read<CheckoutBloc>();
    return Container(
      height: getProportionateScreenWidth(150),
      width: getProportionateScreenWidth(110),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            getProportionateScreenWidth(5),
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(3, 1),
          )
        ],
        color: Colors.white,
      ),
      child: BlocBuilder<CheckoutBloc, CheckoutState>(
        bloc: myCheckout,
        builder: (context, state) {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (state is CheckoutLoaded) {
                  if (state.products.isEmpty) {
                    var productData = ProductCheckout(
                      productId: product.id,
                      title: product.title,
                      img: product.img,
                      category: product.category,
                      harga: product.harga,
                      totalOrderItem: 1,
                    );
                    myCheckout.add(AddCheckoutData(product: productData));
                  } else {
                    var productData = ProductCheckout(
                      productId: product.id,
                      title: product.title,
                      img: product.img,
                      category: product.category,
                      harga: product.harga,
                      totalOrderItem: 1,
                    );
                    myCheckout
                        .add(UpdateOrAddCheckoutData(product: productData));
                  }
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: getProportionateScreenWidth(90),
                      child: Image.asset(product.img),
                    ),
                    Text(
                      CurrencyFormat.convertToIdr(product.harga, 0),
                    ),
                    Text(
                      product.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
