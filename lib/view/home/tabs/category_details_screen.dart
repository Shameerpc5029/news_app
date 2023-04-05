import 'package:flutter/material.dart';
import 'package:news_app/common/color.dart';

import 'package:news_app/controller/home_controller.dart';

import 'package:news_app/view/home/tabs/catogory_screen.dart';

import 'package:provider/provider.dart';

class CategoryTabBarView extends StatelessWidget {
  const CategoryTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<HomeController>(context);
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: pro.model?.blogsCategory.length ?? 0,
          child: Column(
            children: [
              TabBar(
                  isScrollable: true,
                  labelColor: AppColor.textColor,
                  tabs: pro.model?.blogsCategory
                          .map((e) => Tab(
                                text: e.name,
                              ))
                          .toList() ??
                      []),
              Expanded(
                child: TabBarView(
                  children: pro.model?.blogsCategory
                          .map((e) => CategoryScreen(
                                id: e.id.toString(),
                              ))
                          .toList() ??
                      [],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
