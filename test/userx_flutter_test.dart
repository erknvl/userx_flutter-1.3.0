import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:userx_flutter/userx_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('userx_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await UserX.platformVersion, '42');
  });
}