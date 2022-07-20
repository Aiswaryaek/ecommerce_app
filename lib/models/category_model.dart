// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    this.id,
    this.name,
    this.nameArabic,
    this.imageUrl,
    this.parentId,
    this.isActive,
    this.isAvailableInApp,
  });

  dynamic id;
  String? name;
  String? nameArabic;
  String? imageUrl;
  dynamic parentId;
  int? isActive;
  int? isAvailableInApp;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    name: json["name"],
    nameArabic: json["name_arabic"],
    imageUrl: json["image_url"],
    parentId: json["parent_id"],
    isActive: json["IS_active"],
    isAvailableInApp: json["IS_available_in_app"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_arabic": nameArabic,
    "image_url": imageUrl,
    "parent_id": parentId,
    "IS_active": isActive,
    "IS_available_in_app": isAvailableInApp,
  };
}
