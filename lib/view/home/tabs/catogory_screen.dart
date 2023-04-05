import 'package:flutter/material.dart';
import 'package:news_app/common/sizedbox.dart';
import 'package:news_app/controller/home_controller.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  final String id;
  const CategoryScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false).getNews(id);
    });
    return SingleChildScrollView(
      child: Consumer<HomeController>(
        builder: (context, value, child) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: ListView.separated(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/hello.png'),
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
                );
              },
              separatorBuilder: (context, index) => KSizedBox.kheight10,
              itemCount: value.newList?.results.length ?? 0,
            ),
          );
        },
      ),
    );
  }
}
