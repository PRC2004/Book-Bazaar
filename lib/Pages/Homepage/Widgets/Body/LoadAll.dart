import 'package:flutter/material.dart';
import 'package:e_book/Controller/BookController.dart';
import 'package:e_book/Components/BookCard.dart';
import 'package:e_book/Components/BookTile.dart';
import 'package:e_book/Pages/BookDetails/BookDetails.dart';
import 'package:get/get.dart';

class LoadAll extends StatelessWidget {
  const LoadAll({super.key});

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
                  "Trending",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => Row(
                      children: bookController.bookData
                      .map(
                        (e) => BookCard(
                          title: e.title!,
                          coverUrl: e.coverUrl!,
                          ontap: () {
                            Get.to(BookDetails(
                              book: e,
                            ));
                          },
                        ),
                      )
                      .toList(),
                    ),
              )),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Your Interests",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            SizedBox(height: 10),
            Obx(() => Column(
              children: bookController.bookData
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



//