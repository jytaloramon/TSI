import 'package:food/src/models/product/product.dart';

class ProductPurchase extends Product {
  int amount;
  String dimension;

  ProductPurchase({
    required name,
    required description,
    required price,
    required this.amount,
    required this.dimension,
    required imageUrl,
  }) : super(
            name: name,
            description: description,
            price: price,
            imageUrl: imageUrl);
}
