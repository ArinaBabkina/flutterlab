//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter lab',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: Colors.black,
      ),
      home: const MyHomePage(title: 'Flutter lab'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController pageController;

  List<String> images = [
    'images/ironman.jpg',
    'images/cap.jpg',
    'images/spiderman.jpg'
  ];

  List<String> names = ["Iron Man", "Captain America", "Spider Man"];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Column(children: [
            Image.asset('images/logo.png'),
            Text("Choose your hero",
                style: TextStyle(color: Colors.white, fontSize: 30))
          ]),
          Expanded(
              child: PageView.builder(
                  controller: pageController,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Slider(position);
                  }))
        ])));
  }

  Slider(int index) {
    return Container(
        child: Center(
            child: Text(names[index],
                style: TextStyle(color: Colors.white, fontSize: 30))),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(images[index]), fit: BoxFit.cover)),
        margin: EdgeInsets.all(20));
  }
}
