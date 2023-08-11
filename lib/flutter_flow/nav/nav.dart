import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';

import '/backend/schema/structs/index.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => HomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => HomePageWidget(),
        ),
        FFRoute(
          name: 'listcards',
          path: '/listcards',
          builder: (context, params) => ListcardsWidget(),
        ),
        FFRoute(
          name: 'delete',
          path: '/delete',
          builder: (context, params) => DeleteWidget(
            token: params.getParam('token', ParamType.String),
            cardname: params.getParam('cardname', ParamType.String),
            last4: params.getParam('last4', ParamType.String),
            first5: params.getParam('first5', ParamType.String),
            expiryMonth: params.getParam('expiryMonth', ParamType.String),
            expiryYear: params.getParam('expiryYear', ParamType.String),
            type: params.getParam('type', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'AddCard',
          path: '/addCard',
          builder: (context, params) => AddCardWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: 'Checkout5',
          path: '/checkout5',
          builder: (context, params) => Checkout5Widget(
            token: params.getParam('token', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'chossingCard',
          path: '/chossingCard',
          builder: (context, params) => ChossingCardWidget(),
        ),
        FFRoute(
          name: 'Services',
          path: '/services',
          builder: (context, params) => ServicesWidget(),
        ),
        FFRoute(
          name: 'SuccessPage',
          path: '/successPage',
          builder: (context, params) => SuccessPageWidget(
            oderamount: params.getParam('oderamount', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'SuccessPayment',
          path: '/successPayment',
          builder: (context, params) => SuccessPaymentWidget(
            refId: params.getParam('refId', ParamType.String),
            typeoftransaction:
                params.getParam('typeoftransaction', ParamType.String),
            amount: params.getParam('amount', ParamType.String),
            projectdescription:
                params.getParam('projectdescription', ParamType.String),
            date: params.getParam('date', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'DeletePayment',
          path: '/deletePayment',
          builder: (context, params) => DeletePaymentWidget(
            refId: params.getParam('refId', ParamType.String),
            typeoftransaction:
                params.getParam('typeoftransaction', ParamType.String),
            amount: params.getParam('amount', ParamType.String),
            projectdescription:
                params.getParam('projectdescription', ParamType.String),
            date: params.getParam('date', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'AddSuccessPage',
          path: '/addSuccessPage',
          builder: (context, params) => AddSuccessPageWidget(),
        ),
        FFRoute(
          name: 'AddCardLoading',
          path: '/addCardLoading',
          builder: (context, params) => AddCardLoadingWidget(),
        ),
        FFRoute(
          name: 'listcardsCopy',
          path: '/listcardsCopy',
          builder: (context, params) => ListcardsCopyWidget(),
        ),
        FFRoute(
          name: 'listcardsCopy2',
          path: '/listcardsCopy2',
          builder: (context, params) => ListcardsCopy2Widget(),
        ),
        FFRoute(
          name: 'transactions',
          path: '/transactions',
          builder: (context, params) => TransactionsWidget(),
        ),
        FFRoute(
          name: 'AddCardCopy',
          path: '/addCardCopy',
          builder: (context, params) => AddCardCopyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}