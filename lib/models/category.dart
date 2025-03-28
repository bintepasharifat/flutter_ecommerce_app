class Category {
  String name;
  String Image;
  Category({required this.name,required this.Image});
}

List<Category>category =[
  Category(name: "Kids",
   Image: "assets/logo/baby4.png"),
    Category(name: "Baby",
   Image: "assets/logo/baby3.png"),
   
];
List<String>filterCatogory =[
"Filter",
"Ratings",
"Size",
"Color",
"Brand",
"price",

];