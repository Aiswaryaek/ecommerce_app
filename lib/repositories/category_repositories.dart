
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ecommerce_app/services/category_services.dart';
import 'package:ecommerce_app/services/webservices.dart';

class CategoryRepository{
  var webService;
  CategoryRepository() {
    webService = Webservice();
  }
  Future getCategory() => webService?.get(getCategoryApi());
  Future getSubCategory(dynamic id) => webService?.get(getSubCategoryApi(id));
  Future getProducts(dynamic catId) => webService?.get(getProductsApi(catId));
}