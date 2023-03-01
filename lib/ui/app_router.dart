import 'package:dio_example_n6/ui/category_page.dart';
import 'package:dio_example_n6/ui/dynamic_page.dart';
import 'package:dio_example_n6/ui/image_picker.dart';
import 'package:dio_example_n6/ui/transaction_page.dart';
import 'package:dio_example_n6/ui/web_page.dart';
import 'package:flutter/material.dart';

abstract class RouteName {
  static const image = 'image';
  static const web = 'web';
  static const transaction = 'transaction';
  static const category = 'category';
  static const dynamic = 'dynamic';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.image:
        return MaterialPageRoute(builder: (_) => const ImgagePicker());
      case RouteName.web:
        return MaterialPageRoute(builder: (_) => const WebPage());
      case RouteName.transaction:
        return MaterialPageRoute(builder: (_) => const TransactionPage());
      case RouteName.category:
        return MaterialPageRoute(builder: (_) => const CategoryPage());
      case RouteName.dynamic:
        return MaterialPageRoute(builder: (_) => const DynamicPage());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
