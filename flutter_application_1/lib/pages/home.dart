import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/category_model.dart';
import 'package:flutter_application_1/service/category_data.dart';
import 'package:flutter_application_1/service/widget_support.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home>{
List<CategoryModel> categories = [];
String track = "0";


@override
void initState() {
  categories = getCategories();
  super.initState();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0 ),
        child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "images/logo.png",
                 width: 120.0,
                  height: 70.0, fit: BoxFit.contain,
                ),
                Text("Order your favorite food!", style: AppWidget.SimpleTextFeildStyle(),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                "images/boy.png",
                 width: 70.0,
                  height: 70.0, fit: BoxFit.cover,
                ),
            ),
          ),
        ],
        ),
        SizedBox(height: 30.0,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20.0),
                margin: EdgeInsets.only(right: 20.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Search Food...."
                  ),
                )
                ),
            ),
              Container(
                margin: EdgeInsets.only(right: 10.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(color: (Color.fromARGB(255, 12, 114, 51)),borderRadius: BorderRadius.circular(10.0)),
                child: Icon(Icons.search, color: Colors.grey[400],size: 30.0,),
              )
          ],
        ),
        SizedBox(height: 17.0,),
        Container(
          height: 70.0,
           margin: EdgeInsets.only(top: 20.0),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index){
             return CategoryTile(
              categories[index].name!, categories[index].image!,
              index.toString());
          }),
        )
      ],),
      ),
    );
  }
  Widget CategoryTile(String name, String image, String categoryindex){
    return GestureDetector(
         onTap: () {
  track = categoryindex.toString();
        setState(() {
          
        });
        },
        child: track == categoryindex? 
        Container(
          margin: EdgeInsets.only(right: 20.0, bottom: 10.0),
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(30.0),
            child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
            
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 35, 102, 4), borderRadius: BorderRadius.circular(30.0)),
            child: Row(children: [
             Image.asset(
              image, 
              height: 40.0, 
              width: 40.0, fit: BoxFit.cover,
             ),
             SizedBox(width: 10.0,),
             Text(
              name,
               style: AppWidget.whiteTextFeildStyle(),
               )
            ],
            ),
                  ),
          ),
        ): Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        margin: EdgeInsets.only(right: 20.0, bottom: 10.0),
        decoration: BoxDecoration(
          color: Color(0xFFececf8), borderRadius: BorderRadius.circular(30.0)
        ),
        child: Row(children: [
          Image.asset(
 image, 
  height: 40.0, 
  width: 40.0, fit: BoxFit.cover,
 ),
 SizedBox(width: 10.0,),
 Text(
   name,
   style: AppWidget.SimpleTextFeildStyle(),
   )
        ],),
      ),
      );
  }
}

