import 'package:flutter/material.dart';
import 'package:food_app_ui/data/food_data.dart';
import 'package:food_app_ui/models/order.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Recent Orders",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: 120,
          //color: Colors.purple,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.orders[index];
              return _buildRecentOrders(context, order);
            },
          ),
        ),
      ],
    );
  }

  _buildRecentOrders(BuildContext context, Order order) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          width: 300.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5.0,
                blurRadius: 6.0,
                offset: Offset(0.0, 15.0),
              ),
            ],
            borderRadius: BorderRadius.circular(40),
          ),
          child: Container(
            width: 300.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                width: 2.0,
                color: Colors.purple,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                          image: AssetImage(
                            order.food.imgUrl,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.food.name + ' idciasbsxjsbhxcugv',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                order.restaurant.name + ' idciasbsxjsbhxcugv',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                order.date,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15.0),
                  width: 48.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    iconSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
