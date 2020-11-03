import "package:flutter/material.dart";
import "pages/home.dart";
import "pages/loading.dart";
import "pages/choose_location.dart";

void main() {
  runApp(WorldTimeApp());
}

class WorldTimeApp extends StatelessWidget {
  // This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "World Time",
      initialRoute: "/",
      routes: {
        "/": (context) => LoadingPage(),
        "/home/": (context) => HomePage(),
        "/location/": (context) => ChooseLocationPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
