import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nyatet/models/note.dart';
import 'package:nyatet/modules/detail_page.dart';
import 'package:nyatet/modules/add_page.dart';
import 'package:nyatet/modules/home_page.dart';
import 'package:nyatet/modules/search_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: DetailRoute.page),
        AutoRoute(page: AddRoute.page),
        AutoRoute(page: SearchRoute.page),
      ];
}
