import 'package:flutter/material.dart';
import 'package:food_app_ui/data/food_data.dart';
import 'package:food_app_ui/models/restaurant.dart';
import 'package:food_app_ui/screens/restaurant_screen.dart';
import 'package:food_app_ui/widgets/ratings.dart';
import 'package:food_app_ui/widgets/recent_orders.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: Icon(Icons.account_circle_rounded)),
        title: Center(
            child: Text(
          "Food Delivary",
        )),
        actions: [
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () {},
            child: Text(
              "Cart (5)",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              showCursor: true,
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(0.2),
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.purple.withOpacity(0.5),
                  size: 30,
                ),
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.clear,
                      color: Colors.purple.withOpacity(0.5),
                      size: 25,
                    )),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.purple.shade400, width: 2),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Nearby Restaurents',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              _buildRestaurants(),
            ],
          ),
        ],
      ),
    );
  }

  _buildRestaurants() {
    List<Widget> restaurentList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurentList.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestauranScreen(restaurant: restaurant),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                width: 2.0,
                color: Colors.purple.withOpacity(0.5),
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image(
                      width: 150,
                      height: 130,
                      fit: BoxFit.cover,
                      image: AssetImage(restaurant.imageUrl),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      RatingStars(restaurant.ratings),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '0.2 Mailes Awey',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        restaurant.address,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Column(children: restaurentList);
  }
}
