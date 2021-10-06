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

Adds a probability to jam a weapon when firing. Jams can be cleared by reloading, using the clear jam-key, or using the self interaction menu.

### 1.2 Temperature simulation

Introduces weapon temperature simulation depending on weapon and bullet mass. Hot weapons are more prone to jamming and will have an increase in their cyclic rate of fire. Depending on weapon type the accuracy and in extreme cases the muzzle velocity might be reduced on high temperatures. Adds smoke puff and heat refraction effects to indicate this.

### 1.3 Cookoff

Hot weapons can also cause chambered ammunition to spontaneously ignite. The higher the temperature of the weapon the sooner a cookoff can happen. Open bolt weapons (most machineguns) cannot cookoff unless jammed. Jammed weapons will not cookoff unless the jam is a failure to fire.

### 1.4 Spare barrels

Adds the ability to changes barrels on machine guns to compensate for those effects. Changing the barrel can also unjam the gun.

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

### 2.4 Cooling your weapon

- Weapons and spare barrels will cool off over time.
- Cooling speed of weapons in increased in windy or rainy weather, and when swimming.
- If AceX Field Rations is loaded then weapons can be cooled with canteens, water bottles, or other beverage items. This does not require the Field Rations system to be enabled.
- If AceX Field Rations is enabled then weapons can also be cooled with the same water sources used to refill canteens and water bottles.

### 2.5 Avoiding cookoffs

- After a firefight unload closed bolt firearms (most rifles) until the barrel temperature has gone down to less than 180°C (two sections or less on the bar).
- Clear failure to fire jams quickly

## 3. Dependencies

{% include dependencies_list.md component="overheating" %}
