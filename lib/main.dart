import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
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
      ),
      body: PageView(
        children: <Widget>[
          mainScreen(),
          profileScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add an article',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget mainScreen() {
    return ListView(
      children: <Widget>[article(), article(), article()],
    );
  }

  Widget article() {
    return Card(
      elevation: 3,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.sentiment_satisfied),
              Icon(Icons.sentiment_satisfied),
              Icon(Icons.sentiment_satisfied),
              Text('اسم المستخدم '),
              CircleAvatar(),
            ],
          ),
          Image.asset(
            'images/mo1.png',
            fit: BoxFit.fitWidth,
          ),
          Text(
              'هذا النص الجميل يستعمل للتعليق على المقال المعين ويمكن تغييره من شخص لآخر على حسب المزاج والأشياء الأخرى مثل ')
        ],
      ),
    );
  }

  Widget profileScreen() {
    Size screenSize = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            _buildCoverImage(screenSize),
            Column(
              children: <Widget>[
                SizedBox(height: screenSize.height / 6),
                _buildProfileImage(),
                _buildName()
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      color: Color(0xFF39791b),
      height: screenSize.height / 3.5,
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/oppo1.jpg'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(80.0),
            border: Border.all(color: Colors.white, width: 10.0)),
      ),
    );
  }

  Widget _buildName() {
    TextStyle textStyle = TextStyle(
        fontSize: 28.0, color: Colors.black, fontWeight: FontWeight.w700);
    return Text(
      'Ahmed Alaa',
      style: textStyle,
    );
  }
}
