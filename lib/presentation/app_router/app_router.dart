import 'package:auto_route/auto_route.dart';
import 'package:uiwidgets/presentation/app_router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: NewsRoute.page),
        AutoRoute(page: NewsDetailRoute.page),
        AutoRoute(page: AddNewPersonRoute.page),
        AutoRoute(page: AnimationRoute.page),
        AutoRoute(page: HeroRoute.page),
      ];
}
