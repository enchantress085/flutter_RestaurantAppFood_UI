import 'package:food_app_ui/models/food_model.dart';
import 'package:food_app_ui/models/order.dart';
import 'package:food_app_ui/models/restaurant.dart';
import 'package:food_app_ui/models/user.dart';

//Fast Food
final _pizza = Food(name: 'Pizza', imgUrl: 'assets/images/1.jpg', price: 5.00);
final _pasta = Food(name: 'PAsta', imgUrl: 'assets/images/2.jpg', price: 6.00);
final _burger =
    Food(name: 'Burger', imgUrl: 'assets/images/3.jpg', price: 7.00);
final _alu = Food(name: 'Alu', imgUrl: 'assets/images/4.jpg', price: 8.00);

//Restaurant
final _restaurant1 = Restaurant(
  imageUrl: 'assets/images/r1.jpg',
  name: 'Wow Hut',
  address: 'Gazipur',
  ratings: 5,
  menu: [_pizza, _pasta, _alu, _burger],
);

final _restaurant2 = Restaurant(
  imageUrl: 'assets/images/r2.jpg',
  name: 'Pasta Hut',
  address: 'Gazipur',
  ratings: 5,
  menu: [_pizza, _pasta, _burger, _alu, _alu],
);
final _restaurant3 = Restaurant(
  imageUrl: 'assets/images/r3.jpg',
  name: 'Chicken Hut',
  address: 'Paglapur',
  ratings: 5,
  menu: [_pizza, _pasta],
);

List<Restaurant> restaurants = [
  _restaurant1,
  _restaurant2,
  _restaurant3,
];

////Users
final currentUser = User(
  name: 'Shaju',
  orders: [
    Order(
        restaurant: _restaurant1,
        food: _pizza,
        date: 'nov 10, 2021',
        quantity: 1),
    Order(
        restaurant: _restaurant1,
        food: _pasta,
        date: 'nov 20, 2021',
        quantity: 2),
    Order(
        restaurant: _restaurant2,
        food: _alu,
        date: 'nov 50, 2021',
        quantity: 2),
    Order(
        restaurant: _restaurant3,
        food: _burger,
        date: 'nov 70, 2021',
        quantity: 2),
  ],
  cart: [
    Order(
        restaurant: _restaurant2,
        food: _pasta,
        date: 'july 10, 2021',
        quantity: 1)
  ],
);
