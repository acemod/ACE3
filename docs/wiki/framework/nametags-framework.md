---
layout: wiki
title: Nametags Framework
description: Explains how to implement rank icons for factions.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 13
  patch: 0
---

## 1. Config Values

### 1.1 Faction rank icons

Defines the rank icons used by a faction.

```cpp
class CfgFactionClasses {
    class MyFaction {
        ace_nametags_rankIcons[] = {
            "\z\ace\addons\nametags\UI\icons_germany\private_gs.paa",       // path to private rank icon
            "\z\ace\addons\nametags\UI\icons_germany\corporal_gs.paa",      // path to corporal rank icon
            "\z\ace\addons\nametags\UI\icons_germany\sergeant_gs.paa",      // path to sergeant rank icon
            "\z\ace\addons\nametags\UI\icons_germany\lieutenant_gs.paa",    // path to lieutenant rank icon
            "\z\ace\addons\nametags\UI\icons_germany\captain_gs.paa",       // path to captain rank icon
            "\z\ace\addons\nametags\UI\icons_germany\major_gs.paa",         // path to major rank icon
            "\z\ace\addons\nametags\UI\icons_germany\colonel_gs.paa"        // path to colonel rank icon
        };
    };
};
```

## 2. Mission Variables

### 2.1 Faction rank icon usage

If disabled, it won't use the faction icons defined via the config entry listed above.
Needs to be set before postInit.
```sqf
ace_nametags_useFactionIcons = false; // by default true
```
