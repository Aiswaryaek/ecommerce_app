// To parse this JSON data, do
//
//     final subCategory = subCategoryFromJson(jsonString);

import 'dart:convert';

List<SubCategory> subCategoryFromJson(String str) => List<SubCategory>.from(json.decode(str).map((x) => SubCategory.fromJson(x)));

String subCategoryToJson(List<SubCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategory {
  SubCategory({
    this.id,
    this.name,
    this.nameArabic,
    this.imageUrl,
    this.parentId,
  });

  dynamic id;
  String? name;
  String? nameArabic;
  String? imageUrl;
  dynamic parentId;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    name: json["name"],
    nameArabic: json["name_arabic"],
    imageUrl: json["image_url"],
    parentId: json["parent_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_arabic": nameArabic,
    "image_url": imageUrl,
    "parent_id": parentId,
  };
}
