part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class LoadCheckoutData extends CheckoutEvent {
  final List<ProductCheckout> products;
  const LoadCheckoutData({this.products = const <ProductCheckout>[]});

  @override
  List<Object> get props => [products];
}

class AddCheckoutData extends CheckoutEvent {
  final ProductCheckout product;
  const AddCheckoutData({required this.product});

  @override
  List<Object> get props => [product];
}

class UpdateOrAddCheckoutData extends CheckoutEvent {
  final ProductCheckout product;
  const UpdateOrAddCheckoutData({required this.product});

  @override
  List<Object> get props => [product];
}

class AddTotalOrderItem extends CheckoutEvent {
  final ProductCheckout product;
  const AddTotalOrderItem({required this.product});

  @override
  List<Object> get props => [product];
}

class SubtractTotalOrderItem extends CheckoutEvent {
  final ProductCheckout product;
  const SubtractTotalOrderItem({required this.product});

  @override
  List<Object> get props => [product];
}

class DeleteCheckoutData extends CheckoutEvent {
  final ProductCheckout product;
  const DeleteCheckoutData({required this.product});

  @override
  List<Object> get props => [product];
}

class DeleteAllCheckoutData extends CheckoutEvent {
  final List<ProductCheckout> products;
  const DeleteAllCheckoutData({this.products = const <ProductCheckout>[]});

  @override
  List<Object> get props => [products];
}
