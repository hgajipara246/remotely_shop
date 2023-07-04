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

RemotelyModelYourCartPage remotelyModelYourCartPageFromJson(String str) => RemotelyModelYourCartPage.fromJson(json.decode(str));

String remotelyModelYourCartPageToJson(RemotelyModelYourCartPage data) => json.encode(data.toJson());

class RemotelyModelYourCartPage {
  List<YourCartPage>? yourCartPage;

  RemotelyModelYourCartPage({
    this.yourCartPage,
  });

  factory RemotelyModelYourCartPage.fromJson(Map<String, dynamic> json) => RemotelyModelYourCartPage(
        yourCartPage: json["yourCartPage"] == null ? [] : List<YourCartPage>.from(json["yourCartPage"]!.map((x) => YourCartPage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "yourCartPage": yourCartPage == null ? [] : List<dynamic>.from(yourCartPage!.map((x) => x.toJson())),
      };
}

class YourCartPage {
  String? image;
  String? title;
  String? price;

  YourCartPage({
    this.image,
    this.title,
    this.price,
  });

  factory YourCartPage.fromJson(Map<String, dynamic> json) => YourCartPage(
        image: json["image"],
        title: json["title"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "price": price,
      };
}

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? id;
  String? name;
  String? email;
  String? number;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.number,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "id": "id",
        "name": "name",
        "email": "email",
        "number": "number",
      };
}
// To parse this JSON data, do
//
//     final remotelyModelViewWorkSpaceItem = remotelyModelViewWorkSpaceItemFromJson(jsonString);

RemotelyModelViewWorkSpaceItem remotelyModelViewWorkSpaceItemFromJson(String str) => RemotelyModelViewWorkSpaceItem.fromJson(json.decode(str));

String remotelyModelViewWorkSpaceItemToJson(RemotelyModelViewWorkSpaceItem data) => json.encode(data.toJson());

class RemotelyModelViewWorkSpaceItem {
  List<ViewCartWorkSpaceItem>? viewCartWorkSpaceItem;

  RemotelyModelViewWorkSpaceItem({
    this.viewCartWorkSpaceItem,
  });

  factory RemotelyModelViewWorkSpaceItem.fromJson(Map<String, dynamic> json) => RemotelyModelViewWorkSpaceItem(
        viewCartWorkSpaceItem: json["ViewCartWorkSpaceItem"] == null ? [] : List<ViewCartWorkSpaceItem>.from(json["ViewCartWorkSpaceItem"]!.map((x) => ViewCartWorkSpaceItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ViewCartWorkSpaceItem": viewCartWorkSpaceItem == null ? [] : List<dynamic>.from(viewCartWorkSpaceItem!.map((x) => x.toJson())),
      };
}

class ViewCartWorkSpaceItem {
  String? image;
  String? title;
  String? subTitle;

  ViewCartWorkSpaceItem({
    this.image,
    this.title,
    this.subTitle,
  });

  factory ViewCartWorkSpaceItem.fromJson(Map<String, dynamic> json) => ViewCartWorkSpaceItem(
        image: json["image"],
        title: json["title"],
        subTitle: json["subTitle"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "subTitle": subTitle,
      };
}

// To parse this JSON data, do
//
//     final remotelyModelViewItemRelatedItems = remotelyModelViewItemRelatedItemsFromJson(jsonString);

RemotelyModelViewItemRelatedItems remotelyModelViewItemRelatedItemsFromJson(String str) => RemotelyModelViewItemRelatedItems.fromJson(json.decode(str));

String remotelyModelViewItemRelatedItemsToJson(RemotelyModelViewItemRelatedItems data) => json.encode(data.toJson());

class RemotelyModelViewItemRelatedItems {
  List<ViewItemRelatedItem>? viewItemRelatedItem;

  RemotelyModelViewItemRelatedItems({
    this.viewItemRelatedItem,
  });

  factory RemotelyModelViewItemRelatedItems.fromJson(Map<String, dynamic> json) => RemotelyModelViewItemRelatedItems(
        viewItemRelatedItem: json["ViewItemRelatedItem"] == null ? [] : List<ViewItemRelatedItem>.from(json["ViewItemRelatedItem"]!.map((x) => ViewItemRelatedItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ViewItemRelatedItem": viewItemRelatedItem == null ? [] : List<dynamic>.from(viewItemRelatedItem!.map((x) => x.toJson())),
      };
}

class ViewItemRelatedItem {
  String? image;
  String? title;
  String? subTitle;
  String? rate;
  String? price;

  ViewItemRelatedItem({
    this.image,
    this.title,
    this.subTitle,
    this.rate,
    this.price,
  });

  factory ViewItemRelatedItem.fromJson(Map<String, dynamic> json) => ViewItemRelatedItem(
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

RemotelyModelExploresWorkspace remotelyModelExploresWorkspaceFromJson(String str) => RemotelyModelExploresWorkspace.fromJson(json.decode(str));

String remotelyModelExploresWorkspaceToJson(RemotelyModelExploresWorkspace data) => json.encode(data.toJson());

class RemotelyModelExploresWorkspace {
  List<ExploresWorkspace>? exploresWorkspace;

  RemotelyModelExploresWorkspace({
    this.exploresWorkspace,
  });

  factory RemotelyModelExploresWorkspace.fromJson(Map<String, dynamic> json) => RemotelyModelExploresWorkspace(
        exploresWorkspace: json["ExploresWorkspace"] == null ? [] : List<ExploresWorkspace>.from(json["ExploresWorkspace"]!.map((x) => ExploresWorkspace.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ExploresWorkspace": exploresWorkspace == null ? [] : List<dynamic>.from(exploresWorkspace!.map((x) => x.toJson())),
      };
}

class ExploresWorkspace {
  String? image;
  String? title;
  String? price;
  String? rate;

  ExploresWorkspace({
    this.image,
    this.title,
    this.price,
    this.rate,
  });

  factory ExploresWorkspace.fromJson(Map<String, dynamic> json) => ExploresWorkspace(
        image: json["image"],
        title: json["title"],
        price: json["price"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "price": price,
        "rate": rate,
      };
}

RemotelyModelBrowsingHistory remotelyModelBrowsingHistoryFromJson(String str) => RemotelyModelBrowsingHistory.fromJson(json.decode(str));

String remotelyModelBrowsingHistoryToJson(RemotelyModelBrowsingHistory data) => json.encode(data.toJson());

class RemotelyModelBrowsingHistory {
  List<BrowsingHistory>? browsingHistory;

  RemotelyModelBrowsingHistory({
    this.browsingHistory,
  });

  factory RemotelyModelBrowsingHistory.fromJson(Map<String, dynamic> json) => RemotelyModelBrowsingHistory(
        browsingHistory: json["BrowsingHistory"] == null ? [] : List<BrowsingHistory>.from(json["BrowsingHistory"]!.map((x) => BrowsingHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "BrowsingHistory": browsingHistory == null ? [] : List<dynamic>.from(browsingHistory!.map((x) => x.toJson())),
      };
}

class BrowsingHistory {
  String? image;
  String? title;
  String? subTitle;
  String? rate;
  String? price;

  BrowsingHistory({
    this.image,
    this.title,
    this.subTitle,
    this.rate,
    this.price,
  });

  factory BrowsingHistory.fromJson(Map<String, dynamic> json) => BrowsingHistory(
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

RemotelyModelDeveloperWorkSpace remotelyModelDeveloperWorkSpaceFromJson(String str) => RemotelyModelDeveloperWorkSpace.fromJson(json.decode(str));

String remotelyModelDeveloperWorkSpaceToJson(RemotelyModelDeveloperWorkSpace data) => json.encode(data.toJson());

class RemotelyModelDeveloperWorkSpace {
  List<DeveloperWorkSpace>? developerWorkSpace;

  RemotelyModelDeveloperWorkSpace({
    this.developerWorkSpace,
  });

  factory RemotelyModelDeveloperWorkSpace.fromJson(Map<String, dynamic> json) => RemotelyModelDeveloperWorkSpace(
        developerWorkSpace: json["DeveloperWorkSpace"] == null ? [] : List<DeveloperWorkSpace>.from(json["DeveloperWorkSpace"]!.map((x) => DeveloperWorkSpace.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "DeveloperWorkSpace": developerWorkSpace == null ? [] : List<dynamic>.from(developerWorkSpace!.map((x) => x.toJson())),
      };
}

class DeveloperWorkSpace {
  String? image;
  String? title;
  String? price;
  String? rate;

  DeveloperWorkSpace({
    this.image,
    this.title,
    this.price,
    this.rate,
  });

  factory DeveloperWorkSpace.fromJson(Map<String, dynamic> json) => DeveloperWorkSpace(
        image: json["image"],
        title: json["title"],
        price: json["price"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "price": price,
        "rate": rate,
      };
}
