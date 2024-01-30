import 'package:engineering_project/data/vos/product_vo.dart';
import 'package:engineering_project/persistence/hive/constant/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductDao {
  static final ProductDao _singleton = ProductDao._internal();

  factory ProductDao() {
    return _singleton;
  }
  ProductDao._internal();

  /// Persistence

  void saveAllProductsDataBase(List<ProductVO?>? productList) async {
    Map<String?, ProductVO> shelfMap = Map.fromIterable(productList ?? [],
        key: (product) => product.id.toString(), value: (product) => product);
    await getProductBox().putAll(shelfMap);
  }

  void saveSingleProductDataBase(ProductVO? product) async {
    await getProductBox().put(product?.id.toString(), product!);
  }

  void deleteProductDataBase(int? productId) async {
    await getProductBox().delete(productId.toString());
  }

  List<ProductVO>? getAllProductsDataBase() {
    return getProductBox().values.toList();
  }

  ProductVO? getSingleProductDataBase(int? productId) {
    return getProductBox().get(productId.toString());
  }

  /// Reactive

  Stream<List<ProductVO?>?> getAllProductStream() {
    return Stream.value(getAllProductsDataBase());
  }

  Stream<ProductVO?> getSingleProductStream(int? productId) {
    return Stream.value(getSingleProductDataBase(productId));
  }

  Stream<void> watchAllProductsEventStream() {
    return getProductBox().watch();
  }

  /// Box
  Box<ProductVO> getProductBox() {
    return Hive.box<ProductVO>(BOX_NAME_PRODUCT_VO);
  }
}
