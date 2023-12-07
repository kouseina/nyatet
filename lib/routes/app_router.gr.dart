// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddRoute.name: (routeData) {
      final args =
          routeData.argsAs<AddRouteArgs>(orElse: () => const AddRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddPage(
          key: args.key,
          note: args.note,
        ),
      );
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>(
          orElse: () => const DetailRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailPage(
          key: args.key,
          note: args.note,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
  };
}

/// generated route for
/// [AddPage]
class AddRoute extends PageRouteInfo<AddRouteArgs> {
  AddRoute({
    Key? key,
    Note? note,
    List<PageRouteInfo>? children,
  }) : super(
          AddRoute.name,
          args: AddRouteArgs(
            key: key,
            note: note,
          ),
          initialChildren: children,
        );

  static const String name = 'AddRoute';

  static const PageInfo<AddRouteArgs> page = PageInfo<AddRouteArgs>(name);
}

class AddRouteArgs {
  const AddRouteArgs({
    this.key,
    this.note,
  });

  final Key? key;

  final Note? note;

  @override
  String toString() {
    return 'AddRouteArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [DetailPage]
class DetailRoute extends PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    Key? key,
    Note? note,
    List<PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            key: key,
            note: note,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static const PageInfo<DetailRouteArgs> page = PageInfo<DetailRouteArgs>(name);
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    this.note,
  });

  final Key? key;

  final Note? note;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
