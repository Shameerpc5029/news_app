import 'package:flutter/material.dart';
import 'package:news_app/common/color.dart';
import 'package:news_app/controller/home_controller.dart';
import 'package:news_app/view/home/tabs/all_news/all_news.dart';
import 'package:news_app/view/home/tabs/catogory_screen.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
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
                controller: _tabController,
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
            body: TabBarView(
              controller: _tabController,
              children: [
                AllNews(id: value.model?.blogsCategory[0].id.toString() ?? ''),
                CategoryScreen(
                  id: value.model?.blogsCategory[1].id.toString() ?? '',
                ),
                CategoryScreen(
                  id: value.model?.blogsCategory[2].id.toString() ?? '',
                ),
                CategoryScreen(
                  id: value.model?.blogsCategory[3].id.toString() ?? '',
                ),
                CategoryScreen(
                  id: value.model?.blogsCategory[4].id.toString() ?? '',
                ),
                CategoryScreen(
                  id: value.model?.blogsCategory[5].id.toString() ?? '',
                ),
                CategoryScreen(
                  id: value.model?.blogsCategory[6].id.toString() ?? '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
