import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.sentiment_satisfied),
                Icon(Icons.sentiment_satisfied),
                Icon(Icons.sentiment_satisfied),
                Text('عنوان المقالة'),
                CircleAvatar(),
              ],
            ),
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
}
