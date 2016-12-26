import 'dart:io';

import 'package:edgehead/fractal_stories/actor.dart';
import 'package:edgehead/fractal_stories/world.dart';
import 'package:edgehead/fractal_stories/planner.dart';
import 'package:edgehead/fractal_stories/action.dart';
import 'package:edgehead/fractal_stories/item.dart';
import 'package:edgehead/fractal_stories/plan_consequence.dart';
import 'package:edgehead/fractal_stories/team.dart';
import 'package:edgehead/fractal_stories/storyline/randomly.dart';
import 'package:edgehead/fractal_stories/storyline/storyline.dart';

import 'package:edgehead/src/fight/fight_situation.dart';

main() async {
  var filip = new Actor((b) => b
    ..id = 1
    ..isPlayer = true
    ..pronoun = Pronoun.YOU
    ..name = "Filip"
    ..currentWeapon = new Sword()
    ..hitpoints = 2
    ..initiative = 1000);
  var briana = new Actor((b) => b
    ..id = 100
    ..pronoun = Pronoun.SHE
    ..name = "Briana"
    ..currentWeapon = new Sword("longsword"));
//  var brant = new Actor((b) => b
//    ..id = 500
//    ..pronoun = Pronoun.HE
//    ..name = "Brant"
//    ..currentWeapon = new Sword());

  var orc = new Actor((b) => b
    ..id = 1000
    ..name = "orc"
    ..nameIsProperNoun = false
    ..pronoun = Pronoun.HE
    ..currentWeapon = new Sword("scimitar")
    ..team = defaultEnemyTeam);

  var goblin = new Actor((b) => b
    ..id = 1001
    ..name = "goblin"
    ..nameIsProperNoun = false
    ..pronoun = Pronoun.HE
    ..currentWeapon = new Sword()
    ..team = defaultEnemyTeam);

  var initialSituation = new FightSituation.initialized(
      [filip.id, briana.id], [orc.id, goblin.id]).rebuild((b) => b
    ..events[2] = (w, s) {
      s.addParagraph();
      s.add("You hear a horrible growling sound from behind.");
      s.add("The worm must be near.");
      s.addParagraph();
    }
    ..events[6] = (w, s) {
      s.addParagraph();
      s.add("The earth shatters and there's that sound again.");
      s.addParagraph();
    });

  WorldState world = new WorldState(
      new Set.from([filip, briana, orc, goblin]), initialSituation);

//  world.validate();

  var consequence = new PlanConsequence.initial(world);
  var storyline = new Storyline();

  print("You and ${briana.name} sprint through the giant worm tunnel.\n");
  print("Suddenly, an **orc** and a **goblin** jump at you "
      "from a slimy crevice, swords in hand.");

  while (world.situations.isNotEmpty) {
    var situation = world.currentSituation;
    var actor = situation.getCurrentActor(world);

    var planner = new ActorPlanner(actor, world);
    await planner.plan(maxOrder: 7);
    var recs = planner.getRecommendations();
    if (recs.isEmpty) {
      // Hacky. Not sure this will work. Try to always have some action to do.
      world.elapseSituationTime(situation.id);
      world.time += 1;
      continue;
    }

    ActorAction selected;
    if (actor.isPlayer) {
      // Player
      if (recs.actions.length == 1) {
        // Only one option, select by default.
        selected = recs.actions.single;
      } else {
        print(storyline.realize());
        storyline.clear();

        planner.generateTable().forEach(print);
        int option = int.parse(stdin.readLineSync());
        selected = planner.firstActionScores.keys.toList()[option];
      }
    } else {
      selected = recs.actions[Randomly.chooseWeightedPrecise(recs.weights,
          max: PlannerRecommendation.weightsResolution)];
    }
    var consequences = selected.apply(actor, consequence, world).toList();
    int index = Randomly.chooseWeighted(consequences.map((c) => c.probability));
    consequence = consequences[index];
    storyline.concatenate(consequence.storyline);
    world = consequence.world;
  }
  print(storyline.realize());

  if (world.getActorById(filip.id).isAlive) {
    print("You start sprinting again.");
  } else {
    print("You will soon be the giant worm's food.");
  }
}
