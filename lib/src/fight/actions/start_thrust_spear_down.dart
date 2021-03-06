import 'package:edgehead/fractal_stories/action.dart';
import 'package:edgehead/fractal_stories/actor.dart';
import 'package:edgehead/fractal_stories/items/spear.dart';
import 'package:edgehead/fractal_stories/storyline/storyline.dart';
import 'package:edgehead/fractal_stories/world.dart';
import 'package:edgehead/src/fight/actions/start_defensible_action.dart';
import 'package:edgehead/src/fight/common/weapon_as_object2.dart';
import 'package:edgehead/src/fight/strike_down/strike_down_defense/on_ground_defense_situation.dart';
import 'package:edgehead/src/fight/strike_down/strike_down_situation.dart';
import 'package:edgehead/src/predetermined_result.dart';

const String startThrustSpearDownCommandTemplate = "thrust down at <object>";

const String startThrustSpearDownHelpMessage =
    "Opponents on the ground are often the most "
    "vulnerable.";

EnemyTargetAction startThrustSpearDownBuilder(Actor enemy) =>
    new StartDefensibleAction(
        "StartThrustSpearDown",
        startThrustSpearDownCommandTemplate,
        startThrustSpearDownHelpMessage,
        startThrustSpearDownReportStart,
        (a, w, enemy) =>
            !a.isPlayer &&
            enemy.isOnGround &&
            !a.isOnGround &&
            a.currentWeapon is Spear,
        (a, w, enemy) => new StrikeDownSituation.initialized(a, enemy),
        (a, w, enemy) => new OnGroundDefenseSituation.initialized(a, enemy),
        enemy);

EnemyTargetAction startThrustSpearDownPlayerBuilder(Actor enemy) =>
    new StartDefensibleAction(
        "StartThrustSpearDownPlayer",
        startThrustSpearDownCommandTemplate,
        startThrustSpearDownHelpMessage,
        startThrustSpearDownReportStart,
        (a, w, enemy) =>
            a.isPlayer &&
            enemy.isOnGround &&
            !a.isOnGround &&
            a.currentWeapon is Spear,
        (a, w, enemy) => new StrikeDownSituation.initialized(a, enemy),
        (a, w, enemy) => new OnGroundDefenseSituation.initialized(a, enemy,
            predeterminedResult: Predetermination.failureGuaranteed),
        enemy,
        rerollable: true,
        rerollResource: Resource.stamina,
        rollReasonTemplate: "will <subject> hit?",
        successChanceGetter: (a, w, enemy) {
          final outOfBalancePenalty = a.isOffBalance ? 0.2 : 0.0;
          final shieldPenalty = enemy.currentShield != null ? 0.2 : 0.0;
          return 0.7 - outOfBalancePenalty - shieldPenalty;
        },
        applyStartOfFailure: startThrustSpearDownReportStart,
        defenseSituationWhenFailed: (a, w, enemy) =>
            new OnGroundDefenseSituation.initialized(a, enemy,
                predeterminedResult: Predetermination.successGuaranteed));

void startThrustSpearDownReportStart(
        Actor a, WorldState w, Storyline s, Actor enemy, _) =>
    a.report(
        s,
        "<subject> thrust<s> down "
        "{with ${weaponAsObject2(a)} |}at <object>",
        object: enemy);
