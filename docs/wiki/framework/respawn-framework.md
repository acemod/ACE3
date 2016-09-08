---
layout: wiki
title: Respawn Framework
description: Explains how to set-up the rally points.
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

Rallypoints is a two way teleport system between two positions. Usually this is used to transport units that have died during a mission back to the front line. The rally points are portrayed by flagpoles (West, East and Independant flagpoles are available) that have a "Base" and an "Exit" version.


## 2. Mission Setup

Rallypoints can be found in the editor under: "Empty" >> "ACE Respawn"

**Class Names:**

- `ACE_Rallypoint_West`, `ACE_Rallypoint_West_Base`
- `ACE_Rallypoint_East`, `ACE_Rallypoint_East_Base`
- `ACE_Rallypoint_Independent`, `ACE_Rallypoint_Independent_Base`

Using the Interaction Menu on a rally point offers the ability to teleport from one flagpole to the other flagpole and vice versa.

*Note: You can't place more than one rallypoint of the same type.*

All units synced to the "Rallypoint System" are able to move the rallypoint.

<div class="panel callout">
    <h5>Note:</h5>
    <p>It's important to mention that this doesn't work for player who join during a mission (JIP = Join in progress). That's something we can't change because that's the way Bohemia Interactive has implemented their module framework.</p>
</div>

To enable other units to move them reference [Scripting](#allow-units-to-move-rally-points) section.


## 3. Scripting

### 3.1 Change Flag Texture

To change the texture of the flag use the following line on the rally point object:

```js
this setFlagTexture 'path\to\my\texture\my_awesome_clan_logo.paa';
```

### 3.2 Allow Units to Move Rally Points

To enable other units to move rally points, such as JIP units, use the following line on the units:

```js
_unit setVariable ["ACE_canMoveRallypoint", true, true];
```
