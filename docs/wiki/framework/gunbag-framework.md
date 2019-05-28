---
layout: wiki
title: Gunbag Framework
description: Explains how to set-up gunbags
group: framework
parent: wiki
order: 7
mod: ace
version:
  major: 3
  minor: 13
  patch: 0
---

## 1. Overview

ACE provides a gunbag thing that you can put any gun inside.


## 2. Config Values

The config entry `ace_gunbag` needs to be set to 1 to enable a backback to be a gunbag

```cpp
class Bag_Base;
class ace_gunbag: Bag_Base {
    _generalMacro = QUOTE(ADDON);
    author = "Ir0n1E";
    scope = 2;
    displayName = CSTRING(Displayname);
    model = QPATHTOF(data\ace_gunbag.p3d);
    picture = QPATHTOF(ui\gunbag_ca.paa);
    icon = QPATHTOF(ui\gunbag_icon_ca.paa);
    hiddenSelections[] = {"Camo", "insignia"};
    hiddenSelectionsTextures[] = {QPATHTOF(data\gunbag_co.paa)};
    maximumLoad = 80;
    mass = 11;
    ace_gunbag = 1;
};
```
