import 'package:flutter/material.dart';
import 'package:absensi_siswa/screens/news/popular_tab_view.dart';
import 'package:absensi_siswa/screens/news/recent_tab_view.dart';
import 'package:absensi_siswa/screens/news/trending_tab_view.dart';
import 'package:absensi_siswa/theme.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Berita Sekolah",
                  textAlign: TextAlign.end,
                  style: kNonActiveTabStyle,
                ),
                subtitle: Text(
                  "Ayo jangan lupa baca berita",
                  textAlign: TextAlign.end,
                  style: kActiveTabStyle,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: kGrey1,
                  unselectedLabelStyle: kNonActiveTabStyle,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  labelStyle: kActiveTabStyle.copyWith(fontSize: 25.0),
                  tabs: [
                    Tab(text: "Populer"),
                    Tab(text: "Trending"),
                    Tab(text: "Baru ini"),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PopularTabView(),
            TrendingTabView(),
            RecentTabView(),
          ],
        ),
      ),
    );
  }
}
