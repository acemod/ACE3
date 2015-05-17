---
layout: wiki
title: Mission tools
description: A short description of ACE3's mission tools that help mission makers to provide awesome missions
group: missionmaker
order: 10
parent: wiki
---

## 1. ACE Rallypoints
*Part of: ace_respawn*

"ACE rally points" is a two way teleport system between two positions. Usually this is used to transport units that have died during a mission back to the front line. The rally points are portrayed by flagpoles (West, East and Independant flagpoles are available) that have a "Base" and an "Exit" version.

They can be found in the editor under: "Empty" >> "ACE Respawn"

**Classnames:**
* `ACE_Rallypoint_West`, `ACE_RallypointExit_West`
* `ACE_Rallypoint_East`, `ACE_RallypointExit_East`
* `ACE_Rallypoint_Independent`, `ACE_RallypointExit_Independent`

Using the Interaction Menu on a rallypoint offers the ability to teleport from one flagpole to the other flagpole and vice versa.

If you want to change the texture of the flag use this line:
```c++
this setFlagTexture 'path\to\my\texture\my_awesome_clan_logo.paa';
```

*Note: You can't place more than one rallypoint of the same type.*

All units synced to the ["Rallypoint System" module](./modules.html#1.14-rallypoint-system) are able to move the rallypoint.

<div class="panel callout">
    <h5>Note:</h5>
    <p>It's important to mention that this doesn't work for player who join during a mission (JIP = Join in progress). That's something we can't change because that's the way Bohemia has implemented their module framework.</p>
</div>

To enable other units to move them add this to the unit's initialization code:

```c++
_unit setVariable ["ACE_canMoveRallypoint", true, true];
```

## 2. ACE SwitchUnits
*Part of: ace_switchunits*

"ACE SwitchUnits" is a tool for misson makers to quickly add PvP (Player vs. Player) elements to a mission. In short it enables a player to control AI units. Allowing players to perform as enemies even during a COOP mission increases the authenticity of the enemy and thus the immersion for everyone.

The most prominent feature of ACE SwitchUnits is that you can add it to nearly every existing mission and get AI control out of the box. Dynamic mission like "Enemy Assault", "Patrol Ops", "Invade & Annex", etc. don't need to be touched to make all random spawned AI's controllable.

In its current form you're able to switch to infantry (vehicles, etc. are planned) from all four sides (West, East, Independent, Civilian).

To enable a player to control AI add the following to its init line:

```c++
this setVariable ["ACE_CanSwitchUnits", true];
```
Once this player spawns, all controllable AI will be marked on his map and he'll be able to click on the map to switch to this unit. The initial unit will be prone to damage, but has no equipment and can't run. So it would be wise to hide or move this unit far from other players.

The [module settings](./modules.html#1.16-switchunits-system) define which side a player can control or how big the radius of the safe zone is. The safe zone is a circular zone around AI units that must be clear from players of an opposing side to be able to switch to.