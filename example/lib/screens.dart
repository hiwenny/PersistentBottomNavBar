import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import './MainScreen2.dart';
import './MainScreen3.dart';
import 'modal-screen.dart';

class TabMainScreen extends StatelessWidget {
  final BuildContext rootScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  const TabMainScreen(
      {Key key,
      this.rootScreenContext,
      this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.indigo,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                child: TextField(
                  decoration: InputDecoration(hintText: "Test Text Field"),
                ),
              ),
              Center(
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: '/home'),
                      screen: MainScreen2(),
                      // pageTransitionAnimation:
                      //     PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: Text(
                    "Go to Second Screen ->",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: '/home'),
                      screen: MainScreen3(),
                      // pageTransitionAnimation:
                      //     PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: Text(
                    "Go to Third Screen ->",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  color: Colors.deepOrange,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      useRootNavigator: true,
                      builder: (context) => Center(
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.blue,
                          child: Text(
                            "Exit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Push bottom sheet on TOP of Nav Bar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  color: Colors.deepOrange,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      useRootNavigator: false,
                      builder: (context) => Center(
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.blue,
                          child: Text(
                            "Exit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Push bottom sheet BEHIND the Nav Bar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  color: Colors.lime,
                  onPressed: () {
                    pushDynamicScreen(context,
                        screen: SampleModalScreen(), withNavBar: true);
                  },
                  child: Text(
                    "Push Dynamic/Modal Screen",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  color: Colors.purpleAccent,
                  onPressed: () {
                    this.onScreenHideButtonPressed();
                  },
                  child: Text(
                    this.hideStatus
                        ? "Unhide Navigation Bar"
                        : "Hide Navigation Bar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.of(this.rootScreenContext).pop();
                  },
                  child: Text(
                    "<- Main Menu",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
