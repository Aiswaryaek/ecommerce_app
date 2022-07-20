import 'dart:convert';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/models/sub_category_model.dart';
import 'package:ecommerce_app/utilities/api_helpers.dart';



Resource<List<CategoryModel>> getCategoryApi(){
  return Resource(
      url: 'api/mobile/categories',
      parse: (response){
        Iterable categoryList = json.decode(response.body);
        List<CategoryModel> data = List<CategoryModel>.from(
            categoryList.map((model) => CategoryModel.fromJson(model)));
        return data;
      }
  );
}

Resource<List<SubCategory>> getSubCategoryApi(dynamic id){
  print(id);
  return Resource(
      url: 'api/mobile/subcategories?parent_id=$id',
      parse: (response){
        print(response.body);
        Iterable subCategoryList = json.decode(response.body);
        List<SubCategory> data = List<SubCategory>.from(
            subCategoryList.map((model) => SubCategory.fromJson(model)));
        return data;
      }
  );
}

Resource<List<Products>> getProductsApi(dynamic catId) {
  return Resource(
      url: 'api/mobile/products?category_id=$catId&store_id=2&offset=0&limit=20&sort_by=sale_price&sort_type=DESC',
      parse: (response) {
        Iterable productList = json.decode(response.body);
        // List data = productList.map((model) => Products.fromJson(model)).toList();
        List<Products> data = List<Products>.from(productList.map((model) => Products.fromJson(model)));
        return data;
      }
  );
}

