class ProductCheckout {
  ProductCheckout({
    required this.productId,
    required this.category,
    required this.title,
    required this.img,
    required this.harga,
    required this.totalOrderItem,
  });

  int productId;
  String category;
  String title;
  String img;
  int harga;
  int totalOrderItem;

  update(String s, int Function(dynamic value) param1) {}
}
