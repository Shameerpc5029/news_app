
import 'package:flutter/material.dart';
import 'package:news_app/common/color.dart';
import 'package:news_app/view/home/tabs/all_news/all_news.dart';
import 'package:news_app/view/home/tabs/computational_investing/computational_inve.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text(
            'News & Blogs',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            labelPadding: EdgeInsets.all(10),
            labelColor: AppColor.textColor,
            tabs: [
              Tab(
                text: 'All News',
              ),
              Tab(
                text: 'test',
              ),
              Tab(
                text: 'Computational Investing',
              ),
              Tab(
                text: 'Stock Market',
              ),
              Tab(
                text: 'Learning',
              ),
              Tab(
                text: 'Branding',
              ),
              Tab(
                text: 'Crypto',
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
      ),
    );
  }
}
