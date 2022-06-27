import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inpos/models/payment_cash.dart';

part 'payment_cash_event.dart';
part 'payment_cash_state.dart';

class PaymentCashBloc extends Bloc<PaymentCashEvent, PaymentCashState> {
  PaymentCashBloc() : super(PaymentCashLoading()) {
    on<LoadPaymentCash>((event, emit) {
      emit(PaymentCashLoaded(payment: event.payment));
    });

    on<ChangePaymentCash>((event, emit) {
      final state = this.state;
      if (state is PaymentCashLoaded) {
        PaymentCash payment = PaymentCash(
          subTotal: event.payment.subTotal,
          tax: (event.payment.subTotal * 0.11),
          total: event.payment.subTotal + (event.payment.subTotal * 0.11),
          cash: event.payment.cash,
          change: event.payment.cash -
              (event.payment.subTotal + (event.payment.subTotal * 0.11)),
        );
        emit(PaymentCashLoaded(payment: payment));
      }
    });

    on<ResetPaymentCash>((event, emit) {
      final state = this.state;
      if (state is PaymentCashLoaded) {
        PaymentCash payment = PaymentCash(
          subTotal: event.payment.subTotal,
          tax: (event.payment.subTotal * 0.11),
          total: event.payment.subTotal + (event.payment.subTotal * 0.11),
          cash: event.payment.cash,
          change: event.payment.cash -
              (event.payment.subTotal + (event.payment.subTotal * 0.11)),
        );
        emit(PaymentCashLoaded(payment: payment));
      }
    });
  }
}
