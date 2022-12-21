import 'package:dio_example_n6/data/api/api_service.dart';
import 'package:dio_example_n6/data/models/category_model.dart';
import 'package:dio_example_n6/data/repository/category_repository.dart';
import 'package:flutter/cupertino.dart';

class CategoryViewModel extends ChangeNotifier {
  CategoryRepository categoryRepository;
  CategoryViewModel({required this.categoryRepository}) {
    fetchCategory();
  }

  List<CategoryModel>? categories;
  String errorForUI = "";

  fetchCategory() async {
    MyResponse myResponse = await categoryRepository.getCategories();
    if (myResponse.error.isEmpty) {
      categories = myResponse.data as List<CategoryModel>;
    } else {
      errorForUI = myResponse.error;
    }
    notifyListeners();
  }
}
