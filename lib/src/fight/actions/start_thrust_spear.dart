import 'package:edgehead/fractal_stories/action.dart';
import 'package:edgehead/fractal_stories/actor.dart';
import 'package:edgehead/fractal_stories/items/spear.dart';
import 'package:edgehead/fractal_stories/situation.dart';
import 'package:edgehead/fractal_stories/storyline/storyline.dart';
import 'package:edgehead/fractal_stories/world.dart';
import 'package:edgehead/src/fight/actions/start_defensible_action.dart';
import 'package:edgehead/src/fight/common/weapon_as_object2.dart';
import 'package:edgehead/src/fight/slash/slash_defense/slash_defense_situation.dart';
import 'package:edgehead/src/fight/slash/slash_situation.dart';
import 'package:edgehead/src/predetermined_result.dart';

const String startThrustCommandTemplate = "thrust at <object>";

const String startThrustHelpMessage = "The basic move with a spear.";

EnemyTargetAction
    startThrustSpearBuilder(Actor enemy) =>
        new StartDefensibleAction(
            "StartThrustSpear",
            startThrustCommandTemplate,
            startThrustHelpMessage,
            startThrustSpearReportStart,
            (a, w, enemy) =>
                !a.isPlayer &&
                a.isStanding &&
                !enemy.isOnGround &&
                a.currentWeapon is Spear,
            (a, w, enemy) => new SlashSituation.initialized(a, enemy),
            (a, w, enemy) => new SlashDefenseSituation.initialized(a, enemy),
            enemy);

EnemyTargetAction startThrustSpearPlayerBuilder(Actor enemy) =>
    new StartDefensibleAction(
        "StartThrustSpearPlayer",
        startThrustCommandTemplate,
        startThrustHelpMessage,
        startThrustSpearReportStart,
        (a, w, enemy) =>
            a.isPlayer &&
            a.isStanding &&
            !enemy.isOnGround &&
            a.currentWeapon is Spear,
        (a, w, enemy) => new SlashSituation.initialized(a, enemy),
        (a, w, enemy) => new SlashDefenseSituation.initialized(a, enemy,
            predeterminedResult: Predetermination.failureGuaranteed),
        enemy,
        successChanceGetter: (a, w, enemy) {
          final shieldPenalty = enemy.currentShield != null ? 0.2 : 0.0;
          return 0.7 - shieldPenalty;
        },
        applyStartOfFailure: startThrustSpearReportStart,
        defenseSituationWhenFailed: (a, w, enemy) =>
            new SlashDefenseSituation.initialized(a, enemy,
                predeterminedResult: Predetermination.successGuaranteed),
        rerollable: true,
        rerollResource: Resource.stamina,
        rollReasonTemplate: "will <subject> hit <objectPronoun>?");

void startThrustSpearReportStart(Actor a, WorldState w, Storyline s,
        Actor enemy, Situation mainSituation) =>
    a.report(s, "<subject> thrust<s> {${weaponAsObject2(a)} |}at <object>",
        object: enemy,
        actionThread: mainSituation.id,
        isSupportiveActionInThread: true);
