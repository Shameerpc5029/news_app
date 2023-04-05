import 'package:flutter/material.dart';

import 'package:news_app/common/sizedbox.dart';
import 'package:news_app/controller/home_controller.dart';
import 'package:provider/provider.dart';

class ContantScreen extends StatelessWidget {
  final int index;
  const ContantScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Consumer<HomeController>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/hello.png'),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                KSizedBox.kheight20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: Text(
                      value.newList?.results[index].title ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                KSizedBox.kheight10,
                Container(
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "Created: ${value.newList!.results[index].createdAt}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    value.newList?.results[index].content ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      wordSpacing: 1,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
