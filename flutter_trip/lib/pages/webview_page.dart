import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
const CATCH_URLS = ['m.ctrip.com','m.ctrip.com/html5/','m.ctrip.com/html5'];
class WebView extends StatefulWidget {
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;
  const WebView({Key key, this.url, this.statusBarColor, this.title, this.hideAppBar, this.backForbid = false}) : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  bool exiting = false;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;
  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.close();
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url){

    });
    //页面状态发生改变时候
    _onStateChanged = flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged viewStateChanged){
      switch(viewStateChanged.type){
        case WebViewState.shouldStart:
          if(_isTomain(viewStateChanged.url)&&!exiting){
            if(widget.backForbid){
              flutterWebviewPlugin.launch(widget.url);
              Navigator.pop(context);
              exiting = true;
            }
          }
          break;
        case WebViewState.startLoad:
          break;
        case WebViewState.finishLoad:
          break;
        case WebViewState.abortLoad:
          break;
        default:
          break;
      }
    });
    //发生错误时
    _onHttpError = flutterWebviewPlugin.onHttpError.listen((WebViewHttpError viewHttpError){
      print(viewHttpError);
    });

  }

  _isTomain(String url){
    bool contain = false;
    for(final value in CATCH_URLS){
      if(url?.endsWith(value)??false){
        contain=true;
            break;
      }
    }
    return contain;
  }

  @override
  void dispose() {
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    flutterWebviewPlugin.close();
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor?? "ffffff";
    Color backButtonColor;
    if(statusBarColorStr=="ffffff"){
      backButtonColor = Colors.black;
    }else{
      backButtonColor = Colors.white;
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(Color(int.parse("0xff"+statusBarColorStr)),backButtonColor),
          Expanded(child: WebviewScaffold(
              url: widget.url,
            withJavascript: true,
            withZoom: true,
            hidden: true,
            withLocalStorage: true,
            initialChild: Container(
              color: Colors.white,
              child: Center(
                child: Text("加载中..."),
              ),
            ),
          ),
          )//webview撑满屏幕
        ],
      ),
    );
  }
  _appBar(Color backgroundcColor, Color backButtomColor){
    if(widget.hideAppBar??false){
      return Container(
        color: backgroundcColor,
        height: 30,
      );
    }

    return FractionallySizedBox(
      widthFactor: 1,//宽度撑满
      child: Stack(
        children: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Icon(Icons.close,
                size: 26,
                color: backButtomColor,),
            ),
          ),
          Positioned(
            right: 0,
              left: 0,
              child: Center(
                child: Text(widget.title,
                style: TextStyle(color: backButtomColor,fontSize: 20),),
              )
          )
        ],
      ),
    );
  }
}
