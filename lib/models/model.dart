import 'package:flutter/material.dart';

class AppModel {
  final String name, image, description, category;
  final double rating;
  final int review, price;
  List<Color> fcolor;
  List<String> size;
  bool isCheck;

  AppModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.price,
    required this.review,
    required this.fcolor,
    required this.size,
    required this.description,
    required this.isCheck,
    required this.category,
  });
}

List<AppModel> fashionEcommerceApp = [
  AppModel(
      name: " Mesh T_shirt",
      image: "assets/logo/t_shrt4.png",
      rating: 6.4,
      price: 20,
      review: 12,
      fcolor: [
        Colors.black,
        Colors.blue,
        Colors.green,
      ],
      size: ["XS", "S", "M"],
      description: "",
      isCheck: true,
      category: "Women"),
  AppModel(
      name: "Printed Sweatshirt",
      image: "assets/logo/t-shrt1.png",
      rating: 5.9,
      price: 700,
      review: 138,
      fcolor: [
        Colors.black,
        Colors.blue,
        Colors.green,
      ],
      size: ["XS", "S", "XX"],
      description: "",
      isCheck: true,
      category: "Men"),
  AppModel(
      name: "Baby frock",
      image: "assets/logo/baby2.png",
      rating: 4.7,
      price: 400,
      review: 130,
      fcolor: [
        Colors.black,
        Colors.blue,
        Colors.green,
      ],
      size: ["S", "B", "X"],
      description: "",
      isCheck: true,
      category: "Baby"),
  AppModel(
      name: "Casual Hoodie Dress ",
      image: "assets/logo/hoodie1.png",
      rating: 3.9,
      price: 500,
      review: 23,
      fcolor: [
        Colors.red,
        Colors.yellow,
        Colors.brown,
      ],
      size: ["XS", "S", "M"],
      description: "",
      isCheck: true,
      category: "Kids"),
  AppModel(
      name: "Hoodie For Teens",
      image: "assets/logo/hoodie5.png",
      rating: 8.9,
      price: 800,
      review: 436,
      fcolor: [
        Colors.pink,
        Colors.grey,
        Colors.cyan,
      ],
      size: ["XS", "S", "M"],
      description: "",
      isCheck: true,
      category: "Tenn"),
  AppModel(
      name: "Sweet jecket",
      image: "assets/logo/jacket png.png",
      rating: 8.9,
      price: 800,
      review: 436,
      fcolor: [
        Colors.pink,
        Colors.grey,
        Colors.cyan,
      ],
      size: ["XS", "S", "M"],
      description: "",
      isCheck: true,
      category: "Tenn"),
];

const MyDescription1 =
    "Elevate your casual wardrobe with our Oversized fit Printed Mesh. Crafted from premuim cotton for maximum camfort,this relaxed-fit tee features";
const MyDescription2 =
    "Crafted from premium cotton for maximum camfort,this relaxed-fit tee";
