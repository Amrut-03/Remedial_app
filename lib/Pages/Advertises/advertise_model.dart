class AdvertiseModel {
  List<Data>? data;

  AdvertiseModel({this.data});

  AdvertiseModel.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> _data = <String, dynamic>{};
  //   if (data != null) {
  //     _data["data"] = data?.map((e) => e.toJson()).toList();
  //   }
  //   return _data;
  // }
}

class Data {
  String? id;
  String? aduid;
  String? urlimage;
  String? subtitle;
  int? v;

  Data({this.id, this.aduid, this.urlimage, this.subtitle, this.v});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["aduid"] is String) {
      aduid = json["aduid"];
    }
    if (json["urlimage"] is String) {
      urlimage = json["urlimage"];
    }
    if (json["subtitle"] is String) {
      subtitle = json["subtitle"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["aduid"] = aduid;
    _data["urlimage"] = urlimage;
    _data["subtitle"] = subtitle;
    _data["__v"] = v;
    return _data;
  }
}
