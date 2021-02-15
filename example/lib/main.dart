import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'custom-widget-tabs.widget.dart';
import './MainScreen2.dart';
import './MainScreen3.dart';
import './DefaultStyledNavBarWidget.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar example project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MainMenu(),
      home: NavigationController(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/first': (context) => MainScreen2(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => MainScreen3(),
      },
    );
  }
}

class MainMenu extends StatefulWidget {
  MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Project"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text("Custom widget example"),
              onPressed: () => pushNewScreen(
                context,
                screen: NavigationController( // for nested context
                  rootScreenContext: context,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
            child: RaisedButton(
              child: Text("Built-in styles example"),
              onPressed: () => pushNewScreen(
                context,
                screen: ProvidedStylesExample(
                  rootScreenContext: context,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
