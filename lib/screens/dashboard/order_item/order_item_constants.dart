import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inpos/settings/constants.dart';
import 'package:inpos/settings/size_config.dart';

const String rupiahLabel = 'Rp.';
const String orderedItemLabel1 = 'Item';
const String orderedItemLabel2 = 'yang dipesan';
const String itemLabel = 'Kategori';
const String ordersLabel = 'Pesanan';
const String ppiLabel = 'PPI';
const String ravanueLabel = 'Pendapatan';
const String foodRicePath = 'assets/icons/food_rice.svg';
const String foodRiceLabel = 'Nasi';
const String foodFishPath = 'assets/icons/food_fish.svg';
const String foodFishLabel = 'Ikan';
const String foodChickenPath = 'assets/icons/food_chicken.svg';
const String foodChickenLabel = 'Ayam';
const String foodBurgerPath = 'assets/icons/food_burger.svg';
const String foodBurgerLabel = 'Burger';
const String hotDrinkPath = 'assets/icons/drink_coffee.svg';
const String hotDrinkLabel = 'Minuman Panas';
const String coolDrinkPath = 'assets/icons/drink_boba.svg';
const String coolDrinkLabel = 'Minuman Dingin';

DataColumn _dataColumn({required String label, required bool isnumeric}) =>
    DataColumn(label: Text(label), numeric: isnumeric);

DataCell _dataCellNameItem(path, label) {
  return DataCell(
    Row(
      children: [
        SvgPicture.asset(
          path,
          height: getProportionateScreenWidth(22),
          width: getProportionateScreenWidth(22),
          color: primaryColor,
        ),
        SizedBox(
          width: getProportionateScreenWidth(15),
        ),
        Text(label),
      ],
    ),
  );
}

DataCell _dataCellItem(cell, iscurrency) {
  return DataCell(Text((() {
    if (iscurrency) {
      return '$rupiahLabel $cell';
    }
    return cell;
  }())));
}

DataRow _dataRow(path, label, ordersNum, ravanueNum) {
  return DataRow(cells: [
    _dataCellNameItem(path, label),
    _dataCellItem(ordersNum, false),
    _dataCellItem(ravanueNum, true),
  ]);
}

List<DataColumn> createColumn() {
  return [
    _dataColumn(label: itemLabel, isnumeric: false),
    _dataColumn(label: ordersLabel, isnumeric: false),
    _dataColumn(label: ravanueLabel, isnumeric: false),
  ];
}

List<DataRow> createRow() {
  return [
    _dataRow(foodRicePath, foodRiceLabel, '520', '2.600.000'),
    _dataRow(foodFishPath, foodFishLabel, '90', '900.000'),
    _dataRow(foodChickenPath, foodChickenLabel, '100', '1.100.000'),
    _dataRow(foodBurgerPath, foodBurgerLabel, '150', '3.000.000'),
    _dataRow(hotDrinkPath, hotDrinkLabel, '200', '5.000.000'),
    _dataRow(coolDrinkPath, coolDrinkLabel, '200', '5.000.000'),
  ];
}
