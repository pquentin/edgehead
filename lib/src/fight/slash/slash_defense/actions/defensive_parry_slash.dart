import 'package:edgehead/fractal_stories/action.dart';
import 'package:edgehead/fractal_stories/actor.dart';
import 'package:edgehead/fractal_stories/storyline/randomly.dart';
import 'package:edgehead/fractal_stories/storyline/storyline.dart';
import 'package:edgehead/fractal_stories/world.dart';
import 'package:edgehead/src/fight/common/weapon_as_object2.dart';
import 'package:edgehead/src/fight/slash/slash_defense/slash_defense_situation.dart';

class DefensiveParrySlash extends EnemyTargetAction {
  static const String className = "DefensiveParrySlash";

  @override
  final String helpMessage = "Stepping back is the safest way to get out of "
      "harm's way.";

  @override
  final bool isAggressive = false;

  @override
  final bool isProactive = false;

  @override
  final bool rerollable = true;

  @override
  final Resource rerollResource = Resource.stamina;

  DefensiveParrySlash(Actor enemy) : super(enemy);

  @override
  String get commandTemplate => "step back and parry";

  @override
  String get name => className;

  @override
  String get rollReasonTemplate => "will <subject> parry it?";

  @override
  String applyFailure(Actor a, WorldState w, Storyline s) {
    a.report(
        s,
        "<subject> tr<ies> to {parry|deflect it|"
        "meet it with ${weaponAsObject2(a)}|"
        "fend it off}");
    if (a.isOffBalance) {
      a.report(s, "<subject> <is> out of balance", but: true);
    } else {
      Randomly.run(
          () => a.report(s, "<subject> {fail<s>|<does>n't succeed}", but: true),
          () => enemy.report(s, "<subject> <is> too quick for <object>",
              object: a, but: true));
    }
    w.popSituation();
    return "${a.name} fails to parry ${enemy.name}";
  }

  @override
  String applySuccess(Actor a, WorldState w, Storyline s) {
    if (a.isPlayer) {
      a.report(s, "<subject> {step<s>|take<s> a step} back");
    }
    a.report(
        s,
        "<subject> {parr<ies> it|deflect<s> it|"
        "meet<s> it with ${weaponAsObject2(a)}|"
        "fend<s> it off}",
        positive: true);

    if (!a.isStanding) {
      w.updateActorById(a.id, (b) => b..pose = Pose.standing);
      if (a.isPlayer) {
        a.report(s, "<subject> regain<s> balance");
      }
    }
    w.popSituationsUntil("FightSituation");
    return "${a.name} steps back and parries ${enemy.name}";
  }

  @override
  num getSuccessChance(Actor a, WorldState w) {
    if (a.isPlayer) return 0.98;
    SlashDefenseSituation situation = w.currentSituation;
    num outOfBalancePenalty = a.isStanding ? 0 : 0.2;
    return situation.predeterminedChance.or(0.5 - outOfBalancePenalty);
  }

  @override
  bool isApplicable(Actor a, WorldState w) => a.currentWeapon.canParrySlash;

  static EnemyTargetAction builder(Actor enemy) =>
      new DefensiveParrySlash(enemy);
}
