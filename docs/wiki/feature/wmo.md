---
layout: wiki
title: Walkable Objects
component: wmo
description: Allows units to stand and walk on moving vehicles without sliding off.
group: feature
category: movement
parent: wiki
mod: ace
version:
  major: 3
  minor: 20
  patch: 0
---

## 1. Overview

### 1.1 Standing on moving vehicles

Without this component the engine slides units off anything that moves, so riding on
the roof of a truck or the deck of a moving boat is not possible. Walkable Objects
anchors the unit to whatever it is standing on and carries it along, so units can walk
around on a vehicle while it drives.

Land vehicles, air vehicles and ships are supported by default. Other objects can be
opted in through config, see the
[framework documentation]({{ site.baseurl }}/wiki/framework/wmo-framework.html).

Getting on top of a vehicle in the first place is not part of this component. A
climbing or jumping mod is usually needed for that.

## 2. Usage

Walk onto a vehicle and stand on it. Nothing needs to be activated.

Collision with the vehicle you are standing on is disabled while anchored, so the
moving geometry does not push the unit off. It is restored on stepping away.

## 3. Dependencies

`ace_common`

## 4. Settings

Walkable Objects can be turned off entirely with the **Enable Walkable Objects**
setting. It is enabled by default, and is a global setting so mission makers can
disable it for everyone.

## 5. Notes

Parachutes and fast rope segments are deliberately excluded. Standing on a rope
prevents the unit from grabbing it, and standing on a canopy breaks the jump.
