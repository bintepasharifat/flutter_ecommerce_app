import 'package:flutter/material.dart';
import 'package:flutter_application_7/models/model.dart';
import 'package:flutter_application_7/utils/colors.dart';

class ItemsDetailScreen extends StatefulWidget {
  final AppModel eCommercApp;
  const ItemsDetailScreen({super.key, required this.eCommercApp});

  @override
  State<ItemsDetailScreen> createState() => _ItemsDetailScreenState();
}

class _ItemsDetailScreenState extends State<ItemsDetailScreen> {
  int currentIndex = 0;
  int selectedColorIndex = 1;
  int selectedSizeIndex = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: fbackgroundColor1,
      appBar: AppBar(
        backgroundColor: fbackgroundColor1,
        title: Text("Detail Product"),
        actions: [
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
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: fbackgroundColor1,
            height: size.height * 0.46,
            width: size.width,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Hero(
                      tag: widget.eCommercApp.image,
                      child: Image.asset(
                        widget.eCommercApp.image,
                        height: size.height * 0.4,
                        width: size.width * 0.85,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          3,
                          (index) => AnimatedContainer(
                                duration: Duration(microseconds: 300),
                                margin: EdgeInsets.only(right: 4),
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: index == currentIndex
                                        ? Colors.white
                                        : Colors.red.shade400),
                              )),
                    )
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "H&M",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black26),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 17,
                    ),
                    Text(widget.eCommercApp.rating.toString()),
                    Text(
                      "${widget.eCommercApp.review}",
                      style: TextStyle(color: Colors.black26),
                    ),
                    Spacer(),
                    Icon(Icons.favorite_border),
                    Text(
                      widget.eCommercApp.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        height: 1.5,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${widget.eCommercApp.price.toString()}.00",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.pink,
                              height: 1.5),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        if (widget.eCommercApp.isCheck == true)
                          Text(
                            "\$${widget.eCommercApp.price + 250}.00",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.black26,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.black26,
                                height: 1.5),
                          ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text("$MyDescription1 ${widget.eCommercApp.name}",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black38,
                        letterSpacing: -1)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width / 2.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Colors",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: widget.eCommercApp.fcolor
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                final int index = entry.key;
                                final color = entry.value;
                                return Padding(
                                  padding: EdgeInsets.only(top: 10, right: 10),
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: color,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedColorIndex = index;
                                        });
                                      },
                                      child: Icon(
                                        Icons.check,
                                        color: selectedColorIndex == index
                                            ? Colors.white
                                            : Colors.transparent,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width / 2.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Size",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: widget.eCommercApp.size
                                    .asMap()
                                    .entries
                                    .map((entry) {
                              final int index = entry.key;
                              final String size = entry.value;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColorIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10, top: 10),
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: selectedSizeIndex == index
                                          ? Colors.black
                                          : Colors.white,
                                      border: Border.all(
                                        color: selectedColorIndex == index
                                            ? Colors.black
                                            : Colors.black12,
                                      )),
                                  child: Center(
                                    child: Text(
                                      size,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: selectedColorIndex == index
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              );
                            }).toList()),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.white,
        elevation: 0,
        label: SizedBox(
          width: size.width * 0.9,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                ),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      color: Colors.black38,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "ADD TO CART",
                      style: TextStyle(color: Colors.black, letterSpacing: -1),
                    )
                  ],
                ),
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                ),
                color: Colors.black,
                child: Center(
                  child: Text(
                    "BY NOW",
                    style: TextStyle(color: Colors.white, letterSpacing: -1),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
