
import 'package:flutter_trip/model/local_nav_model.dart';

class GridNavModel{
  final GridNavItem hotel;
  final GridNavItem flight;
  final GridNavItem travel;

  GridNavModel({this.hotel, this.flight, this.travel});

  factory GridNavModel.formJson(Map<String,dynamic> json){
    return json!=null?GridNavModel(
      hotel:GridNavItem.formJson(json['hotel']),
      flight:GridNavItem.formJson(json['flight']),
      travel:GridNavItem.formJson(json['travel'])
    ):null;
  }
}

class GridNavItem{
  final String startColor;
  final String endColor;
  final LocalNavModel mainItem;
  final LocalNavModel item1;
  final LocalNavModel item2;
  final LocalNavModel item3;
  final LocalNavModel item4;

  GridNavItem({this.startColor, this.endColor, this.mainItem, this.item1, this.item2, this.item3, this.item4});

  factory GridNavItem.formJson(Map<String,dynamic> json){
    return GridNavItem(
      startColor:json['startColor'],
      endColor:json['endColor'],
      mainItem:LocalNavModel.formJson(json['mainItem']),
      item1:LocalNavModel.formJson(json['item1']),
      item2:LocalNavModel.formJson(json['item2']),
      item3:LocalNavModel.formJson(json['item3']),
      item4:LocalNavModel.formJson(json['item4']),
    );
  }

}