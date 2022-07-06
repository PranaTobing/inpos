const String appBarTitile = 'Pesanan Baru';

final List<Map> tabItems = [
  {'id': 0, 'title': 'Ayam', 'icon': 'assets/icons/food_chicken.svg'},
  {'id': 1, 'title': 'Ikan', 'icon': 'assets/icons/food_fish.svg'},
  {'id': 2, 'title': 'Nasi', 'icon': 'assets/icons/food_rice.svg'},
  {'id': 3, 'title': 'Burger', 'icon': 'assets/icons/food_burger.svg'},
  {'id': 4, 'title': 'Minuman\nPanas', 'icon': 'assets/icons/drink_coffee.svg'},
  {'id': 5, 'title': 'Minuman\nDingin', 'icon': 'assets/icons/drink_boba.svg'},
];

final List<Map> tabGroceries = [
  {'id': 0, 'title': 'Mie', 'icon': 'assets/icons/icon_mie.svg'},
  {'id': 1, 'title': 'Makanan', 'icon': 'assets/icons/food_chicken.svg'},
  {'id': 2, 'title': 'Minuman', 'icon': 'assets/icons/drink_boba.svg'},
  {'id': 3, 'title': 'Susu', 'icon': 'assets/icons/icon_susu.svg'},
  {'id': 4, 'title': 'Kopi', 'icon': 'assets/icons/icon_kopi.svg'},
  {'id': 5, 'title': 'Beras', 'icon': 'assets/icons/icon_beras.svg'},
  {'id': 6, 'title': 'Minyak', 'icon': 'assets/icons/icon_minyak.svg'},
];

final List<Map> listNasi = [
  {
    'id': 0,
    'title': 'Nasi 1 porsi',
    'img': 'assets/images/food_nasi.png',
    'harga': 6000
  },
  {
    'id': 1,
    'title': 'Nasi 1/2 porsi',
    'img': 'assets/images/food_nasi.png',
    'harga': 3000
  },
  {
    'id': 2,
    'title': 'Nasi Goreng',
    'img': 'assets/images/food_nasi_goreng.png',
    'harga': 25000
  },
  {
    'id': 3,
    'title': 'Nasi Biryani',
    'img': 'assets/images/food_nasi_biryani.png',
    'harga': 40000
  },
];

final List<Map> listIkan = [
  {
    'id': 0,
    'title': 'Paket Nasi Ikan',
    'img': 'assets/images/food_ikan_paket.png',
    'harga': 50000
  },
  {
    'id': 1,
    'title': 'Tumis Ikan Mujair',
    'img': 'assets/images/food_ikan_tumis_mujair.png',
    'harga': 40000
  },
  {
    'id': 2,
    'title': 'Ikan Goreng Mujair',
    'img': 'assets/images/food_ikan_goreng_mujair.png',
    'harga': 41000
  },
  {
    'id': 3,
    'title': 'Ikan Patin Bakar',
    'img': 'assets/images/food_ikan_patin.png',
    'harga': 42000
  },
  {
    'id': 4,
    'title': 'Ikan Gurame Bakar',
    'img': 'assets/images/food_ikan_bakar_gurame.png',
    'harga': 60000
  },
  {
    'id': 5,
    'title': 'Ikan Dori Fillet',
    'img': 'assets/images/food_ikan_fillet_dori.png',
    'harga': 35000
  },
  {
    'id': 6,
    'title': 'Ikan Kembung Goreng',
    'img': 'assets/images/food_ikan_goreng_kembung.png',
    'harga': 15000
  },
  {
    'id': 7,
    'title': 'Udang',
    'img': 'assets/images/food_ikan_udang.png',
    'harga': 15000
  },
];

final List<Map> listAyam = [
  {
    'id': 0,
    'title': 'Ayam Bakar 1 Ekor',
    'img': 'assets/images/food_ayam_bakar_1ekor.png',
    'harga': 70000
  },
  {
    'id': 1,
    'title': 'Ayam Bakar 1 Potong',
    'img': 'assets/images/food_ayam_bakar_1potong.png',
    'harga': 20000
  },
  {
    'id': 2,
    'title': 'Paha Ayam Bakar (5)',
    'img': 'assets/images/food_ayam_bakar_paha.png',
    'harga': 35000
  },
  {
    'id': 3,
    'title': 'Sayap Ayam Bakar (5)',
    'img': 'assets/images/food_ayam_bakar_sayap.png',
    'harga': 38000
  },
  {
    'id': 4,
    'title': 'Ayam Goreng Tepung',
    'img': 'assets/images/food_ayam_goreng_ketucky.png',
    'harga': 18000
  },
  {
    'id': 5,
    'title': 'Paket Nasi Ayam Katsu',
    'img': 'assets/images/food_ayam_paket_katsuudon.png',
    'harga': 21000
  },
];

final List<Map> listBurger = [
  {
    'id': 0,
    'title': 'Burger Regular',
    'img': 'assets/images/food_burger_cheese_regular.png',
    'harga': 26000
  },
  {
    'id': 1,
    'title': 'Burger Large',
    'img': 'assets/images/food_burger_cheese_large.png',
    'harga': 32000
  },
  {
    'id': 2,
    'title': 'Kentang Goreng',
    'img': 'assets/images/food_burger_french_fries.png',
    'harga': 18000
  },
];

final List<Map> listMinumanPanas = [
  {
    'id': 0,
    'title': 'Kopi Hitam',
    'img': 'assets/images/drink_hot_kopi_hitam.png',
    'harga': 15000
  },
  {
    'id': 1,
    'title': 'Espresso',
    'img': 'assets/images/drink_hot_kopi_espresso.png',
    'harga': 18000
  },
  {
    'id': 2,
    'title': 'Latte',
    'img': 'assets/images/drink_hot_kopi_capucino_latte.png',
    'harga': 20000
  },
];

final List<Map> listMinumanDingin = [
  {
    'id': 0,
    'title': 'Es Kopi',
    'img': 'assets/images/drink_cool_es_kopi.png',
    'harga': 15000
  },
  {
    'id': 1,
    'title': 'Es Teh',
    'img': 'assets/images/drink_cool_es_teh.png',
    'harga': 6000
  },
  {
    'id': 2,
    'title': 'Cola',
    'img': 'assets/images/drink_cool_cola.png',
    'harga': 10000
  },
  {
    'id': 3,
    'title': 'Jus Alpukat',
    'img': 'assets/images/drink_cool_jus_alpukat.png',
    'harga': 17000
  },
  {
    'id': 4,
    'title': 'Jus Jeruk',
    'img': 'assets/images/drink_cool_jus_jeruk.png',
    'harga': 17000
  },
  {
    'id': 5,
    'title': 'Jus Mangga',
    'img': 'assets/images/drink_cool_jus_mangga.png',
    'harga': 17000
  },
  {
    'id': 0,
    'title': 'Jus Strawberry',
    'img': 'assets/images/drink_cool_jus_strawberry.png',
    'harga': 17000
  },
];

final List<Map> listAllItems = [
  {
    'id': 0,
    'title': 'Nasi 1 porsi',
    'img': 'assets/images/food_nasi.png',
    'harga': 6000
  },
  {
    'id': 1,
    'title': 'Nasi 1/2 porsi',
    'img': 'assets/images/food_nasi.png',
    'harga': 3000
  },
  {
    'id': 2,
    'title': 'Nasi Goreng',
    'img': 'assets/images/food_nasi_goreng.png',
    'harga': 25000
  },
  {
    'id': 3,
    'title': 'Nasi Biryani',
    'img': 'assets/images/food_nasi_biryani.png',
    'harga': 40000
  },
  {
    'id': 4,
    'title': 'Paket Nasi Ikan',
    'img': 'assets/images/food_ikan_paket.png',
    'harga': 50000
  },
  {
    'id': 5,
    'title': 'Tumis Ikan Mujair',
    'img': 'assets/images/food_ikan_tumis_mujair.png',
    'harga': 40000
  },
  {
    'id': 6,
    'title': 'Ikan Goreng Mujair',
    'img': 'assets/images/food_ikan_goreng_mujair.png',
    'harga': 41000
  },
  {
    'id': 7,
    'title': 'Ikan Patin Bakar',
    'img': 'assets/images/food_ikan_patin.png',
    'harga': 42000
  },
  {
    'id': 8,
    'title': 'Ikan Gurame Bakar',
    'img': 'assets/images/food_ikan_bakar_gurame.png',
    'harga': 60000
  },
  {
    'id': 9,
    'title': 'Ikan Dori Fillet',
    'img': 'assets/images/food_ikan_fillet_dori.png',
    'harga': 35000
  },
  {
    'id': 10,
    'title': 'Ikan Kembung Goreng',
    'img': 'assets/images/food_ikan_goreng_kembung.png',
    'harga': 15000
  },
  {
    'id': 11,
    'title': 'Udang',
    'img': 'assets/images/food_ikan_udang.png',
    'harga': 15000
  },
  {
    'id': 12,
    'title': 'Ayam Bakar 1 Ekor',
    'img': 'assets/images/food_ayam_bakar_1ekor.png',
    'harga': 70000
  },
  {
    'id': 13,
    'title': 'Ayam Bakar 1 Potong',
    'img': 'assets/images/food_ayam_bakar_1potong.png',
    'harga': 20000
  },
  {
    'id': 14,
    'title': 'Paha Ayam Bakar (5)',
    'img': 'assets/images/food_ayam_bakar_paha.png',
    'harga': 35000
  },
  {
    'id': 15,
    'title': 'Sayap Ayam Bakar (5)',
    'img': 'assets/images/food_ayam_bakar_sayap.png',
    'harga': 38000
  },
  {
    'id': 16,
    'title': 'Ayam Goreng Tepung',
    'img': 'assets/images/food_ayam_goreng_ketucky.png',
    'harga': 18000
  },
  {
    'id': 17,
    'title': 'Paket Nasi Ayam Katsu',
    'img': 'assets/images/food_ayam_paket_katsuudon.png',
    'harga': 21000
  },
  {
    'id': 18,
    'title': 'Burger Regular',
    'img': 'assets/images/food_burger_cheese_regular.png',
    'harga': 26000
  },
  {
    'id': 19,
    'title': 'Burger Large',
    'img': 'assets/images/food_burger_cheese_large.png',
    'harga': 32000
  },
  {
    'id': 20,
    'title': 'Kentang Goreng',
    'img': 'assets/images/food_burger_french_fries.png',
    'harga': 18000
  },
  {
    'id': 21,
    'title': 'Kopi Hitam',
    'img': 'assets/images/drink_hot_kopi_hitam.png',
    'harga': 15000
  },
  {
    'id': 22,
    'title': 'Espresso',
    'img': 'assets/images/drink_hot_kopi_espresso.png',
    'harga': 18000
  },
  {
    'id': 23,
    'title': 'Latte',
    'img': 'assets/images/drink_hot_kopi_capucino_latte.png',
    'harga': 20000
  },
  {
    'id': 24,
    'title': 'Es Kopi',
    'img': 'assets/images/drink_cool_es_kopi.png',
    'harga': 15000
  },
  {
    'id': 25,
    'title': 'Es Teh',
    'img': 'assets/images/drink_cool_es_teh.png',
    'harga': 6000
  },
  {
    'id': 26,
    'title': 'Cola',
    'img': 'assets/images/drink_cool_cola.png',
    'harga': 10000
  },
  {
    'id': 27,
    'title': 'Jus Alpukat',
    'img': 'assets/images/drink_cool_jus_alpukat.png',
    'harga': 17000
  },
  {
    'id': 28,
    'title': 'Jus Jeruk',
    'img': 'assets/images/drink_cool_jus_jeruk.png',
    'harga': 17000
  },
  {
    'id': 29,
    'title': 'Jus Mangga',
    'img': 'assets/images/drink_cool_jus_mangga.png',
    'harga': 17000
  },
  {
    'id': 30,
    'title': 'Jus Strawberry',
    'img': 'assets/images/drink_cool_jus_strawberry.png',
    'harga': 17000
  },
];
