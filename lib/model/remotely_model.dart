import 'dart:convert';

RemotelyModel remotelyModelFromJson(String str) => RemotelyModel.fromJson(json.decode(str));

String remotelyModelToJson(RemotelyModel data) => json.encode(data.toJson());

class RemotelyModel {
  List<WorkSpasesDatum>? workSpasesData;

  RemotelyModel({
    this.workSpasesData,
  });

  factory RemotelyModel.fromJson(Map<String, dynamic> json) => RemotelyModel(
        workSpasesData: json["workSpasesData"] == null ? [] : List<WorkSpasesDatum>.from(json["workSpasesData"]!.map((x) => WorkSpasesDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "workSpasesData": workSpasesData == null ? [] : List<dynamic>.from(workSpasesData!.map((x) => x.toJson())),
      };
}

class WorkSpasesDatum {
  String? image;
  String? post;
  String? suggestion;

  WorkSpasesDatum({
    this.image,
    this.post,
    this.suggestion,
  });

  factory WorkSpasesDatum.fromJson(Map<String, dynamic> json) => WorkSpasesDatum(
        image: json["image"],
        post: json["Post"],
        suggestion: json["suggestion"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "Post": post,
        "suggestion": suggestion,
      };
}

RemotelyModelNewArrivals remotelyModelNewArrivalsFromJson(String str) => RemotelyModelNewArrivals.fromJson(json.decode(str));

String remotelyModelNewArrivalsToJson(RemotelyModelNewArrivals data) => json.encode(data.toJson());

class RemotelyModelNewArrivals {
  List<NewArrivalsDatum>? newArrivalsData;

  RemotelyModelNewArrivals({
    this.newArrivalsData,
  });

  factory RemotelyModelNewArrivals.fromJson(Map<String, dynamic> json) => RemotelyModelNewArrivals(
        newArrivalsData: json["newArrivalsData"] == null ? [] : List<NewArrivalsDatum>.from(json["newArrivalsData"]!.map((x) => NewArrivalsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "newArrivalsData": newArrivalsData == null ? [] : List<dynamic>.from(newArrivalsData!.map((x) => x.toJson())),
      };
}

class NewArrivalsDatum {
  String? image;
  String? title;
  String? subTitle;
  String? rate;
  String? price;

  NewArrivalsDatum({
    this.image,
    this.title,
    this.subTitle,
    this.rate,
    this.price,
  });

  factory NewArrivalsDatum.fromJson(Map<String, dynamic> json) => NewArrivalsDatum(
        image: json["image"],
        title: json["title"],
        subTitle: json["subTitle"],
        rate: json["rate"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "subTitle": subTitle,
        "rate": rate,
        "price": price,
      };
}
