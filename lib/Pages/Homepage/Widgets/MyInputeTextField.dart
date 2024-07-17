import 'package:e_book/Controller/BookController.dart';
import 'package:e_book/Pages/Homepage/Widgets/Body/Body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'Body/LoadAll.dart';
import 'Body/Specific.dart';


class MyInputTextField extends StatefulWidget {
  MyInputTextField({super.key});

  @override
  State<MyInputTextField> createState() => _MyInputTextField();
}


class _MyInputTextField extends State<MyInputTextField> {
  bool search = false;
  final Text = TextEditingController();

  @override
  Widget build(BuildContext context) {

    BookController bookController = Get.put(BookController());
    Body body = Get.put(Body());
    return Column(
      children:[
        Container(
          padding: EdgeInsets.symmetric( vertical: 12, horizontal: 10),
          color: Theme.of(context).colorScheme.primary,
          child:
            Expanded(
              child:
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.background,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (Text.text != '') {
                            if (search = true) {
                              setState(() {
                                setState(() {
                                  bookController.ssearch(Text.text);
                                  search = search;
                                });
                              });
                            }
                            else {
                              setState(() {
                                bookController.ssearch(Text.text);
                                search = !search;
                              });
                            }
                          }
                          else {
                            print('Blank');
                            setState(() {
                              search = !search;
                            });
                          }
                        },
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            SvgPicture.asset("Assets/Icons/search.svg"),
                            SizedBox(width: 10)
                          ],
                        )
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: Text,
                          decoration: const InputDecoration(
                            hintText: "Search here . .",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
        ),
        SizedBox(height: 20,),
        search ? Specific() : LoadAll()
      ]
    );
  }
}

