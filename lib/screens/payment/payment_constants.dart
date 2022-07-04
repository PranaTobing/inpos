import 'package:flutter/material.dart';

final List<Map<String, dynamic>> tabPayments = [
  {'id': 0, 'title': 'Cash', 'icon': Icons.money},
  {'id': 1, 'title': 'Debit', 'icon': Icons.account_balance},
  {'id': 2, 'title': 'e-Wallet', 'icon': Icons.wallet},
];

final List<int> listCashInstan = [
  1000000,
  500000,
  100000,
  50000,
  20000,
  10000,
  5000,
  1000,
  100,
];

final List<Map<String, dynamic>> paymentBanks = [
  {
    'id': 0,
    'name': 'Bank BCA',
    'img': 'assets/images/bank_bca_logo.png',
  },
  {
    'id': 1,
    'name': 'Bank BNI',
    'img': 'assets/images/bank_bni_logo.png',
  },
  {
    'id': 2,
    'name': 'Bank BRI',
    'img': 'assets/images/bank_bri_logo.png',
  },
  {
    'id': 3,
    'name': 'Bank Mandiri',
    'img': 'assets/images/bank_mandiri_logo.png',
  },
  {
    'id': 4,
    'name': 'Bank OCBC',
    'img': 'assets/images/bank_ocbc_logo.png',
  },
  {
    'id': 5,
    'name': 'Bank Permata',
    'img': 'assets/images/bank_permata_logo.png',
  }
];

final List<Map<String, dynamic>> paymentEWallets = [
  {
    'id': 0,
    'name': 'Gopay',
    'img': 'assets/images/logo_gopay.png',
  },
  {
    'id': 1,
    'name': 'Ovo',
    'img': 'assets/images/logo_ovo.png',
  },
  {
    'id': 2,
    'name': 'Dana',
    'img': 'assets/images/logo_dana.png',
  },
  {
    'id': 3,
    'name': 'Shopee Pay',
    'img': 'assets/images/logo_shopee_pay.png',
  }
];
