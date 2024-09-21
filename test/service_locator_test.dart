import 'package:flutter_test/flutter_test.dart';
import 'package:stride/locator.dart';

void main() {

  setUp(() {
    locator.clear();
  });

  group("Service Locator Tests", () {
    test("Service Locator Returns Service", () {
      locator.add(1);
      locator.add(_TestService());
      expect(locator.get<int>(), 1);
    });

    test("Service Locator Throws Exception when service not found", () {
      expect(() => locator.get<_TestService>(), throwsException);
    });

    test("singleton test", () {
      locator.add(_TestService());
      expect(locator.get<_TestService>(), locator.get<_TestService>());
    });

    test("override test", () {
      locator.add<_TestService>(_SubTestService1());
      expect(locator.get<_TestService>(), isA<_SubTestService1>());

      locator.add<_TestService>(_SubTestService2());
      expect(locator.get<_TestService>(), isA<_SubTestService2>());
    });
  });
}

class _TestService {}

class _SubTestService1 extends _TestService {}

class _SubTestService2 extends _TestService {}
