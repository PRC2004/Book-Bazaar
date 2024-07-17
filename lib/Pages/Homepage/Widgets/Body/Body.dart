import 'package:e_book/Pages/Homepage/Widgets/MyInputeTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'LoadAll.dart';
import 'Specific.dart';

class Body extends StatefulWidget {
  @override
  BodySwitch createState() => BodySwitch();
}

class BodySwitch extends State<Body> {
  bool search = false;
  MyInputTextField itf = Get.put(MyInputTextField());

  void changer(input) {
    if (input != ' ') {
      setState(() {
        search = !search;
      });
    }
    else {
      setState(() {
        search = search;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        search ? Specific() : LoadAll()
      ],
    );
  }
}