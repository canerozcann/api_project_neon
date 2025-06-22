// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:uiwidgets/presentation/adapty/adapty_screen.dart' as _i1;
import 'package:uiwidgets/presentation/add_new_person/add_new_person_screen.dart'
    as _i2;
import 'package:uiwidgets/presentation/animation_screen/animation_screen.dart'
    as _i3;
import 'package:uiwidgets/presentation/hero/hero_screen.dart' as _i4;
import 'package:uiwidgets/presentation/home/home_page.dart' as _i5;
import 'package:uiwidgets/presentation/news/news_detail_screen.dart' as _i6;
import 'package:uiwidgets/presentation/news/news_screen.dart' as _i7;

/// generated route for
/// [_i1.AdaptyScreen]
class AdaptyRoute extends _i8.PageRouteInfo<void> {
  const AdaptyRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AdaptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdaptyRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.AdaptyScreen();
    },
  );
}

/// generated route for
/// [_i2.AddNewPersonScreen]
class AddNewPersonRoute extends _i8.PageRouteInfo<void> {
  const AddNewPersonRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AddNewPersonRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddNewPersonRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddNewPersonScreen();
    },
  );
}

/// generated route for
/// [_i3.AnimationScreen]
class AnimationRoute extends _i8.PageRouteInfo<void> {
  const AnimationRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AnimationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnimationRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.AnimationScreen();
    },
  );
}

/// generated route for
/// [_i4.HeroScreen]
class HeroRoute extends _i8.PageRouteInfo<void> {
  const HeroRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HeroRoute.name,
          initialChildren: children,
        );

  static const String name = 'HeroRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.HeroScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeScreen();
    },
  );
}

/// generated route for
/// [_i6.NewsDetailScreen]
class NewsDetailRoute extends _i8.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i9.Key? key,
    required String description,
    required String imageUrl,
    required String publishedAt,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            description: description,
            imageUrl: imageUrl,
            publishedAt: publishedAt,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewsDetailRouteArgs>();
      return _i6.NewsDetailScreen(
        key: args.key,
        description: args.description,
        imageUrl: args.imageUrl,
        publishedAt: args.publishedAt,
      );
    },
  );
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
  });

  final _i9.Key? key;

  final String description;

  final String imageUrl;

  final String publishedAt;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, description: $description, imageUrl: $imageUrl, publishedAt: $publishedAt}';
  }
}

/// generated route for
/// [_i7.NewsScreen]
class NewsRoute extends _i8.PageRouteInfo<void> {
  const NewsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.NewsScreen();
    },
  );
}
