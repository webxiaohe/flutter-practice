import "package:flutter/material.dart";
import "package:flutter/services.dart";

class SurveyScreen extends StatefulWidget {
  @override
  createState() => new SurveyScreenState();
}

class SurveyScreenState extends State<SurveyScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.grey[300]));
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("现场勘查", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: RandomWords(),
    );
  }
}

class Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset("images/field-banner.png", fit: BoxFit.fill);
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<String> _advices = <String>["advice", "suggest", "god"];

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: _buildAdvice(),
    );
  }

  Widget _buildAdvice() {
    return new ListView.builder(
        itemCount: _advices.length + 1,
        // padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          if (i == 0) {
            return Banner();
          }
          i -= 1;
          // if (i.isOdd) {
          //   return new Divider();
          // }
          // 将i取整
          // i = i ~/ 2;
          return Padding(
              padding: EdgeInsets.all(10),
              child: Text(_advices[i],
                  style: TextStyle(color: Colors.black, fontSize: 16)));
        });
  }
}
