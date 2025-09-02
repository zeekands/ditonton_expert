import 'package:core/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('routeObserver is a RouteObserver<ModalRoute>', () {
    expect(routeObserver, isA<RouteObserver<ModalRoute>>());
  });
}

