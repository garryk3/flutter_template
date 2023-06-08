enum RouteNames {
  home,
  tests,
  test,
  testsHistory,
}

extension ParseToString on RouteNames {
  String route() {
    return '/${toString().split('.').last}';
  }
}
