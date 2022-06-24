part of 'payment_cash_bloc.dart';

abstract class PaymentCashState extends Equatable {
  const PaymentCashState();

  @override
  List<Object> get props => [];
}

class PaymentCashInitial extends PaymentCashState {}

class PaymentCashLoading extends PaymentCashState {}

class PaymentCashLoaded extends PaymentCashState {
  final PaymentCash payment;
  const PaymentCashLoaded({required this.payment});

  @override
  List<Object> get props => [payment];
}
