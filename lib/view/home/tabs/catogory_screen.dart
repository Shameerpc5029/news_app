import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:news_app/common/sizedbox.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/hello.png'),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                KSizedBox.kheight10,
                Text(
                  'helloofajflasfjaslfjiasifdsagoew',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                KSizedBox.kheight10,
                Text(
                  'helloofajflasfjaslfjiasifdsagoew',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                KSizedBox.kheight20,
              ],
            );
          },
          separatorBuilder: (context, index) => KSizedBox.kheight10,
          itemCount: 10,
        ),
      ),
    );
  }
}
