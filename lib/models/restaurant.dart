import 'package:food_app_ui/models/food_model.dart';

class Restaurant {
  final String imageUrl;
  final String name;
  final String address;
  final int ratings;
  final List<Food> menu;

  Restaurant(
      {required this.imageUrl,
      required this.name,
      required this.address,
      required this.ratings,
      required this.menu});
}
