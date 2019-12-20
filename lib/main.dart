import 'package:flutter/material.dart';

import 'Article View.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  bool isMain = true;
  PageController myController = PageController(
    initialPage: 0,
  );
  List<Article> myArticles = List<Article>();

  @override
  Widget build(BuildContext context) {
    // myController.jumpTo(1);
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        actions: <Widget>[
          Center(
              child: Text(
            'الرئيسية',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
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
              //   color: Colors.red,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('one'),
                  Text('two'),
                ],
              )),
        ),
      ),
      body: PageView(
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
          profileScreen(),
        ],
      ),
      floatingActionButton: isMain
          ? FloatingActionButton(
              onPressed: dialogeTrigger,
              tooltip: 'Add an article',
              child: Icon(Icons.add),
            )
          : null,
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

  Widget profileScreen() {
    Size screenSize = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              color: Color(0xFF39791b),
              height: screenSize.height / 3.5,
            ),
            Column(
              children: <Widget>[
                SizedBox(height: screenSize.height / 6),
                Center(
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/mo3.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(80.0),
                        border: Border.all(color: Colors.white, width: 5.0)),
                  ),
                ),
                Text(
                  'رامي عياش',
                  style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'mail@mymail.com',
                  style: TextStyle(color: Color(0xFF8a000000), fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    option(Icons.star, 'المفضلة'),
                    option(Icons.settings, 'الإعدادت'),
                    option(Icons.edit, 'تعديل بياناتي'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget option(IconData myIcon, String myString) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          myIcon,
          size: 30,
        ),
        Text(
          myString,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  dialogeTrigger() {
    var myDialog = SimpleDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      children: <Widget>[
        Image.asset(
          'images/mo1.png',
          fit: BoxFit.fitWidth,
        ),
        Text(
          'اكتب تعليقاً حول الصورة',
          textDirection: TextDirection.rtl,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide(width: 5))),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              color: Colors.green,
              onPressed: () {},
              child: Text('post'),
            ),
            FlatButton(onPressed: () {}, child: Text('discard')),
          ],
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
