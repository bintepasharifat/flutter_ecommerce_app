import 'package:flutter/material.dart';
import 'package:flutter_application_7/models/category.dart';
import 'package:flutter_application_7/models/model.dart';
import 'package:flutter_application_7/models/subcategory.dart';
import 'package:flutter_application_7/utils/colors.dart';
import 'package:flutter_application_7/views/items_detail_screen.dart';

class CategoryItems extends StatelessWidget {
  final String category;
  final List<AppModel> categoryItems;
  const CategoryItems(
      {super.key, required this.category, required this.categoryItems});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: SizedBox(
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintText: "$category's Fashin",
                      hintStyle: TextStyle(color: Colors.black38),
                      filled: true,
                      fillColor: fbackgroundColor1,
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.black38,
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    filterCatogory.length,
                    (index) => Padding(
                          padding: EdgeInsets.only(
                            right: 5,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black12),
                            ),
                            child: Row(
                              children: [
                                Text(filterCatogory[index]),
                                SizedBox(
                                  width: 5,
                                ),
                                index == 0
                                    ? Icon(
                                        Icons.filter_list,
                                        size: 15,
                                      )
                                    : Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 15,
                                      )
                              ],
                            ),
                          ),
                        )),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
                    subcategory.length,
                    (index) => InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: fbackgroundColor1,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              subcategory[index].image),
                                        )),
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              Text(subcategory[index].name),
                            ],
                          ),
                        ))),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: categoryItems.isEmpty
                  ? Center(
                      child: Text(
                        "No items available in this category",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    )
                  : GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: categoryItems.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        final item = categoryItems[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      ItemsDetailScreen(eCommercApp: item)),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: item.image,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: fbackgroundColor1,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        item.image,
                                      ),
                                    ),
                                  ),
                                  height: size.height * 0.29,
                                  width: size.width * 0.6,
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.black26,
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "H&M",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black26),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 17,
                                  ),
                                  Text(item.rating.toString()),
                                  Text(
                                    "${item.review}",
                                    style: TextStyle(color: Colors.black26),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.5,
                                    child: Text(
                                      item.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$${item.price.toString()}.00",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.pink,
                                            height: 1.5),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      if (item.isCheck == true)
                                        Text(
                                          "\$${item.price + 50}.00",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Colors.black26,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor: Colors.black26,
                                              height: 1.5),
                                        ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }))
        ],
      )),
    );
  }
}
