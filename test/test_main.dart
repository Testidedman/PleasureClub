import 'package:f/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('', () async {
    final versions = await getVersions();
    expect(versions, []);
  });

  test('', () async {
    final healthCheck = await getHealthCheck();
    expect(healthCheck, true);
  });

  test('', () async {
    final healthCheck = await getHealthCheck();
    expect(healthCheck, true);
  });
}