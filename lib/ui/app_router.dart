import 'package:dio_example_n6/ui/category_page.dart';
import 'package:dio_example_n6/ui/transaction_page.dart';
import 'package:dio_example_n6/ui/web_page.dart';
import 'package:flutter/material.dart';

abstract class RouteName {
  static const main = 'main';
  static const web = 'web';
  static const transaction = 'transaction';
  static const category = 'category';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RouteName.main:
      //   return MaterialPageRoute(builder: (_) => MainPage());
      case RouteName.web:
        return MaterialPageRoute(builder: (_) => const WebPage());
      case RouteName.transaction:
        return MaterialPageRoute(builder: (_) => const TransactionPage());
      case RouteName.category:
        return MaterialPageRoute(builder: (_) => const CategoryPage());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
