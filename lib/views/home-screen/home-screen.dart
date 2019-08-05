import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/views/survey-screen/survey-screen.dart';

class HomeScreen extends StatelessWidget {
  final _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
          decoration: BoxDecoration(color: Colors.grey[100]),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Banner(),
              Content(),
            ],
          ),
        ),
        drawer: new Drawer(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Drawer"),
              RaisedButton(
                child: Text("Back"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          )),
        ),
        bottomNavigationBar:
            BottomNavigationBar(currentIndex: _selectedIndex, items: const <
                BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        ]));
  }
}

class Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        Image.asset(
          "images/banner.png",
          fit: BoxFit.fill,
        )
      ],
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: 14),
      child: new Wrap(
        children: <Widget>[Survey(), Plan(), Sample(), Detection()],
      ),
    );
  }
}

class Survey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return new GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              new MaterialPageRoute(builder: (context) => new SurveyScreen()));
        },
        child: new Container(
          width: size.width / 2 - 2,
          decoration: new BoxDecoration(
              color: Colors.white,
              border: Border(
                right: BorderSide(
                    color: Colors.grey[100],
                    style: BorderStyle.solid,
                    width: 2),
                bottom: BorderSide(
                    color: Colors.grey[100],
                    style: BorderStyle.solid,
                    width: 2),
              )),
          padding: new EdgeInsets.symmetric(vertical: 30),
          child: new Column(
            children: <Widget>[
              Image.asset(
                "images/field.png",
                width: 66,
                height: 60,
              ),
              Padding(
                padding: new EdgeInsets.only(top: 15),
                child: Text("踏勘",
                    style: new TextStyle(
                        fontSize: 16,
                        letterSpacing: 5,
                        color: Colors.black54,
                        decoration: TextDecoration.none)),
              )
            ],
          ),
        ));
  }
}

class Plan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return new Container(
      color: Colors.white,
      width: size.width / 2,
      padding: new EdgeInsets.symmetric(vertical: 30),
      child: new Column(
        children: <Widget>[
          Image.asset(
            "images/plan.png",
            width: 66,
            height: 60,
          ),
          Padding(
            padding: new EdgeInsets.only(top: 15),
            child: Text("方案",
                style: new TextStyle(
                    fontSize: 16,
                    letterSpacing: 5,
                    color: Colors.black54,
                    decoration: TextDecoration.none)),
          )
        ],
      ),
    );
  }
}

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return new Container(
      width: size.width / 2 - 2,
      decoration: new BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(
                color: Colors.grey[100], style: BorderStyle.solid, width: 2),
            bottom: BorderSide(
                color: Colors.grey[100], style: BorderStyle.solid, width: 2),
          )),
      padding: new EdgeInsets.symmetric(vertical: 30),
      child: new Column(
        children: <Widget>[
          Image.asset(
            "images/sample.png",
            width: 66,
            height: 60,
          ),
          Padding(
            padding: new EdgeInsets.only(top: 15),
            child: Text("采样",
                style: new TextStyle(
                    fontSize: 16,
                    letterSpacing: 5,
                    color: Colors.black54,
                    decoration: TextDecoration.none)),
          )
        ],
      ),
    );
  }
}

class Detection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return new Container(
      width: size.width / 2,
      decoration: new BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(
                color: Colors.grey[100], style: BorderStyle.solid, width: 2),
            bottom: BorderSide(
                color: Colors.grey[100], style: BorderStyle.solid, width: 2),
          )),
      padding: new EdgeInsets.symmetric(vertical: 30),
      child: new Column(
        children: <Widget>[
          Image.asset(
            "images/detection.png",
            width: 66,
            height: 60,
          ),
          Padding(
            padding: new EdgeInsets.only(top: 15),
            child: Text("检测",
                style: new TextStyle(
                    fontSize: 16,
                    letterSpacing: 5,
                    color: Colors.black54,
                    decoration: TextDecoration.none)),
          )
        ],
      ),
    );
  }
}
