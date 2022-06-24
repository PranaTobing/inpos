import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inpos/models/product_checkout.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutLoading()) {
    on<LoadCheckoutData>(_onLoadCheckoutData);
    on<AddCheckoutData>(_onAddCheckoutData);
    on<UpdateOrAddCheckoutData>(_onUpdateOrAddCheckoutData);
    on<DeleteCheckoutData>(_onDeleteCheckoutData);
    on<DeleteAllCheckoutData>(_onDeleteAllCheckoutData);
    on<AddTotalOrderItem>(_onAddTotalOrderItem);
    on<SubtractTotalOrderItem>(_onSubtractTotalOrderItem);
  }

  void _onLoadCheckoutData(
      LoadCheckoutData event, Emitter<CheckoutState> emit) {
    emit(CheckoutLoaded(products: event.products));
  }

  void _onAddCheckoutData(AddCheckoutData event, Emitter<CheckoutState> emit) {
    final state = this.state;
    if (state is CheckoutLoaded) {
      emit(CheckoutLoaded(
          products: List.from(state.products)..add(event.product)));
    }
  }

  void _onUpdateOrAddCheckoutData(
      UpdateOrAddCheckoutData event, Emitter<CheckoutState> emit) {
    final state = this.state;
    if (state is CheckoutLoaded) {
      var contain = state.products
          .where((productx) => productx.productId == event.product.productId);
      if (contain.isEmpty) {
        emit(CheckoutLoaded(
            products: List.from(state.products)..add(event.product)));
      } else {
        List<ProductCheckout> products = (state.products.map((product) {
          return product.productId == event.product.productId
              ? ProductCheckout(
                  productId: product.productId,
                  title: product.title,
                  img: product.img,
                  category: product.category,
                  harga: product.harga,
                  totalOrderItem: product.totalOrderItem + 1,
                )
              : product;
        })).toList();
        emit(CheckoutLoaded(products: products));
      }
    }
  }

  void _onAddTotalOrderItem(
      AddTotalOrderItem event, Emitter<CheckoutState> emit) {
    final state = this.state;
    if (state is CheckoutLoaded) {
      List<ProductCheckout> products = (state.products.map((product) {
        return product.productId == event.product.productId
            ? ProductCheckout(
                productId: product.productId,
                title: product.title,
                img: product.img,
                category: product.category,
                harga: product.harga,
                totalOrderItem: product.totalOrderItem + 1,
              )
            : product;
      })).toList();
      emit(CheckoutLoaded(products: products));
    }
  }

  void _onSubtractTotalOrderItem(
      SubtractTotalOrderItem event, Emitter<CheckoutState> emit) {
    final state = this.state;
    if (state is CheckoutLoaded) {
      List<ProductCheckout> products = (state.products.map((product) {
        return product.productId == event.product.productId
            ? ProductCheckout(
                productId: product.productId,
                title: product.title,
                img: product.img,
                category: product.category,
                harga: product.harga,
                totalOrderItem: product.totalOrderItem - 1,
              )
            : product;
      })).toList();
      emit(CheckoutLoaded(products: products));
    }
  }

  void _onDeleteCheckoutData(
      DeleteCheckoutData event, Emitter<CheckoutState> emit) {
    final state = this.state;
    if (state is CheckoutLoaded) {
      List<ProductCheckout> products = (state.products.where((product) {
        return product.productId != event.product.productId;
      })).toList();

      emit(CheckoutLoaded(products: products));
    }
  }

  void _onDeleteAllCheckoutData(
      DeleteAllCheckoutData event, Emitter<CheckoutState> emit) {
    final state = this.state;
    if (state is CheckoutLoaded) {
      List<ProductCheckout> products = [];
      emit(CheckoutLoaded(products: products));
    }
  }
}
