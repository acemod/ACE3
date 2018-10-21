---
layout: wiki
title: Respawn
description: Same gear on respawn, friendly fire message, rally points.
group: feature
category: interaction
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Overview

### 1.1 Respawn with same gear
Requires the Respawn Gear module to be placed. Respawned soldiers now have their loadout when killed.

### 1.2 Friendly Fire messages
Shows friendly fire warnings in system chat if the module is placed. Works even in higher difficulties where kill messages are normally disabled.

### 1.3 Rallypoints
Adds rallypoints to all 3 sides to enable teleportation from base spawn to FOB's. Requires some setup from the mission maker.


## 2. Usage

### 2.1 Using rallypoints
- For this to work pre-emptive preparations need to be made by the mission maker.
- Approach the rallypoint flagpole
- Use the interaction key <kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Interaction key`).
- Select teleport to (base / rallypoint).


## 3. Dependencies

{% include dependencies_list.md component="respawn" %}
