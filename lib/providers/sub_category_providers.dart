

import 'package:ecommerce_app/core/live_data.dart';
import 'package:ecommerce_app/core/ui_state.dart';
import 'package:ecommerce_app/models/sub_category_model.dart';
import 'package:ecommerce_app/repositories/category_repositories.dart';
import 'package:flutter/material.dart';

class SubCategoryProvider extends ChangeNotifier {
  CategoryRepository categoryRepository;

  SubCategoryProvider({required this.categoryRepository});

  // var getSubCategoryData = SubCategory();
  List<SubCategory>list = [];
  LiveData<UIState<SubCategory>> subCategoryLiveData =
  LiveData<UIState<SubCategory>>();

  LiveData<UIState<SubCategory>> getSubCategoryLiveData() {
    return subCategoryLiveData;
  }

  void initialState()
  {
    subCategoryLiveData.setValue(Initial());
    notifyListeners();
  }

  getSubCategoryList(dynamic id) async {
    try {
      subCategoryLiveData.setValue(IsLoading());
      list = await categoryRepository.getSubCategory(id);
      if (list.isNotEmpty) {
        subCategoryLiveData.setValue(Success(SubCategory()));
      } else {
        subCategoryLiveData.setValue(IsEmpty());
      }
    } catch (ex) {
      subCategoryLiveData.setValue(Failure(ex.toString()));
    } finally {
      notifyListeners();
    }
    // return true;
  }
}