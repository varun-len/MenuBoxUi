// To parse this JSON data, do
//
//     final home = homeFromJson(jsonString);

import 'dart:convert';

Home homeFromJson(String str) => Home.fromJson(json.decode(str));

String homeToJson(Home data) => json.encode(data.toJson());

class Home {
  List<String>? banner;
  List<Category>? categories;
  List<Category>? recentOrders;
  List<ExistingOffer>? existingOffers;
  List<Category>? spotlight;
  List<Store>? stores;

  Home({
    this.banner,
    this.categories,
    this.recentOrders,
    this.existingOffers,
    this.spotlight,
    this.stores,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
    banner: json["banner"] == null ? [] : List<String>.from(json["banner"]!.map((x) => x)),
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    recentOrders: json["recent_orders"] == null ? [] : List<Category>.from(json["recent_orders"]!.map((x) => Category.fromJson(x))),
    existingOffers: json["existing_offers"] == null ? [] : List<ExistingOffer>.from(json["existing_offers"]!.map((x) => ExistingOffer.fromJson(x))),
    spotlight: json["spotlight"] == null ? [] : List<Category>.from(json["spotlight"]!.map((x) => Category.fromJson(x))),
    stores: json["stores"] == null ? [] : List<Store>.from(json["stores"]!.map((x) => Store.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banner": banner == null ? [] : List<dynamic>.from(banner!.map((x) => x)),
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "recent_orders": recentOrders == null ? [] : List<dynamic>.from(recentOrders!.map((x) => x.toJson())),
    "existing_offers": existingOffers == null ? [] : List<dynamic>.from(existingOffers!.map((x) => x.toJson())),
    "spotlight": spotlight == null ? [] : List<dynamic>.from(spotlight!.map((x) => x.toJson())),
    "stores": stores == null ? [] : List<dynamic>.from(stores!.map((x) => x.toJson())),
  };
}

class Category {
  int? id;
  String? name;
  String? image;

  Category({
    this.id,
    this.name,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}

class ExistingOffer {
  int? id;
  String? name;
  String? image;
  String? subtitle;
  String? offerTitle;
  bool? isOpen;

  ExistingOffer({
    this.id,
    this.name,
    this.image,
    this.subtitle,
    this.offerTitle,
    this.isOpen,
  });

  factory ExistingOffer.fromJson(Map<String, dynamic> json) => ExistingOffer(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    subtitle: json["subtitle"],
    offerTitle: json["offer_title"],
    isOpen: json["isOpen"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "subtitle": subtitle,
    "offer_title": offerTitle,
    "isOpen": isOpen,
  };
}

class Store {
  int? id;
  String? name;
  String? image;
  String? banner;
  String? rating;
  String? review;
  String? minOrder;
  String? freeDeliveryKm;
  String? deliveryTime;
  String? distance;
  Offer? offer;

  Store({
    this.id,
    this.name,
    this.image,
    this.banner,
    this.rating,
    this.review,
    this.minOrder,
    this.freeDeliveryKm,
    this.deliveryTime,
    this.distance,
    this.offer,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    banner: json["banner"],
    rating: json["rating"],
    review: json["review"],
    minOrder: json["min_order"],
    freeDeliveryKm: json["free_delivery_km"],
    deliveryTime: json["delivery_time"],
    distance: json["distance"],
    offer: json["offer"] == null ? null : Offer.fromJson(json["offer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "banner": banner,
    "rating": rating,
    "review": review,
    "min_order": minOrder,
    "free_delivery_km": freeDeliveryKm,
    "delivery_time": deliveryTime,
    "distance": distance,
    "offer": offer?.toJson(),
  };
}

class Offer {
  String? title;
  String? code;

  Offer({
    this.title,
    this.code,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    title: json["title"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "code": code,
  };
}
