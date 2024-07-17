import 'package:e_book/Pages/Homepage/Widgets/MyInputeTextField.dart';
import 'package:flutter/material.dart';
import 'package:e_book/Controller/BookController.dart';
import 'package:e_book/Components/BookTile.dart';
import 'package:e_book/Pages/BookDetails/BookDetails.dart';
import 'package:get/get.dart';

class Specific extends StatelessWidget {
  const Specific({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Results",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Obx(() => Column(
                children: bookController.search
                    .map(
                      (e) => BookTile(
                    ontap: () {
                      Get.to(BookDetails(book: e));
                    },
                    title: e.title!,
                    coverUrl: e.coverUrl!,
                    author: e.author!,
                    price: e.price!,
                    rating: e.rating!,
                    totalRating: 12,
                  ),
                )
                    .toList(),
              ))
            ],
          ),
        )
      ],
    );
  }
}