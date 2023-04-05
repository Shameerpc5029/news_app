import 'package:flutter/material.dart';
import 'package:news_app/common/sizedbox.dart';
import 'package:news_app/controller/home_controller.dart';
import 'package:news_app/view/content/content_view.dart';

import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  final String id;
  const CategoryScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.getNews(id);
    });

    return (provider.newList?.results.isEmpty) ?? false
        ? const Center(child: Text("Empty"))
        : SingleChildScrollView(
            child: Consumer<HomeController>(
              builder: (context, value, child) {
                return value.isLoading2 == true
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                        padding: const EdgeInsets.all(20),
                        child: ListView.separated(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ContantScreen(index: index);
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        opacity: 1,
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          'https://d2qetcusef3plg.cloudfront.net${value.newList?.results[index].image}?? '
                                          '',
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  KSizedBox.kheight10,
                                  Text(
                                    value.newList?.results[index].title ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  KSizedBox.kheight10,
                                  Text(
                                    value.newList?.results[index].content ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                    maxLines: 2,
                                  ),
                                  KSizedBox.kheight20,
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              KSizedBox.kheight10,
                          itemCount: value.newList?.results.length ?? 0,
                        ),
                      );
              },
            ),
          );
  }
}
