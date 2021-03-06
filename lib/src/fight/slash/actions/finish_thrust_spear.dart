import 'package:edgehead/edgehead_lib.dart' show brianaId;
import 'package:edgehead/fractal_stories/action.dart';
import 'package:edgehead/fractal_stories/actor.dart';
import 'package:edgehead/fractal_stories/items/spear.dart';
import 'package:edgehead/fractal_stories/storyline/storyline.dart';
import 'package:edgehead/fractal_stories/world.dart';
import 'package:edgehead/src/fight/humanoid_pain_or_death.dart';
import 'package:edgehead/src/fight/slash/slash_situation.dart';

class FinishThrustSpear extends EnemyTargetAction {
  static const String className = "FinishThrustSpear";

  @override
  final String helpMessage = null;

  @override
  final bool isAggressive = true;

  @override
  final bool isProactive = true;

  @override
  final bool rerollable = true;

  @override
  final Resource rerollResource = Resource.stamina;

  FinishThrustSpear(Actor enemy) : super(enemy);

  @override
  String get commandTemplate => "";

  @override
  String get name => className;

  @override
  String get rollReasonTemplate => "(WARNING should not be user-visible)";

  @override
  String applyFailure(Actor a, WorldState w, Storyline s) {
    throw new UnimplementedError();
  }

  @override
  String applySuccess(Actor a, WorldState w, Storyline s) {
    w.updateActorById(
        enemy.id, (b) => b..hitpoints -= a.currentWeapon.thrustingDamage);
    final updatedEnemy = w.getActorById(enemy.id);
    final thread = getThreadId(w, SlashSituation.className);
    bool killed = !updatedEnemy.isAlive && updatedEnemy.id != brianaId;
    if (!killed) {
      a.report(
          s,
          "<subject> {pierce<s>|stab<s>|bore<s> through} <object's> "
          "{shoulder|abdomen|thigh}",
          object: updatedEnemy,
          positive: true,
          actionThread: thread);
      reportPain(s, updatedEnemy);
    } else {
      a.report(
          s,
          "<subject> {pierce<s>|stab<s>|bore<s> through|impale<s>} "
          "<object's> "
          "{neck|chest|heart}",
          object: updatedEnemy,
          positive: true,
          actionThread: thread);
      killHumanoid(s, w, updatedEnemy);
    }
    return "${a.name} pierces${killed ? ' (and kills)' : ''} ${enemy.name}";
  }

  @override
  num getSuccessChance(Actor a, WorldState w) => 1.0;

  @override
  bool isApplicable(Actor a, WorldState w) => a.currentWeapon is Spear;

  static EnemyTargetAction builder(Actor enemy) => new FinishThrustSpear(enemy);
}
