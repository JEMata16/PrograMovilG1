import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const InicioWidget() : const InicioSesionWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const InicioWidget() : const InicioSesionWidget(),
        ),
        FFRoute(
          name: 'InicioSesion',
          path: '/inicioSesion',
          builder: (context, params) => const InicioSesionWidget(),
        ),
        FFRoute(
          name: 'Inicio',
          path: '/inicio',
          builder: (context, params) => const InicioWidget(),
        ),
        FFRoute(
          name: 'Registrarse',
          path: '/registrarse',
          builder: (context, params) => const RegistrarseWidget(),
        ),
        FFRoute(
          name: 'AgregarPerfilFamiliar',
          path: '/agregarPerfilFamiliar',
          builder: (context, params) => const AgregarPerfilFamiliarWidget(),
        ),
        FFRoute(
          name: 'EditarPerfilFamiliar',
          path: '/editarPerfilFamiliar',
          asyncParams: {
            'perfil': getDoc(['familiares'], FamiliaresRecord.fromSnapshot),
          },
          builder: (context, params) => EditarPerfilFamiliarWidget(
            nombrePerfil: params.getParam(
              'nombrePerfil',
              ParamType.String,
            ),
            perfil: params.getParam(
              'perfil',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'PerfilesFamiliares',
          path: '/perfilesFamiliares',
          builder: (context, params) => const PerfilesFamiliaresWidget(),
        ),
        FFRoute(
          name: 'EducacionFinanciera',
          path: '/educacionFinanciera',
          builder: (context, params) => const EducacionFinancieraWidget(),
        ),
        FFRoute(
          name: 'InicioGastos',
          path: '/inicioGastos',
          builder: (context, params) => const InicioGastosWidget(),
        ),
        FFRoute(
          name: 'GastosPersonales',
          path: '/gastosPersonales',
          builder: (context, params) => const GastosPersonalesWidget(),
        ),
        FFRoute(
          name: 'GastosFamiliares',
          path: '/gastosFamiliares',
          builder: (context, params) => const GastosFamiliaresWidget(),
        ),
        FFRoute(
          name: 'AgregarGasto',
          path: '/agregarGasto',
          builder: (context, params) => const AgregarGastoWidget(),
        ),
        FFRoute(
          name: 'EditarGasto',
          path: '/editarGasto',
          asyncParams: {
            'gasto': getDoc(['gastos'], GastosRecord.fromSnapshot),
          },
          builder: (context, params) => EditarGastoWidget(
            gasto: params.getParam(
              'gasto',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'InicioIngresos',
          path: '/inicioIngresos',
          builder: (context, params) => const InicioIngresosWidget(),
        ),
        FFRoute(
          name: 'InicioDeudas',
          path: '/inicioDeudas',
          builder: (context, params) => InicioDeudasWidget(
            deudaPersonales: params.getParam(
              'deudaPersonales',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'AgregarIngreso',
          path: '/agregarIngreso',
          builder: (context, params) => const AgregarIngresoWidget(),
        ),
        FFRoute(
          name: 'AgregarDeuda',
          path: '/agregarDeuda',
          builder: (context, params) => const AgregarDeudaWidget(),
        ),
        FFRoute(
          name: 'EditarIngreso',
          path: '/editarIngreso',
          asyncParams: {
            'ingreso': getDoc(['ingresos'], IngresosRecord.fromSnapshot),
          },
          builder: (context, params) => EditarIngresoWidget(
            ingreso: params.getParam(
              'ingreso',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'IngresosFamiliares',
          path: '/ingresosFamiliares',
          builder: (context, params) => const IngresosFamiliaresWidget(),
        ),
        FFRoute(
          name: 'IngresosPersonales',
          path: '/ingresosPersonales',
          builder: (context, params) => const IngresosPersonalesWidget(),
        ),
        FFRoute(
          name: 'EditarDeuda',
          path: '/editarDeuda',
          asyncParams: {
            'deudas': getDoc(['deudas'], DeudasRecord.fromSnapshot),
          },
          builder: (context, params) => EditarDeudaWidget(
            deudas: params.getParam(
              'deudas',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'InicioPresupuestos',
          path: '/inicioPresupuestos',
          builder: (context, params) => const InicioPresupuestosWidget(),
        ),
        FFRoute(
          name: 'EditarPresupuesto',
          path: '/editarPresupuesto',
          asyncParams: {
            'presupuesto':
                getDoc(['presupuestos'], PresupuestosRecord.fromSnapshot),
          },
          builder: (context, params) => EditarPresupuestoWidget(
            presupuesto: params.getParam(
              'presupuesto',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'AgregarPresupuesto',
          path: '/agregarPresupuesto',
          builder: (context, params) => const AgregarPresupuestoWidget(),
        ),
        FFRoute(
          name: 'PresupuestosPersonales',
          path: '/presupuestosPersonales',
          builder: (context, params) => const PresupuestosPersonalesWidget(),
        ),
        FFRoute(
          name: 'PresupuestosFamiliares',
          path: '/presupuestosFamiliares',
          builder: (context, params) => const PresupuestosFamiliaresWidget(),
        ),
        FFRoute(
          name: 'Animaciones',
          path: '/animaciones',
          builder: (context, params) => const AnimacionesWidget(),
        ),
        FFRoute(
          name: 'DeudasPersonales',
          path: '/deudasPersonales',
          builder: (context, params) => const DeudasPersonalesWidget(),
        ),
        FFRoute(
          name: 'DeudasFamiliares',
          path: '/deudasFamiliares',
          builder: (context, params) => const DeudasFamiliaresWidget(),
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
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

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

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
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
    List<String>? collectionNamePath,
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
      collectionNamePath: collectionNamePath,
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
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/inicioSesion';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
