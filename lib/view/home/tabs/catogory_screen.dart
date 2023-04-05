import 'package:flutter/material.dart';
import 'package:news_app/common/sizedbox.dart';
import 'package:news_app/controller/home_controller.dart';
import 'package:news_app/view/content/content_view.dart';

import 'package:provider/provider.dart';

final controller = ScrollController();

class CategoryScreen extends StatefulWidget {
  final String id;
  const CategoryScreen({super.key, required this.id});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        Provider.of<HomeController>(context, listen: false).getNextNews(
            Provider.of<HomeController>(context, listen: false).newList!.next,
            widget.id);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false).getNews(widget.id);
    });

    return RefreshIndicator(
      onRefresh: () async {
        Provider.of<HomeController>(context, listen: false).getNews(widget.id);
      },
      child: SingleChildScrollView(
        child: Consumer<HomeController>(
          builder: (context, value, child) {
            return value.isLoading2 == true
                ? const CircularProgressIndicator()
                : Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView.separated(
                      controller: controller,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (index < (value.newList?.results.length ?? 0)) {
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
                        } else {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      },
                      separatorBuilder: (context, index) => KSizedBox.kheight10,
                      itemCount: (value.newList?.results.length ?? 0) + 1,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
