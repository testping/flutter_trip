import 'package:flutter/material.dart';
import 'package:flutter_trip/model/local_nav_model.dart';
import 'package:flutter_trip/pages/webview_page.dart';

class LocalNav extends StatelessWidget {

  final List<LocalNavModel> localNavList;

  const LocalNav({Key key, this.localNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6)
      ),
      child: Padding(
          padding: EdgeInsets.all(5),
          child: _items(context),
      ),
    );
  }
  _items(BuildContext context){
    if(localNavList==null) return null;
    List<Widget> items =  [];
    localNavList.forEach((model){
      items.add(_item(context,model));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items
    );
  }
  Widget _item(BuildContext context,LocalNavModel localNavModel){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
            WebView(url: localNavModel.url,statusBarColor:localNavModel.statusBarColor,title:localNavModel.title,hideAppBar:localNavModel.hideAppBar)
        ));
      },
      child: Column(
        children: <Widget>[
          Image.network(
            localNavModel.icon,
            width: 35,
            height: 35,
          ),
          Text(localNavModel.title,style: TextStyle(fontSize: 12),)
        ],
      ),
    );
  }
}
