import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_hiper_gundelik_mekanik_paketi/oyun_hiper_gundelik_mekanik_paketi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(hiperConfig.title.length, 33);
    expect(hiperConfig.tagline.length, 33);
    for (final s in hiperConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(hiperRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: hiperId, optionalMechanics: hiperRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(hiperRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
