import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue[600],
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.locationArrow),
          Text(
            ' HAERDE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
