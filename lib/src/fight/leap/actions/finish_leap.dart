import 'package:edgehead/fractal_stories/action.dart';
import 'package:edgehead/fractal_stories/actor.dart';
import 'package:edgehead/fractal_stories/storyline/storyline.dart';
import 'package:edgehead/fractal_stories/world.dart';
import 'package:edgehead/src/fight/humanoid_pain_or_death.dart';
import 'package:edgehead/src/fight/fight_situation.dart';

class FinishLeap extends EnemyTargetAction {
  static const String className = "FinishLeap";

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

  FinishLeap(Actor enemy) : super(enemy);

  @override
  String get name => className;

  @override
  String get commandTemplate => "";

  @override
  String get rollReasonTemplate => "(WARNING should not be user-visible)";

  @override
  String applyFailure(Actor a, WorldState w, Storyline s) {
    throw new UnimplementedError();
  }

  @override
  String applySuccess(Actor a, WorldState w, Storyline s) {
    w.updateActorById(enemy.id, (b) => b..pose = Pose.onGround);
    final updatedEnemy = w.getActorById(enemy.id);
    w.updateActorById(a.id, (b) => b..pose = Pose.onGround);
    final thread = getThreadId(w, "LeapSituation");
    final ground = getGroundMaterial(w);
    a.report(s, "<subject> {ram<s>|smash<es>} into <object>",
        object: enemy, positive: true, actionThread: thread);
    s.add(
        "both ${a.isPlayer || enemy.isPlayer ? 'of you' : ''} "
        "{land on|fall to} the $ground",
        actionThread: thread);
    if (enemy.hitpoints > 1) {
      s.add(
          "the impact almost "
          "{knocks <object> unconscious|knocks <object> out}",
          object: enemy,
          actionThread: thread);
      reportPain(s, updatedEnemy);
      w.updateActorById(enemy.id, (b) => b..hitpoints -= 1);
    }
    return "${a.name} finishes leap at ${enemy.name}";
  }

  @override
  num getSuccessChance(Actor a, WorldState w) => 1.0;

  @override
  bool isApplicable(Actor a, WorldState w) => true;

  static EnemyTargetAction builder(Actor enemy) => new FinishLeap(enemy);
}
