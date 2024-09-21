import 'package:flutter_test/flutter_test.dart';
import 'package:stride/di.dart';

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
  });
}

class _TestService {}
