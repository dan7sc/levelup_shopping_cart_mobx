import 'package:levelup_shopping_cart_mobx/shared/models/product_model.dart';

class CartItemModel {
  late ProductModel product;
  int quantity;

  CartItemModel({
    required this.product,
    required this.quantity,
  });

  CartItemModel copyWith({
    ProductModel? product,
    int? quantity,
  }) {
    return CartItemModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
