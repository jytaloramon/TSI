import 'package:food/src/core/app_image.dart';
import 'package:food/src/models/product/product_purchase.dart';

class Favorite {
  static final dataId = [];

  static bool isExistId(int id) {
    for (var el in dataId) {
      if (id == el) return true;
    }
    return false;
  }
}
