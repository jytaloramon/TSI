import 'package:food/src/models/product/product.dart';
import 'package:food/src/core/app_image.dart';

class ProductsList {
  static final data = [
    new Product(
        name: "Burger",
        description: "Burger X",
        price: 23.00,
        imageUrl: AppImage.beefBurger),
    new Product(
        name: "Bolo",
        description: "Chocolate Cake",
        price: 7.00,
        imageUrl: AppImage.cake),
    new Product(
        name: "Chicken Wing",
        description: "Pepper Chicken Wing",
        price: 20.00,
        imageUrl: AppImage.chickenWing),
    new Product(
        name: "Hot Dog",
        description: "Hot Dog chicken and potato",
        price: 10.00,
        imageUrl: AppImage.hotDog),
    new Product(
        name: "Snack",
        description: "House snack",
        price: 17.50,
        imageUrl: AppImage.snack),
    new Product(
        name: "Pizza",
        description: "Pizza Pepperoni",
        price: 45.00,
        imageUrl: AppImage.pizzaPepper),
    new Product(
      name: "Burguer X salada",
      description: "A signature topped with smoked beef",
      price: 16.80,
      imageUrl: AppImage.saladBurger,
    ),
    new Product(
      name: "Burguer X Catupiry",
      description: "Flame-grilled h smoked beef",
      price: 27.50,
      imageUrl: AppImage.catupBurger,
    ),
    new Product(
      name: "Burguer Big",
      description: "Flame-grilled chicken smoked beef",
      price: 30.00,
      imageUrl: AppImage.beefBurger,
    ),
    new Product(
      name: "Pizza G Portuguesa",
      description: "A signature  smoked beef",
      price: 60.80,
      imageUrl: AppImage.pizza,
    ),
    new Product(
      name: "Pizza G de chocolate",
      description: "A signature ped with smoked beef",
      price: 75.80,
      imageUrl: AppImage.pizza,
    ),
    new Product(
      name: "Bolo de morango",
      description: "A signature d with smoked beef",
      price: 10.80,
      imageUrl: AppImage.cakeStraw,
    ),
    new Product(
      name: "Bolo de Cereja",
      description: "patty topped with smoked beef",
      price: 13.00,
      imageUrl: AppImage.cakeCherry,
    ),
  ];
}
