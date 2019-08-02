
import 'package:flutter_trip/model/local_nav_model.dart';

class SalesBoxModel{
  final String icon;
  final String moreUrl;
  final LocalNavModel bigCard1;
  final LocalNavModel bigCard2;
  final LocalNavModel smallCard1;
  final LocalNavModel smallCard2;
  final LocalNavModel smallCard3;
  final LocalNavModel smallCard4;

  SalesBoxModel({this.icon, this.moreUrl, this.bigCard1, this.bigCard2, this.smallCard1, this.smallCard2, this.smallCard3, this.smallCard4});

  factory SalesBoxModel.formJson(Map<String,dynamic> json){
    return SalesBoxModel(
      icon:json['icon'],
      moreUrl:json['moreUrl'],
      bigCard1:LocalNavModel.formJson(json['bigCard1']),
      bigCard2:LocalNavModel.formJson(json['bigCard2']),
      smallCard1:LocalNavModel.formJson(json['smallCard1']),
      smallCard2:LocalNavModel.formJson(json['smallCard2']),
      smallCard3:LocalNavModel.formJson(json['smallCard3']),
      smallCard4:LocalNavModel.formJson(json['smallCard4']),
    );
  }


}