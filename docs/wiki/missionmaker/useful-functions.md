---
layout: wiki
title: Useful Functions
description: A brief overview of ACE3 functions that could be useful for mission makers
group: missionmaker
order: 12
parent: wiki
---

## 1. Explosives

### 1.1 Scripted Explosions

#### ace_explosives_fnc_scriptedExplosion
`added in 3.5.0`

Function to detonate a list of editor-placed explosives objects, for use with mission triggers or scripts.

**Parameters**

1. An array of explosive objects to detonate
2. <Optional> Delay before explosives are detonated in seconds. If the number is negative, the delay will be randomized up to the number given. Default 0.

**Return value**

* None.

**Examples**

```cpp
[[charge1, charge2, charge3], -3] call ACE_Explosives_fnc_scriptedExplosive;

[[claymore1]] call ACE_Explosives_fnc_scriptedExplosive;
```

#### ace_explosives_fnc_connectExplosive
`added in 3.5.0`

Function to connect an editor-placed explosive to a unit's detonator. Can be used on players or AI, but AI can only detonate explosives tied to a dead man's switch by getting killed.

**Parameters**

1. Unit to connect to
2. Explosive object to connect
3. Detonator type to use, must be present on Unit. String of item class.

**Return value**

* None

**Examples**

```cpp
[player, claymore1, "ACE_Clacker"] call ace_explosives_fnc_connectExplosive

[triggerman, IED_4, "ACE_DeadManSwitch"] call ace_explosives_fnc_connectExplosive
```

## 2. Interaction Menu
Mission makers can add ace interaction menu actions via scripts.
Check out the [full guide in framework section](http://ace3mod.com/wiki/framework/interactionMenu-framework.html)

