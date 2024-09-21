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

      locator.override<_TestService>(_SubTestService2());
      expect(locator.get<_TestService>(), isA<_SubTestService2>());
    });

    test("lazy test", () {
      locator.addLazy<_TestService>(() => _TestService());
      expect(locator.services.length, 0);
      expect(locator.lazyInitializers.length, 1);

      locator.get<_TestService>();
      expect(locator.services.length, 1);
      expect(locator.lazyInitializers.length, 0);
    });

    test("lazy override test", () {
      locator.addLazy<_TestService>(() => _TestService());
      expect(locator.services.length, 0);
      expect(locator.lazyInitializers.length, 1);

      locator.get<_TestService>();
      expect(locator.services.length, 1);
      expect(locator.lazyInitializers.length, 0);

      locator.overrideLazily<_TestService>(() => _SubTestService1());
      expect(locator.services.length, 0);
      expect(locator.lazyInitializers.length, 1);
    });

    test("lazy provides the same instance", () {
      locator.addLazy<_TestService>(() => _TestService());
      final service1 = locator.get<_TestService>();
      final service2 = locator.get<_TestService>();

      expect(service1 == service2, true);
    });
  });
}

class _TestService {}

class _SubTestService1 extends _TestService {}

class _SubTestService2 extends _TestService {}
