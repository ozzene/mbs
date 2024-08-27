import 'dart:convert';

CatalogItem postFromJson(String str) => CatalogItem.fromJson(json.decode(str));

String postToJson(CatalogItem data) => json.encode(data.toJson());

class CatalogItem {
  CatalogItem(
      {required this.id,
      this.promotedAt,
      required this.width,
      required this.height,
      required this.color,
      required this.blurHash,
      this.description,
      required this.name,
      required this.altDescription,
      required this.categories,
      required this.likes,
      required this.likedByUser,
      required this.currentUserCollections,
      required this.url,
      required this.price,
      required this.oldPrice});

  String id;
  DateTime? promotedAt;
  int width;
  int height;
  double price;
  String color;
  String name;
  String? blurHash;
  String? description;
  dynamic altDescription;
  String url;
  List<String> categories;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;

  double oldPrice;
  // List<Tag> tags;

  factory CatalogItem.fromJson(Map<String, dynamic> json) => CatalogItem(
        id: json["id"],
        url: json["url"],
        promotedAt: json["promoted_at"] == null
            ? null
            : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        price: json["price"],
        oldPrice: json["old_price"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        name: json["name"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),

        // tags: List<Tag>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,

        "promoted_at":
            promotedAt == null ? null : promotedAt!.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "price": price,
        "old_price": oldPrice,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,

        "categories": List<dynamic>.from(categories.map((x) => x)),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections.map((x) => x)),

        // 'tags':  List<dynamic>.from(tags.map((x) => x)),
      };

  static List<CatalogItem> CatalogItemFromJson(String str) =>
      List<CatalogItem>.from(
          json.decode(str).map((x) => CatalogItem.fromJson(x)));

  static String CatalogItemToJson(List<CatalogItem> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
