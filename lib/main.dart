import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Constants.dart';
import 'DialogTrigger.dart';
import 'ProfileScreenView.dart';
import 'ProvideMe.dart';

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

  BuildContext myContext;
//endregion
  //
  @override
  Widget build(BuildContext context) {
    myContext = context;

    return Scaffold(
      appBar: myAppBar(),
      body: myPageView(),
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
    return Scaffold(
        body: Consumer<ProvideMyArticle>(
          builder: (context, provided, child) {
            return ListView.builder(
              itemBuilder: (context, n) {
                return provided.myArticles[n];
              },
              itemCount: provided.myArticles.length,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            dialogeTrigger(myContext);
          },
          tooltip: 'Add an article',
          child: Icon(Icons.add),
        ));
  }

  AppBar myAppBar() {
    return AppBar(
      elevation: 10,
      actions: <Widget>[
        Center(child: Text('الرئيسية', style: titleStyle)),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ],
      bottom: TabBar(
        onTap: (ine) {
          print(ine);
        },
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
}
