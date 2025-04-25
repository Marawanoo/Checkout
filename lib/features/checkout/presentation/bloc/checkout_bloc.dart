import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/product_item_model.dart';
import '../../domain/usecases/make_payment_usecase.dart';
import 'checkout_event.dart';
import 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final MakePaymentUseCase makePaymentUseCase;
  CheckoutBloc({required this.makePaymentUseCase}) : super(CheckoutInitial()) {
    on<MakePaymentEvent>((event, emit) async {
      emit(CheckoutLoading());
      try {
        await makePaymentUseCase(event.inputModel);
        emit(CheckoutSuccess());
      } catch (e) {
        emit(CheckoutFailure(e.toString()));
      }
    });
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
    on<UpdateQuantity>(_onUpdateQuantity);
    on<ClearCart>(_onClearCart);
  }

  List items = [
    ProductItemModel(
        id: '0',
        imagePath: 'assets/images/Rectangle 344.png',
        title: 'LAMEREI',
        subtitle: 'Recycle Boucle Knit Cardigan Pink',
        price: 120,
        quantity: 2)
  ];

  void _onAddProduct(AddProduct event, Emitter<CheckoutState> emit) {
    final updatedList = List<ProductItemModel>.from(state.products)
      ..add(event.product);

    emit(state.copyWith(
      products: updatedList,
      totalPrice: _calculateTotal(updatedList),
    ));
  }

  void _onRemoveProduct(RemoveProduct event, Emitter<CheckoutState> emit) {
    final updatedList = state.products
        .where((product) => product.id != event.productId)
        .toList();

    emit(state.copyWith(
      products: updatedList,
      totalPrice: _calculateTotal(updatedList),
    ));
  }

  void _onUpdateQuantity(UpdateQuantity event, Emitter<CheckoutState> emit) {
    final updatedList = state.products.map((product) {
      if (product.id == event.productId) {
        return product.copyWith(quantity: event.newQuantity);
      }
      return product;
    }).toList();

    emit(state.copyWith(
      products: updatedList,
      totalPrice: _calculateTotal(updatedList),
    ));
  }

  void _onClearCart(ClearCart event, Emitter<CheckoutState> emit) {
    emit(const CheckoutState());
  }

  double _calculateTotal(List<ProductItemModel> products) {
    return products.fold(0.0, (total, product) {
      return total + (product.price * product.quantity);
    });
  }
}
