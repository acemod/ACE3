---
layout: wiki
title: Fire
description: Ignite things and people.
group: feature
category: realism
parent: wiki
mod: ace
version:
  major: 3
  minor: 14
  patch: 0
---

## 1. Overview

This module implements the ability to light people and objects on fire, and have it spread. When enabled alongside Vehicle Damage, cooking off vehicle will ignite its occupants.

Fire will burn you and cause intense pain. If on fire, you can stop, drop, and roll to try and extinguish it. When in rain or under water you are put out quicker. This also adds an interaction to pat people out if they are on fire

## 2. Addon Options

### 2.1 Enable

- Enables/Disables the fire simulation
- Default: On

### 2.2 Creates fire-flare at night

- Enables/Disables whether or not to spawn a flare-light on the person on fire. Can be a bit gaudy at night
- Default: Off

## 4. Dependencies

{% include dependencies_list.md component="vehicle_damage" %}
