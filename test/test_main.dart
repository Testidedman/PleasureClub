import 'package:f/main.dart';
import 'package:f/presentation/main_page/main_services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final MainService mainService = IMainService();
  test('', () async {
    final versions = await getVersions();
    expect(versions, []);
  });

  test('', () async {
    final healthCheck = await getHealthCheck();
    expect(healthCheck, true);
  });

  test('', () async {
    final stories = await mainService.getStories();
    expect(stories, stories.isNotEmpty);
  });
}