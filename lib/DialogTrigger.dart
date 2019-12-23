import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Article View.dart';
import 'Constants.dart';
import 'Photographia.dart';
import 'ProvideMe.dart';

dialogeTrigger(BuildContext context) {
  File imageFile;
  TextEditingController myInput = TextEditingController();

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
                  myInput.clear();

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
