
import 'package:flutter_trip/model/config_model.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';
import 'package:flutter_trip/model/local_nav_model.dart';
import 'package:flutter_trip/model/sales_box_model.dart';

class HomeModel{
  final ConfigModel config;
  final List<LocalNavModel> bannerList;
  final List<LocalNavModel> localNavList;
  final List<LocalNavModel> subNavListList;
  final GridNavModel gridNav;
  final SalesBoxModel salesBox;


  HomeModel({this.config, this.bannerList, this.localNavList,
      this.subNavListList, this.gridNav, this.salesBox});

  factory HomeModel.formJson(Map<String,dynamic> json){

    var bannerModelJson = json['bannerList'] as List;
    List<LocalNavModel> bannerList = bannerModelJson.map((i) => LocalNavModel.formJson(i)).toList();

    var localNavModelJson = json['localNavList'] as List;
    List<LocalNavModel> localNavList = localNavModelJson.map((i) => LocalNavModel.formJson(i)).toList();

    var subNavModelJson = json['subNavList'] as List;
    List<LocalNavModel> subNavListList = subNavModelJson.map((i) => LocalNavModel.formJson(i)).toList();
    return HomeModel(
      config:ConfigModel.fromJson(json['config']),
      gridNav:GridNavModel.formJson(json['gridNav']),
      salesBox:SalesBoxModel.formJson(json['salesBox']),
      bannerList:bannerList,
      localNavList:localNavList,
      subNavListList:subNavListList
    );
  }

}