import 'package:flutter/material.dart';
import 'package:news_app/common/color.dart';
import 'package:news_app/controller/home_controller.dart';
import 'package:news_app/view/home/tabs/all_news/all_news.dart';
import 'package:news_app/view/home/tabs/computational_investing/computational_inve.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Consumer<HomeController>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              title: const Text(
                'News & Blogs',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottom: TabBar(
                isScrollable: true,
                labelColor: AppColor.textColor,
                tabs: [
                  Tab(
                    text: value.model?.blogsCategory[0].name ?? '',
                  ),
                  Tab(
                    text: value.model?.blogsCategory[1].name ?? '',
                  ),
                  Tab(
                    text: value.model?.blogsCategory[2].name ?? '',
                  ),
                  Tab(
                    text: value.model?.blogsCategory[3].name ?? '',
                  ),
                  Tab(
                    text: value.model?.blogsCategory[4].name ?? '',
                  ),
                  Tab(
                    text: value.model?.blogsCategory[5].name ?? '',
                  ),
                  Tab(
                    text: value.model?.blogsCategory[6].name ?? '',
                  )
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                AllNews(),
                AllNews(),
                CompInvest(),
                AllNews(),
                AllNews(),
                AllNews(),
                AllNews(),
              ],
            ),
          );
        },
      ),
    );
  }
}
