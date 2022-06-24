part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final List<ProductCheckout> products;

  const CheckoutLoaded({this.products = const <ProductCheckout>[]});

  @override
  List<Object> get props => [products];
}
