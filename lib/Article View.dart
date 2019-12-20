import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  //
  //region  initializing

  String articleTitle = 'عنوان المقال';
  String article =
      'هذا النص الجميل يستعمل للتعليق على المقال المعين ويمكن تغييره من شخص لآخر على حسب المزاج والأشياء الأخرى مثل ';
  var myTextStyle = TextStyle(
    fontFamily: 'taj',
    fontSize: 17,
    color: Colors.grey[700],
  );

  //endregion

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.favorite,
                  color: Colors.grey[700],
                ),
                Icon(Icons.bookmark, color: Colors.grey[700]),
                Icon(Icons.share, color: Colors.grey[700]),
                SizedBox(
                  width: 20,
                ),
                Text(
                  articleTitle,
                  textDirection: TextDirection.rtl,
                  style: myTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                CircleAvatar(),
              ],
            ),
          ),
          Image.asset(
            'images/mo1.png',
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article,
              textDirection: TextDirection.rtl,
              style: myTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
