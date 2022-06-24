class PaymentCash {
  const PaymentCash({
    required this.subTotal,
    this.tax = 0,
    this.total = 0,
    required this.cash,
    this.change = 0,
  });
  final double subTotal;
  final double tax;
  final double total;
  final double cash;
  final double change;
}
