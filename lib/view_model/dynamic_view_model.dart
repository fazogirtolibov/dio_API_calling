import 'package:dio_example_n6/data/api/api_service.dart';
import 'package:dio_example_n6/data/models/dynamic_model.dart';
import 'package:dio_example_n6/data/repository/dynamic_repository.dart';
import 'package:flutter/cupertino.dart';

class DynamicViewModel extends ChangeNotifier {
  DynamicRepository dynamicRepository;
  DynamicViewModel({required this.dynamicRepository}) {
    getDynamic();
  }

  Dynamic? informartions;
  String errorForUI = '';

  getDynamic() async {
    MyResponse myResponse = await dynamicRepository.getDynamic();
    print(myResponse.error);

    if (myResponse.error.isEmpty) {
      informartions = myResponse.data as Dynamic;
    } else {
      errorForUI = myResponse.error;
    }
    notifyListeners();
  }
}
