import 'package:flutter/material.dart';

import 'Article View.dart';
import 'Profile Screen View.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffb2dfdb),
        accentColor: Color(0xFF39796b),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //region intializations
  bool isMain = true;
  PageController myController = PageController(
    initialPage: 0,
  );
  var titleStyle = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'taj');
  static var unselectedStyle = TextStyle(
    fontFamily: 'taj',
    color: Colors.grey,
    fontSize: 20,
  );
  List<Article> myArticles = List<Article>();
//endregion
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: myPageView(),
      floatingActionButton: isMain
          ? FloatingActionButton(
              onPressed: dialogeTrigger,
              tooltip: 'Add an article',
              child: Icon(Icons.add),
            )
          : null,
    );
  }

  //
  //region myWidgets
  PageView myPageView() {
    return PageView(
      controller: myController,
      onPageChanged: (page) {
        if (page == 0) {
          setState(() {
            isMain = true;
          });
        } else
          setState(() {
            isMain = false;
          });
      },
      children: <Widget>[
        mainScreen(),
        ProfileScreen(),
      ],
    );
  }

  Widget mainScreen() {
    return ListView.builder(
      itemBuilder: (context, n) {
        return myArticles[n];
      },
      itemCount: myArticles.length,
    );
  }

  AppBar myAppBar() {
    return AppBar(
      elevation: 10,
      actions: <Widget>[
        Center(child: Text(isMain ? 'الرئيسية' : 'حسابي', style: titleStyle)),
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    child: Text('الرئيسية',
                        style: isMain ? titleStyle : unselectedStyle),
                    onPressed: () {
                      myController.jumpToPage(0);
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    child: Text(
                      'حسابي',
                      style: !isMain ? titleStyle : unselectedStyle,
                    ),
                    onPressed: () {
                      myController.jumpToPage(1);
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
  //endregion

  //dialoge triggered when the fab is pressed
  dialogeTrigger() {
    var localTet =
        TextStyle(fontFamily: 'taj', fontSize: 16, color: Colors.black);
    var myDialog = SimpleDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      children: <Widget>[
        Image.asset(
          'images/mo1.png',
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            'اكتب تعليقاً حول الصورة',
            style: localTet,
            textDirection: TextDirection.rtl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide(width: 5))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                color: Theme.of(context).accentColor,
                onPressed: () {
                  setState(() {
                    myArticles.add(Article());
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  'نشر',
                  style: titleStyle,
                ),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'تجاهل',
                    style: unselectedStyle,
                  )),
            ],
          ),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return myDialog;
        });
  }
}
