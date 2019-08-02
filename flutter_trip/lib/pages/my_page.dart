import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List imagesUrl = [
    'http://img08.tooopen.com/20190719/tooopen_sy_19065165161980.jpg',
    'http://img08.tooopen.com/20190606/tooopen_sy_16110711759646.jpg',
    'http://img08.tooopen.com/20190619/tooopen_sy_11210621650045.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child:
              Swiper(
                autoplay: true,
                itemCount: imagesUrl.length,
                itemBuilder:(BuildContext context,int index){
                  return Image.network(
                    imagesUrl[index],
                    fit: BoxFit.fill,
                  );
                },
                pagination: SwiperPagination(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
