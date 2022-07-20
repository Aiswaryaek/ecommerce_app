import 'package:ecommerce_app/core/live_data.dart';
import 'package:ecommerce_app/core/ui_state.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/repositories/category_repositories.dart';
import 'package:flutter/material.dart';

class GetCategoryProvider extends ChangeNotifier {
  CategoryRepository categoryRepository;

  GetCategoryProvider({required this.categoryRepository});

  // var getCategory = Category();
  List<CategoryModel> list = [];
  LiveData<UIState<CategoryModel>> getCategoryData = LiveData<UIState<CategoryModel>>();

  LiveData<UIState<CategoryModel>> getCategoryLiveData() {
    return getCategoryData;
  }

  void initialState() {
    getCategoryData.setValue(Initial());
    notifyListeners();
  }

  getCategoryList() async {
    try {
      getCategoryData.setValue(IsLoading());
      list = await categoryRepository.getCategory();
      if (list.isNotEmpty) {
        getCategoryData.setValue(Success(CategoryModel()));
      } else {
        getCategoryData.setValue(IsEmpty());
      }
    } catch (ex) {
      getCategoryData.setValue(Failure(ex.toString()));
    } finally {
      notifyListeners();
    }
    // return true;
  }
}
