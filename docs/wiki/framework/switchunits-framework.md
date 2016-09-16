---
layout: wiki
title: Switch Units Framework
description: Explains how to set-up switch units.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Overview


Once this player spawns and [can switch units](#enable-player-ai-control), all controllable AI will be marked on his map and he'll be able to click on the map to switch to this unit. The initial unit will be prone to damage, but has no equipment and can't run. So it would be wise to hide or move this unit far from other players.

The module settings define which side a player can control or how big the radius of the safe zone is. The safe zone is a circular zone around AI units that must be clear from players of an opposing side to be able to switch to.


## 2. Scripting

### 2.1 Enable Player AI Control

To enable a player to control AI execute the following on it:

```js
this setVariable ["ACE_CanSwitchUnits", true];
```
