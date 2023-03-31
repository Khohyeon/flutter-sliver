import 'package:flutter/material.dart';
import 'package:sliver_app/ad.dart';
import 'package:sliver_app/diary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // CustomScrollView 를 사용 하는 이유 : 계산을 편하게 하기 위해
      body: CustomScrollView(
        // scrollDirection: Axis.horizontal,
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            title: Text("SliverAppbar"),
            pinned: false,
            expandedHeight: 250,
            flexibleSpace: Container(
              child: Center(
                child: Text("FlexibleSpace", style: TextStyle(fontSize: 50),),
              ),
            ),
          ),
          SliverAppBar(
            title: Text("SubSliver"),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              height: 200,
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //   childCount: 10,
          //   (context, index) {
          //     return Text("안녕");
          //     },
          //   ),
          // ),

          SliverFixedExtentList(
            itemExtent: 100,
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                if (index % 4 == 0 && index != 0) {
                  int i = (index / 4).toInt();
                  return Ad(i);
                }
                return Diary(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

SliverList buildSliverList() {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
          (context, index) {
        return Container(
          height: 100,
          alignment: Alignment.center,
          color: Colors.lightBlue[100 * (index % 9)],
          child: Text("List Item $index"),
        );
      },
    ),
  );
}
