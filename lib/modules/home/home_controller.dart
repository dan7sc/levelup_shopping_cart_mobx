import 'package:levelup_shopping_cart_mobx/shared/models/product_model.dart';
import 'package:levelup_shopping_cart_mobx/shared/utils/extensions.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  String errorMessage = "";

  @observable
  AppStatus appStatus = AppStatus.empty;

  @observable
  // ObservableList<ProductModel> products = ObservableList.of(<ProductModel>[]);
  List<ProductModel> products = <ProductModel>[];

  @action
  Future<void> getProducts() async {
    try {
      appStatus = AppStatus.loading;
      products = await Future.delayed(Duration(seconds: 2)).then(
        (value) => List.generate(
          50,
          (index) => ProductModel(
            id: index.toString(),
            name: "Produto $index ",
            price: 1.0 * index,
          ),
        ),
      );

      appStatus = products.isNotEmpty ? AppStatus.success : AppStatus.empty;
    } on PlatformException catch (e) {
      errorMessage = e.message.toString();
      appStatus = AppStatus.error;
    } catch (e) {
      errorMessage = e.toString();
      appStatus = AppStatus.error;
      appStatus.message();
    }
  }
}
