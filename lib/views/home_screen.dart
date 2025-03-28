import 'package:flutter/material.dart';
import 'package:flutter_application_7/models/category_model.dart';
import 'package:flutter_application_7/models/model.dart';
import 'package:flutter_application_7/utils/colors.dart';
import 'package:flutter_application_7/views/category_items.dart';
import 'package:flutter_application_7/views/items_detail_screen.dart';

import 'package:flutter_application_7/views/widgets/banner.dart';
import 'package:flutter_application_7/views/widgets/curated_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            // for header parts
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/logo/logo.png",
                    height: 50,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.shopping_bag,
                        size: 28,
                      ),
                      Positioned(
                          right: -3,
                          top: -5,
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              child: Text(
                                "3",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),
            MyBanner(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shop By Cayegory",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0,
                      color: Colors.black45,
                    ),
                  )
                ],
              ),
            ),
            // for category
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      category.length,
                      (index) => InkWell(
                            onTap: () {
                            
                            final filterItems = fashionEcommerceApp.where((item)=>item.category.toLowerCase()==category[index].name.toLowerCase())
                            .toList();
                            // Nvigate to the categoryItems screen with the filtered
                          Navigator.push(context,
                           MaterialPageRoute(builder: (_)=>CategoryItems(
                            category: category[index].name,
                            categoryItems: filterItems
                            )
                            )
                           );
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: fbackgroundColor1,
                                    backgroundImage:
                                        AssetImage(category[index].image),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(category[index].name),
                              ],
                            ),
                          ))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cureted For You",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0,
                      color: Colors.black38,
                    ),
                  )
                ],
              ),
            ),
            // for curated items
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(fashionEcommerceApp.length, (index) {
                final eCommerceItems = fashionEcommerceApp[index];
                return Padding(
                  padding: index == 0
                      ? EdgeInsets.symmetric(horizontal: 20)
                      : EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ItemsDetailScreen(
                                    eCommercApp: eCommerceItems,
                                  )));
                    },
                    child: CuratedItems(
                        eCommerceItems: eCommerceItems, size:size),
                  ),
                );
              })),
            )
          ],
        ),
      ),
    );
  }
}
