import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/product_model.dart';
import '../../repositories/data_product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    final DataProductRepository dataProductRepository = DataProductRepository();

    on<GetProductList>((event, emit) async {
      emit(ProductLoading());
      final dataList = await dataProductRepository.fetchProductList();
      emit(ProductLoaded(dataList));
    });
  }
}
