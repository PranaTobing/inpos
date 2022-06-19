import 'package:flutter/material.dart';

import '../../settings/constants.dart';
import '../../settings/size_config.dart';
import 'payment_constants.dart';
import 'payment_instan_grid.dart';

class PaymentCashBody extends StatefulWidget {
  const PaymentCashBody({Key? key}) : super(key: key);

  @override
  State<PaymentCashBody> createState() => _PaymentCashBodyState();
}

class _PaymentCashBodyState extends State<PaymentCashBody> {
  late TextEditingController _cashAmountController;
  late String cashAmount;

  @override
  void initState() {
    super.initState();
    _cashAmountController = TextEditingController();
  }

  @override
  void dispose() {
    _cashAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Container(
            height: getProportionateScreenWidth(180),
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(20),
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: (1 / .4)),
              itemCount: listCashInstan.length,
              itemBuilder: (BuildContext ctx, index) {
                return PaymentInstan(
                  amount: listCashInstan[index],
                  onClick: () {
                    _cashAmountController.text =
                        _cashAmountController.text.isEmpty
                            ? (0 + listCashInstan[index]).toString()
                            : (int.parse(_cashAmountController.text) +
                                    listCashInstan[index])
                                .toString();
                    setState(() {
                      cashAmount = _cashAmountController.text;
                    });
                  },
                );
              },
            ),
          ),
          TextField(
            controller: _cashAmountController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 2.0),
              ),
              labelText: 'Cash Amount',
              labelStyle: TextStyle(color: primaryColor),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 2.0),
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: (textInput) {
              setState(() {
                cashAmount = textInput;
              });
            },
          ),
        ],
      ),
    );
  }
}
