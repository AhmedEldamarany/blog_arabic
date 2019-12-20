import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
