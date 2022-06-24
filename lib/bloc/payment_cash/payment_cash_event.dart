part of 'payment_cash_bloc.dart';

abstract class PaymentCashEvent extends Equatable {
  const PaymentCashEvent();

  @override
  List<Object> get props => [];
}

class LoadPaymentCash extends PaymentCashEvent {
  final PaymentCash payment;
  const LoadPaymentCash({required this.payment});

  @override
  List<Object> get props => [payment];
}

class ChangePaymentCash extends PaymentCashEvent {
  final PaymentCash payment;
  const ChangePaymentCash({required this.payment});

  @override
  List<Object> get props => [payment];
}
