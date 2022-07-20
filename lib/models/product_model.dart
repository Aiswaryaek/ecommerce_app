// To parse this JSON data, do
//
//     final productModel = productModelFromMap(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    this.name,
    this.id,
    this.nameArabic,
    this.categoryId,
    this.brandId,
    this.rating,
    this.isInWishListCount,
    this.ratingsCount,
    this.sortPrice,
    this.category,
    this.offers,
    this.cartSummaries,
    this.price,
    this.inventory,
    this.images,
    this.tags,
    this.storage,
  });

  dynamic name;
  int? id;
  String? nameArabic;
  int? categoryId;
  dynamic brandId;
  String? rating;
  int? isInWishListCount;
  int? ratingsCount;
  double? sortPrice;
  Category? category;
  dynamic offers;
  CartSummaries? cartSummaries;
  Price? price;
  Inventory? inventory;
  List<Image>? images;
  List<TagElement>? tags;
  Storage? storage;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    name: json["name"],
    id: json["id"],
    nameArabic: json["name_arabic"],
    categoryId: json["category_id"],
    brandId: json["brand_id"],
    rating: json["rating"],
    isInWishListCount: json["is_in_wish_list_count"],
    ratingsCount: json["ratings_count"],
    sortPrice: json["sort_price"].toDouble(),
    category: Category.fromMap(json["category"]),
    offers: json["offers"],
    cartSummaries: CartSummaries.fromMap(json["cart_summaries"]),
    price: Price.fromMap(json["price"]),
    inventory: Inventory.fromMap(json["inventory"]),
    images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
    tags: List<TagElement>.from(json["tags"].map((x) => TagElement.fromMap(x))),
    storage: Storage.fromMap(json["storage"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "name_arabic": nameArabic,
    "category_id": categoryId,
    "brand_id": brandId,
    "rating": rating,
    "is_in_wish_list_count": isInWishListCount,
    "ratings_count": ratingsCount,
    "sort_price": sortPrice,
    "category": category!.toMap(),
    "offers": offers,
    "cart_summaries": cartSummaries!.toMap(),
    "price": price!.toMap(),
    "inventory": inventory!.toMap(),
    "images": List<dynamic>.from(images!.map((x) => x.toMap())),
    "tags": List<dynamic>.from(tags!.map((x) => x.toMap())),
    "storage": storage!.toMap(),
  };
}

class CartSummaries {
  CartSummaries({
    this.itemId,
    this.quantity,
  });

  int? itemId;
  int? quantity;

  factory CartSummaries.fromMap(Map<String, dynamic> json) => CartSummaries(
    itemId: json["item_id"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toMap() => {
    "item_id": itemId,
    "quantity": quantity,
  };
}

class Category {
  Category({
    this.id,
    this.parentId,
    this.offers,
  });

  int? id;
  int? parentId;
  dynamic offers;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
    id: json["id"],
    parentId: json["parent_id"],
    offers: json["offers"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "parent_id": parentId,
    "offers": offers,
  };

}

class Image {
  Image({
    this.productId,
    this.imageUrl,
    this.isDefault,
  });

  int? productId;
  String? imageUrl;
  int? isDefault;

  factory Image.fromMap(Map<String, dynamic> json) => Image(
    productId: json["product_id"],
    imageUrl: json["image_url"],
    isDefault: json["IS_default"],
  );

  Map<String, dynamic> toMap() => {
    "product_id": productId,
    "image_url": imageUrl,
    "IS_default": isDefault,
  };
}

class Inventory {
  Inventory({
    this.id,
    this.productId,
    this.criticalPoint,
    this.isSalableNstocks,
  });

  int? id;
  int? productId;
  int? criticalPoint;
  int? isSalableNstocks;

  factory Inventory.fromMap(Map<String, dynamic> json) => Inventory(
    id: json["id"],
    productId: json["product_id"],
    criticalPoint: json["critical_point"],
    isSalableNstocks: json["Is_salable_nstocks"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_id": productId,
    "critical_point": criticalPoint,
    "Is_salable_nstocks": isSalableNstocks,
  };
}

class Price {
  Price({
    this.id,
    this.productId,
    this.salePrice,
    this.taxId,
    this.tax,
  });

  int? id;
  int? productId;
  dynamic salePrice;
  int? taxId;
  Tax? tax;

  factory Price.fromMap(Map<String, dynamic> json) => Price(
    id: json["id"],
    productId: json["product_id"],
    salePrice: json["sale_price"].toDouble(),
    taxId: json["tax_id"],
    tax: Tax.fromMap(json["tax"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_id": productId,
    "sale_price": salePrice,
    "tax_id": taxId,
    "tax": tax!.toMap(),
  };
}

class Tax {
  Tax({
    this.id,
    this.name,
    this.nameArabic,
    this.rate,
    this.isPriceInclude,
  });

  int? id;
  dynamic name;
  dynamic nameArabic;
  int? rate;
  int? isPriceInclude;

  factory Tax.fromMap(Map<String, dynamic> json) => Tax(
    id: json["id"],
    name: json["name"],
    nameArabic: json["name_arabic"],
    rate: json["rate"],
    isPriceInclude: json["IS_price_include"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "name_arabic": nameArabic,
    "rate": rate,
    "IS_price_include": isPriceInclude,
  };
}



class Storage {
  Storage({
    this.id,
    this.productId,
    this.quantityOnhand,
    this.quantityReserved,
  });

  int? id;
  int? productId;
  int? quantityOnhand;
  int? quantityReserved;

  factory Storage.fromMap(Map<String, dynamic> json) => Storage(
    id: json["id"],
    productId: json["product_id"],
    quantityOnhand: json["quantity_onhand"],
    quantityReserved: json["quantity_reserved"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_id": productId,
    "quantity_onhand": quantityOnhand,
    "quantity_reserved": quantityReserved,
  };
}

class TagElement {
  TagElement({
    this.id,
    this.productId,
    this.tagId,
    this.tag,
  });

  int? id;
  int? productId;
  int? tagId;
  TagTag? tag;

  factory TagElement.fromMap(Map<String, dynamic> json) => TagElement(
    id: json["id"],
    productId: json["product_id"],
    tagId: json["tag_id"],
    tag: TagTag.fromMap(json["tag"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_id": productId,
    "tag_id": tagId,
    "tag": tag!.toMap(),
  };
}

class TagTag {
  TagTag({
    this.id,
    this.name,
    this.nameArabic,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? name;
  String? nameArabic;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory TagTag.fromMap(Map<String, dynamic> json) => TagTag(
    id: json["id"],
    name: json["name"],
    nameArabic: json["name_arabic"],
    isActive: json["IS_active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "name_arabic": nameArabic,
    "IS_active": isActive,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "deleted_at": deletedAt,
  };
}


