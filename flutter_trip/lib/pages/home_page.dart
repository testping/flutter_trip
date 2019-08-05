import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/dao/home_dao.dart';
import 'dart:convert';

import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/model/local_nav_model.dart';
import 'package:flutter_trip/widget/local_nav.dart';

const BAR_SCROLL_OFFSET = 100; //appbar滚动的最大距离
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<LocalNavModel> localNavList;
  double appBarAlpha = 0;
  List imagesUrl = [
    'http://pic33.nipic.com/20131007/13639685_123501617185_2.jpg',
    'http://pic41.nipic.com/20140508/18609517_112216473140_2.jpg',
    'http://pic23.nipic.com/20120830/9686992_180336646144_2.jpg'
  ];
  String resultString= "w";
  // ignore: non_constant_identifier_names
  _onScroll(Offset){
    double alpha = Offset/BAR_SCROLL_OFFSET;
    if(Offset<0){
      alpha = 0;
    }else if(Offset>1){
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });

  }
  loadHome() async{
    try {
      HomeModel homeModel = await HomeDao.fetch();
      setState(() {
        localNavList = homeModel.localNavList;
        print("qqqq$localNavList");
      });
    } catch (e, s) {
      setState(() {
         print(e);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              context: context,
              removeTop:  true,
              child: NotificationListener(
                  onNotification: (scrollNotification){
                    if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth  == 0){
                      //列表滚动的时候
                      _onScroll(scrollNotification.metrics.pixels);
                    }
                    return false;
                  },
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 200,
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
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                      child:  LocalNav(localNavList:localNavList)),
                      Container(
                        child: ListTile(
                          title: Text(resultString),
                        ),
                      )
                    ],
                  ))
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 100,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("首页"),
                ),
              ),

            ),
          )
        ],
      )
    );
  }
}
