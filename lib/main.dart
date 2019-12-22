import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Article View.dart';
import 'Photographia.dart';
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
      home: ChangeNotifierProvider<ProvideMyArticle>(
        child: DefaultTabController(
          child: MyHomePage(),
          length: 2,
        ),
        create: (context) => ProvideMyArticle(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  //region intializations

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
  TextEditingController myInput = TextEditingController();
  BuildContext myContext;
  bool myIsMain;
//endregion
  //
  @override
  Widget build(BuildContext context) {
    myContext = context;
    myIsMain = Provider.of<ProvideMyArticle>(myContext).isMain;
    return Scaffold(
      appBar: myAppBar(),
      body: myPageView(),
      floatingActionButton: myIsMain
          ? FloatingActionButton(
              onPressed: () => dialogeTrigger(context),
              tooltip: 'Add an article',
              child: Icon(Icons.add),
            )
          : null,
    );
  }

  //
  //region myWidgets
  TabBarView myPageView() {
    return TabBarView(
      children: <Widget>[
        mainScreen(),
        ProfileScreen(),
      ],
    );
  }

  Widget mainScreen() {
    return Consumer<ProvideMyArticle>(
      builder: (context, provided, child) {
        return ListView.builder(
          itemBuilder: (context, n) {
            return provided.myArticles[n];
          },
          itemCount: provided.myArticles.length,
        );
      },
    );
  }

  AppBar myAppBar() {
    return AppBar(
      elevation: 10,
      actions: <Widget>[
        Center(child: Text(myIsMain ? 'الرئيسية' : 'حسابي', style: titleStyle)),
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ],
      bottom: TabBar(
        tabs: [
          Tab(
            child: Text(
              'الرئيسية',
              style: titleStyle,
            ),
          ),
          Tab(
            child: Text(
              'حسابي',
              style: titleStyle,
            ),
          )
        ],
      ),
    );
  }
  //endregion

  //dialoge triggered when the fab is pressed
  dialogeTrigger(BuildContext context) {
    File imageFile;
    var localTet =
        TextStyle(fontFamily: 'taj', fontSize: 16, color: Colors.black);
    var myDialog = SimpleDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      children: <Widget>[
        InkWell(
          child: Image.asset(
            'images/mo1.png',
            fit: BoxFit.fitWidth,
          ),
          onTap: () async {
            File myimageFile = await Photographia().getImageFromGallery();
            imageFile = myimageFile;
          },
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
            controller: myInput,
            maxLength: 150,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(width: 5),
              ),
            ),
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
                  Provider.of<ProvideMyArticle>(context).add(Article(
                    myInput.text,
                    imageFile: imageFile,
                  ));
                  Navigator.of(context).pop();
                  myInput.clear();
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

class ProvideMyArticle extends ChangeNotifier {
  List<Article> myArticles = List<Article>();
  bool isMain = true;
  changeMain() {
    if (isMain)
      isMain = false;
    else
      isMain = true;

    notifyListeners();
  }

  add(Article article) {
    myArticles.add(article);

    notifyListeners();
  }
}

//PreferredSize(
//preferredSize: Size.fromHeight(50),
//child: Container(
//height: 50,
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: <Widget>[
//Expanded(
//child: FlatButton(
//child: Text('الرئيسية',
//style: myIsMain ? titleStyle : unselectedStyle),
//onPressed: () {
//myController.jumpToPage(0);
//},
//),
//),
//Expanded(
//child: FlatButton(
//child: Text(
//'حسابي',
//style: !myIsMain ? titleStyle : unselectedStyle,
//),
//onPressed: () {
//myController.jumpToPage(1);
//},
//),
//),
//],
//)),
//),
