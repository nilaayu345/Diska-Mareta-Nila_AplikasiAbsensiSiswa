import 'package:absensi_siswa/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

void main() => runApp(GalleryScreen());

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imageList = [
    'https://cdn.pixabay.com/photo/2017/08/06/22/01/books-2596809__340.jpg',
    'https://cdn.pixabay.com/photo/2017/07/31/11/21/people-2557399__340.jpg',
    'https://cdn.pixabay.com/photo/2016/11/14/03/16/book-1822474__340.jpg',
    'https://cdn.pixabay.com/photo/2015/11/19/21/11/book-1052014__340.jpg',
    'https://cdn.pixabay.com/photo/2019/04/14/10/27/book-4126483__340.jpg',
    'https://cdn.pixabay.com/photo/2017/02/24/02/37/classroom-2093743__340.jpg',
    'https://cdn.pixabay.com/photo/2017/02/16/23/46/book-2073023__340.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Gallery Sekolah",
                textAlign: TextAlign.end,
                style: kNonActiveTabStyle,
              ),
              subtitle: Text(
                "Ayo nantikan update galeri terbaru kami",
                textAlign: TextAlign.end,
                style: kActiveTabStyle,
              ),
            ),
            Expanded(
              child: new StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: imageList[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) {
                    return new StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
