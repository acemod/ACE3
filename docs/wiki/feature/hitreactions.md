---
layout: wiki
title: Hit Reactions
component: hitreactions
description: Reactions when getting shot.
group: feature
category: realism
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Overview

### 1.1 Falling under fire
If a unit is shot while running it falls to the ground in a prone position, the area where the shot lands does not matters.
Note that the shot needs to inflict a certain amount of damage to make the unit fall, a small cut won't make the unit stumble. This can be disabled per-unit by setting "ace_hitreactions_allowFallDown" to false on the unit.

### 1.2 Weapon dropping
If a unit's arm is shot it will cause the gun to be dropped based on the chance set. The default is 0.
