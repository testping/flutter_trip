
class BannerModel{
  final String icon;
  final String url;

  BannerModel({this.icon, this.url});

  factory BannerModel.formJson(Map<String,dynamic> json){
    return BannerModel(icon:json['icon'],url:json['url']);
  }
}