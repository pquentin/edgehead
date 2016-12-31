import 'package:edgehead/fractal_stories/action.dart';
import 'package:edgehead/fractal_stories/actor.dart';
import 'package:edgehead/fractal_stories/item.dart';
import 'package:edgehead/fractal_stories/storyline/storyline.dart';
import 'package:edgehead/fractal_stories/world.dart';
import 'package:edgehead/src/fight/slash_defense_situation.dart';
import 'package:edgehead/src/fight/slash_situation.dart';

class CounterSlash extends EnemyTargetAction {
  CounterSlash(Actor enemy) : super(enemy);

  @override
  String get nameTemplate => "swing back at <object>";

  @override
  final String helpMessage = "You can deal serious damage when countering "
      "because your opponent is often caught off guard. On the other hand, "
      "counters require fast reaction and could throw you out of balance.";

  @override
  String applyFailure(Actor a, WorldState w, Storyline s) {
    a.report(s, "<subject> tr<ies> to swing back");
    a.report(s, "<subject> {go<es> wide|miss<es>}", but: true);
    if (a.pose == Pose.standing) {
      w.updateActorById(a.id, (b) => b..pose = Pose.offBalance);
      a.report(s, "<subject> lose<s> balance because of that",
          negative: true, endSentence: true);
    }
    return "${a.name} fails to swing back at ${enemy.name}";
  }

  @override
  String applySuccess(Actor a, WorldState w, Storyline s) {
    a.report(s, "<subject> swing<s> back at <object>", object: enemy);
    var slashSituation = new SlashSituation.initialized(a, enemy);
    w.pushSituation(slashSituation);
    var slashDefenseSituation = new SlashDefenseSituation.initialized(a, enemy);
    w.pushSituation(slashDefenseSituation);
    return "${a.name} swings back at ${enemy.name}";
  }

  @override
  num getSuccessChance(Actor actor, WorldState world) =>
      enemy.pose == Pose.standing ? 0.7 : 0.9;

  @override
  bool isApplicable(Actor a, WorldState w) => a.wields(ItemType.SWORD);

  static EnemyTargetAction builder(Actor enemy) => new CounterSlash(enemy);
}