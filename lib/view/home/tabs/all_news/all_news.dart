import 'package:flutter/material.dart';
import 'package:news_app/common/sizedbox.dart';
import 'package:news_app/controller/home_controller.dart';
import 'package:news_app/view/content/content_view.dart';
import 'package:provider/provider.dart';

class AllNews extends StatelessWidget {
  const AllNews({
    super.key,
    required this.id,
  });
  final String id;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      return Provider.of<HomeController>(context, listen: false).getNews(id);
    });

    return RefreshIndicator(
      onRefresh: () async {
        return Provider.of<HomeController>(context, listen: false).getNews(id);
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/hello.png'),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 300,
                      child: Text(
                        "dataajfhjashdfksafuhekjfhsafjkasdfsafasdfsad",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    KSizedBox.kheight20,
                    const Text(
                      "Updated: 17/2/2022",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    KSizedBox.kheight20,
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                "🔥Latest News",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Consumer<HomeController>(
              builder: (context, value, child) {
                return value.isLoading2 == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: value.newList?.results.length ?? 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ContantScreen(
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: const DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/images/hello.png'),
                                        )),
                                  ),
                                  KSizedBox.kheight10,
                                  Text(
                                    value.newList?.results[index].title ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  KSizedBox.kheight10,
                                  Text(
                                    maxLines: 2,
                                    value.newList?.results[index].content ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return KSizedBox.kheight10;
                        },
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
