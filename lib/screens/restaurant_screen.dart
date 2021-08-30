import 'dart:html';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:food_app_ui/data/food_data.dart';
import 'package:food_app_ui/models/food_model.dart';
import 'package:food_app_ui/models/restaurant.dart';
import 'package:food_app_ui/widgets/ratings.dart';

class RestauranScreen extends StatefulWidget {
  //const RestauranScreen({Key? key}) : super(key: key);
  final Restaurant restaurant;
  RestauranScreen({required this.restaurant});
  @override
  _RestauranScreenState createState() => _RestauranScreenState();
}

class _RestauranScreenState extends State<RestauranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 25,
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite),
                      iconSize: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '0.2 miles awey',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.7)),
                    ),
                  ],
                ),
                RatingStars(widget.restaurant.ratings),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  'Reviews',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  'Contact',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Menu',
              style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.5,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10),
              crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return Center(
                  child: _buildMenuItem(food),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  _buildMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(menuItem.imgUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.deepPurple.withOpacity(0.3),
                ],
                stops: [0.2, 0.3, 0.8],
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  menuItem.name,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text(
                  '\$${menuItem.price}',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              //margin: EdgeInsets.only(right: 20),
              //width: 38,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                iconSize: 20.0,
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
