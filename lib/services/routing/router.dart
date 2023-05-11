import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secrets_website/blocks/secrets_screen/screens/secrets_screen.dart';
import 'package:secrets_website/blocks/section_screen/screens/section_screen.dart';
import 'package:secrets_website/blocks/sections_screen/data/sections_screen_controller.dart';
import 'package:secrets_website/blocks/sections_screen/screens/sections_screen.dart';
import 'package:secrets_website/services/routing/routes.dart';
import 'package:secrets_website/services/screens_builder.dart';

class RoutingData {
  final String route;
  final Map<String, String> _queryParametrs;

  RoutingData({
    required this.route,
    required Map<String, String> queryParametrs,
  }) : _queryParametrs = queryParametrs;

  operator [](String key) => _queryParametrs[key];
}

extension StringExtensions on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    return RoutingData(
        route: uriData.path, queryParametrs: uriData.queryParameters);
  }
}

Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name!.getRoutingData;
  switch (routingData.route) {
    case Routes.home:
      return _getPageRoute(SecretsScreen(), settings);
    case Routes.sections:
      var id = int.tryParse(routingData['id']);
      ScreensBuilder.sectionsScreen(id!);
      return _getPageRoute(SectionsScreen(id: id!), settings);
    // case NewsRoute:
    //   return _getPageRoute(NewsListView(), settings);
    case Routes.section:

      int id = int.tryParse(routingData['id'])!;
      int index = int.tryParse(routingData['index'])!;
      ScreensBuilder.sectionsScreen(id);
      ScreensBuilder.sectionScreen(index);
      return _getPageRoute(SectionScreen(id: id), settings);
    // case ProjectRoute:
    //   var id = int.tryParse(routingData['id']);
    //   var index = int.tryParse(routingData['index']);
    //   return _getPageRoute(
    //       ProjectDetailsView(projectId: id!, index: index!), settings);
    default:
      return _getPageRoute(SecretsScreen(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name!);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );

  @override
  Duration get transitionDuration => Duration(milliseconds: 5);
}
