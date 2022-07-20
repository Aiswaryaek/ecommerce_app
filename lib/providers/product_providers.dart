


import 'package:ecommerce_app/core/live_data.dart';
import 'package:ecommerce_app/core/ui_state.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/models/sub_category_model.dart';
import 'package:ecommerce_app/repositories/category_repositories.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  CategoryRepository categoryRepository;

  ProductProvider({required this.categoryRepository});

  // var getSubCategoryData = SubCategory();
  List<Products>list = [];
  LiveData<UIState<Products>> productLiveData =
  LiveData<UIState<Products>>();

  LiveData<UIState<Products>> getProductLiveData() {
    return productLiveData;
  }

  void initialState()
  {
    productLiveData.setValue(Initial());
    notifyListeners();
  }

  getProductsList(dynamic id) async {
    try {
      productLiveData.setValue(IsLoading());
      list = await categoryRepository.getProducts(id);
      if (list.isNotEmpty) {
        productLiveData.setValue(Success(Products()));
      } else {
        productLiveData.setValue(IsEmpty());
      }
    } catch (ex) {
      productLiveData.setValue(Failure(ex.toString()));
    } finally {
      notifyListeners();
    }
    // return true;
  }
}