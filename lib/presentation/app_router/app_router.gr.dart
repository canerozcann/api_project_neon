// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:uiwidgets/presentation/add_new_person/add_new_person_screen.dart'
    as _i1;
import 'package:uiwidgets/presentation/animation_screen/animation_screen.dart'
    as _i2;
import 'package:uiwidgets/presentation/hero/hero_screen.dart' as _i3;
import 'package:uiwidgets/presentation/home/home_page.dart' as _i4;
import 'package:uiwidgets/presentation/news/news_detail_screen.dart' as _i5;
import 'package:uiwidgets/presentation/news/news_screen.dart' as _i6;

/// generated route for
/// [_i1.AddNewPersonScreen]
class AddNewPersonRoute extends _i7.PageRouteInfo<void> {
  const AddNewPersonRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AddNewPersonRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddNewPersonRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddNewPersonScreen();
    },
  );
}

/// generated route for
/// [_i2.AnimationScreen]
class AnimationRoute extends _i7.PageRouteInfo<void> {
  const AnimationRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AnimationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnimationRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.AnimationScreen();
    },
  );
}

/// generated route for
/// [_i3.HeroScreen]
class HeroRoute extends _i7.PageRouteInfo<void> {
  const HeroRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HeroRoute.name,
          initialChildren: children,
        );

  static const String name = 'HeroRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.HeroScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.NewsDetailScreen]
class NewsDetailRoute extends _i7.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i8.Key? key,
    required String description,
    required String imageUrl,
    required String publishedAt,
    List<_i7.PageRouteInfo>? children,
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

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewsDetailRouteArgs>();
      return _i5.NewsDetailScreen(
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

  final _i8.Key? key;

  final String description;

  final String imageUrl;

  final String publishedAt;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, description: $description, imageUrl: $imageUrl, publishedAt: $publishedAt}';
  }
}

/// generated route for
/// [_i6.NewsScreen]
class NewsRoute extends _i7.PageRouteInfo<void> {
  const NewsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.NewsScreen();
    },
  );
}
