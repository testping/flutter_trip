
class LocalNavModel{
 final String icon;
 final String title;
 final String url;
 final String statusBarColor;
 final bool hideAppBar;

  LocalNavModel({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory LocalNavModel.formJson(Map<String,dynamic> json){
    return LocalNavModel(icon:json['icon'],title:json['title'],url:json['url'],statusBarColor:json['statusBarColor'],hideAppBar:json['hideAppBar']);
  }
}