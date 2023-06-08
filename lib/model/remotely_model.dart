import 'dart:convert';
// HOME SCREEN MODEL //

/// model for work spases listview
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

/// model for New Arrival Items Listview

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

///model For Laptops Listview

RemotelyModelLaptops remotelyModelLaptopsFromJson(String str) => RemotelyModelLaptops.fromJson(json.decode(str));

String remotelyModelLaptopsToJson(RemotelyModelLaptops data) => json.encode(data.toJson());

class RemotelyModelLaptops {
  List<LaptopsDatum>? laptopsData;

  RemotelyModelLaptops({
    this.laptopsData,
  });

  factory RemotelyModelLaptops.fromJson(Map<String, dynamic> json) => RemotelyModelLaptops(
        laptopsData: json["laptopsData"] == null ? [] : List<LaptopsDatum>.from(json["laptopsData"]!.map((x) => LaptopsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "laptopsData": laptopsData == null ? [] : List<dynamic>.from(laptopsData!.map((x) => x.toJson())),
      };
}

class LaptopsDatum {
  String? image;
  String? title;
  String? price;
  String? rate;

  LaptopsDatum({
    this.image,
    this.title,
    this.price,
    this.rate,
  });

  factory LaptopsDatum.fromJson(Map<String, dynamic> json) => LaptopsDatum(
        image: json["imageOne"],
        title: json["titleOne"],
        price: json["priceOne"],
        rate: json["rateOne"],
      );

  Map<String, dynamic> toJson() => {
        "imageOne": image,
        "titleOne": title,
        "priceOne": price,
        "rateOne": rate,
      };
}

/// model for the Trending Collection

RemotelyModelTrendingCollection remotelyModelTrendingCollectionFromJson(String str) => RemotelyModelTrendingCollection.fromJson(json.decode(str));

String remotelyModelTrendingCollectionToJson(RemotelyModelTrendingCollection data) => json.encode(data.toJson());

class RemotelyModelTrendingCollection {
  List<TrendingCollection>? trendingCollections;

  RemotelyModelTrendingCollection({
    this.trendingCollections,
  });

  factory RemotelyModelTrendingCollection.fromJson(Map<String, dynamic> json) => RemotelyModelTrendingCollection(
        trendingCollections: json["trendingCollections"] == null ? [] : List<TrendingCollection>.from(json["trendingCollections"]!.map((x) => TrendingCollection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "trendingCollections": trendingCollections == null ? [] : List<dynamic>.from(trendingCollections!.map((x) => x.toJson())),
      };
}

class TrendingCollection {
  String? image;
  String? title;

  TrendingCollection({
    this.image,
    this.title,
  });

  factory TrendingCollection.fromJson(Map<String, dynamic> json) => TrendingCollection(
        image: json["image"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
      };
}

RemotelyModelViewItemsChairs remotelyModelViewItemsChairsFromJson(String str) => RemotelyModelViewItemsChairs.fromJson(json.decode(str));

String remotelyModelViewItemsChairsToJson(RemotelyModelViewItemsChairs data) => json.encode(data.toJson());

class RemotelyModelViewItemsChairs {
  List<ViewItemsChair>? viewItemsChair;

  RemotelyModelViewItemsChairs({
    this.viewItemsChair,
  });

  factory RemotelyModelViewItemsChairs.fromJson(Map<String, dynamic> json) => RemotelyModelViewItemsChairs(
        viewItemsChair: json["viewItemsChair"] == null ? [] : List<ViewItemsChair>.from(json["viewItemsChair"]!.map((x) => ViewItemsChair.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "viewItemsChair": viewItemsChair == null ? [] : List<dynamic>.from(viewItemsChair!.map((x) => x.toJson())),
      };
}

class ViewItemsChair {
  String? image;
  String? imageOne;
  String? imageTwo;

  ViewItemsChair({
    this.image,
    this.imageOne,
    this.imageTwo,
  });

  factory ViewItemsChair.fromJson(Map<String, dynamic> json) => ViewItemsChair(
        image: json["image"],
        imageOne: json["imageOne"],
        imageTwo: json["imageTwo"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "imageOne": imageOne,
        "imageTwo": imageTwo,
      };
}
