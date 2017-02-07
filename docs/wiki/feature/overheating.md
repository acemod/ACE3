---
layout: wiki
title: Overheating
description: Weapon temperature and jamming, barrel swapping.
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

### 1.1 Weapon Jamming
Adds a probability to jam a weapon when firing. Jams can be cleared by reloading or by using the clear jam-key.

### 1.2 Temperature simulation
Introduces weapon temperature simulation depending on weapon and bullet mass. Hot weapons are more prone to jamming. Depending on weapon type the accuracy and in extreme cases the muzzle velocity might be reduced on high temperatures. Adds smoke puff and heat refraction effects to indicate this.

### 1.3 Spare barrels
Adds the ability to changes barrels on machine guns to compensate for those effects.


## 2. Usage

### 2.1 Clearing a jammed weapon
- To clear a jammed weapon, press <kbd>SHIFT</kbd> + <kbd>R</kbd> (ACE3 default key bind `Clear jam`).

### 2.2 Swapping barrels
- For this you need a `Spare barrel` and a compatible weapon.
- Press self interaction <kbd>Ctrl</kbd> + <kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Self Interaction Key`).
- Select `Equipment`.
- Select `Swap barrel`.

### 2.3 Checking your barrel temperature
- Press self interaction <kbd>Ctrl</kbd> + <kbd>⊞&nbsp;Win</kbd>.
- Select `Equipment`.
- Select `Check weapon temperature`.

**NOTE** When the bar is half full (yellow) it means the barrel is around 500°c.
Your weapon will be even more prone to jams, and it'll get worse if you don't let the barrel cool down or swap it.

## 3. Dependencies

{% include dependencies_list.md component="overheating" %}
