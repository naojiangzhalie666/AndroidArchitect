import 'package:flutter/material.dart';
import 'package:into_flutter/page/tab_page.dart';
import 'package:underline_indicator/underline_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _controller;
  static const tabs = [
    '热门1',
    '热门2',
    '热门3',
    '热门4',
    '热门5',
    '热门6',
    '热门7',
    '热门8',
    '热门9',
    '热门10'
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 30),
            child: TabBar(
              controller: _controller,
              isScrollable: true,
              labelColor: Colors.black,
              indicator: UnderlineIndicator(
                  strokeCap: StrokeCap.round,
                  borderSide: BorderSide(color: Colors.blue, width: 3),
                  insets: EdgeInsets.only(bottom: 2)),
              tabs: tabs.map<Tab>((String tab) {
                return Tab(
                  text: tab,
                );
              }).toList(),
            ),
          ),
          Flexible(
              child: TabBarView(
                  controller: _controller,
                  children: tabs.map((String tab) {
                    return TabPage(
                      category: tab,
                    );
                  }).toList()))
        ],
      ),
    );
  }
}
