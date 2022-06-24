import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inpos/bloc/payment_cash/payment_cash_bloc.dart';
import 'package:inpos/models/payment_cash.dart';

import '../../settings/constants.dart';
import '../../settings/currency_format.dart';
import '../../settings/size_config.dart';
import 'payment_constants.dart';
import 'payment_instan_grid.dart';

class PaymentCashBody extends StatefulWidget {
  const PaymentCashBody({Key? key, required this.subTotal}) : super(key: key);

  final int subTotal;

  @override
  State<PaymentCashBody> createState() => _PaymentCashBodyState();
}

class _PaymentCashBodyState extends State<PaymentCashBody> {
  late TextEditingController _cashAmountController;
  late String cashAmount = '0';

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
    PaymentCashBloc myPayment = context.read<PaymentCashBloc>();

    return BlocBuilder<PaymentCashBloc, PaymentCashState>(
      bloc: myPayment,
      builder: (context, state) {
        if (state is PaymentCashLoaded) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                Container(
                  height: getProportionateScreenWidth(180),
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(20),
                  ),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                          myPayment.add(
                            ChangePaymentCash(
                              payment: PaymentCash(
                                subTotal: widget.subTotal.toDouble(),
                                cash: int.parse(_cashAmountController.text)
                                    .toDouble(),
                              ),
                            ),
                          );
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
                    myPayment.add(
                      ChangePaymentCash(
                        payment: PaymentCash(
                          subTotal: widget.subTotal.toDouble(),
                          cash: textInput.isNotEmpty
                              ? int.parse(textInput).toDouble()
                              : 0,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: getProportionateScreenWidth(50),
                ),
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    columnSpacing: 83,
                    headingRowHeight: 0,
                    dataRowHeight: double.parse('40'),
                    columns: const [
                      DataColumn(label: Text('')),
                      DataColumn(label: Text('')),
                    ],
                    rows: [
                      dataRow(title: 'Sub Total', amount: widget.subTotal),
                      dataRow(
                        title: 'Tax (11%)',
                        amount: state.payment.tax.toInt(),
                      ),
                      dataRow(
                        title: 'Total',
                        amount: state.payment.total.toInt(),
                      ),
                      dataRow(
                        title: 'Cash',
                        amount: state.payment.cash.toInt(),
                      ),
                      dataRow(
                          title: 'Change',
                          amount: state.payment.change.toInt(),
                          isMinus: state.payment.change.toInt() < 0),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  DataRow dataRow(
      {required String title, required int amount, bool isMinus = false}) {
    return DataRow(
      cells: [
        DataCell(Text(title)),
        DataCell(
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              CurrencyFormat.convertToIdr(amount, 0),
              textAlign: TextAlign.right,
              style: TextStyle(color: !isMinus ? Colors.black : Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
