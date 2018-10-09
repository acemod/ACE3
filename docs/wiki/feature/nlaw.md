---
layout: wiki
title: NLAW
description: NLAW
group: feature
category: equipment
parent: wiki
mod: ace
version:
  major: 3
  minor: 10
  patch: 0
---

## 1. Overview

### 1.1 Guidance
NLAW uses Predicted Line Of Sight guidance.
Before firing the shooter tracks the targets for several seconds.
This programs the missile with the angular rotation and allows it to fly a curved path that will hit the target.
It will also correct for gravity drop.

### 1.2 Attack profiles
- Direct - Normal impact fuze for non-armored targets. Note that the missile's shaped charge is aimed downards, so this mode is not recomended against armor.
- Overfly Top Attack - Flies high and when sensors detects a target below it triggers the shaped charge to fire downards into the weak top armor.

## 2. Usage
- Cycle attack profiles with the missile guidance "Cycle Fire Mode" keybind (default: <kbd>Ctrl</kbd> + <kbd>Tab</kbd>)
- Start tracking by pressing and holding the "NLAW Track Target" keybind (default: <kbd>Tab</kbd>)
- While holding the key down track the target for 2-3 seconds and fire.
- Can also be fired against static targets without tracking.

## 3. Dependencies

{% include dependencies_list.md component="nlaw" %}
