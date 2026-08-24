import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

enum UserRole { user, seller }



extension UserRoleX on UserRole {
  String get value => name;

  String get homeRoute {
    switch (this) {
      case UserRole.seller:
        return RoutePath.orderSellerScreen.addBasePath;
      case UserRole.user:
        return RoutePath.homeScreen.addBasePath;
    }
  }
}
