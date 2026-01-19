---
layout: wiki
title: KillTracker Framework
description: Explains how to set up the killtracker addon in missions
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 14
  patch: 0
---

## 1. Overview

The killtracker addon tracks deaths and kills, logging them to the end mission debriefing display. It shows detailed information from player kills using ACE Medical data via the `ace_killed` event.

**Important:** This addon requires config setup in your mission to function. It has no effect if the mission is not configured correctly.

## 2. Mission Setup

Include the killtracker configuration in your mission's `description.ext` file:

```cpp
class CfgDebriefingSections {
    #if __has_include("\z\ace\addons\killtracker\killtracker.inc")
        #include "\z\ace\addons\killtracker\killtracker.inc"
    #endif
};
```

This creates a debriefing section that will be displayed at the end mission debriefing screen, showing the kill tracking data.

## 3. Legacy ACEX Prefixes

The killtracker addon still uses some ACEX prefixes from its original implementation:

- Global Variable: `acex_killTracker_outputText`
- CfgDebriefingSections classname: `acex_killTracker`

These prefixes are maintained for backwards compatibility.

## 4. Setting kill array on player objects

It's possible to have ace set the out as a setVariable on every player's object.
This may be useful for things like a spectator system. Note both vars use `ace_` prefix.

```sqf
// ideally set this at preInit
missionNamespace setVariable ["ace_killtracker_globalSync", true];

 // access on any unit
_unit getVariable ["ace_killtracker_output", ""];
```
