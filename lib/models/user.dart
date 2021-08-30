//import 'package:food_app_ui/models/food_model.dart';
import 'package:food_app_ui/models/order.dart';

class User {
  final String name;
  final List<Order> orders;
  final List<Order> cart;
  User({required this.name, required this.orders, required this.cart});
}
