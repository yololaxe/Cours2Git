import 'package:flutter/material.dart';
import 'package:pizzeria/models/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzéria',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Notre pizzéria'),
    );
  }
}

class MyHomePage extends StatelessWidget{
  String title;
  MyHomePage({required this.title, Key? key}) : super(key:key);

  var _menus = [
    Menu(1, 'Entrées', 'entree.png', Colors.lightGreen),
    Menu(2, 'Pizzas', 'pizza.png', Colors.redAccent),
    Menu(3, 'Desserts', 'dessert.png', Colors.brown),
    Menu(4, 'Boissons', 'boisson.png', Colors.lightBlue)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)  ,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _menus.length,
          itemBuilder: (context, index) => _buildRow(_menus[index]),
          itemExtent: 180,
        ),
      ),
    );
  }
  _buildRow(Menu menu){
    return Container(
      height:180,
    decoration: BoxDecoration(
      color: menu.color,
      borderRadius: BorderRadius.all(Radius.circular(20.0))
    ),
    margin: EdgeInsets.all(4.0),
    child: Column(
      children: <Widget>[

        Expanded(
            child: Image.asset(
              'assets/images/menus/${menu.image}',
              fit: BoxFit.fitWidth,
            ),
        ),
        Container(
          height: 50,
          child: Center(
            child: Text(
              menu.title,
              style : TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                fontSize: 28,
              )
            ),
          ),
        )
      ]
    )
    );
  }

}

