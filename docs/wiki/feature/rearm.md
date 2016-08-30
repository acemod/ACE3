---
layout: wiki
title: Rearm
description: Adds custom rearm system.
group: feature
category: interaction
parent: wiki
mod: ace
version:
  major: 3
  minor: 4
  patch: 0
---

## 1. Overview

This adds the option to rearm vehicles. The module settings allow you to configure ACE3 Rearm for both casual gaming and simulation game modes. Both the rearm speed and the availability of ammunition supply can be configured.


## 2. Rearming

### 2.1 Rearming a vehicle with setting `Entire vehicle`
- Interact with the ammo truck <kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Interact Key`).
- Move over `Rearm` and a list of vehicles within 20 meters that can be rearmed will be shown.
- Select the vehicle from the list. It takes a few seconds to rearm the vehicle.

### 2.2 Rearming a vehicle with setting `Entire Magazine`
- Interact with the ammo truck <kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Interact Key`).
- Move over `Take ammo` and a list of vehicles within 20 meters that can be rearmed will be shown.
- Select the vehicle and the magazine from the list. You will pick up an ammo box.
- Walk to the vehicle and interact with it.
- Select `Rearm`. You will rearm the magazine of the vehicle.

If a weapon carries multiple magazines of the same type, you have to repeat the procedure for every (partially) spent magazine.

### 2.3 Rearming a vehicle with setting `Amount based on caliber`
It's the same process as with setting `Entire Magazine`, but most magazines will require several ammo boxes.

| Caliber in mm            |   6 |   7 |   8 |  13 | 19 | 20 | 25 | 30 | 35 | 39 | 40 | 60 | 70 | 80 | 82 | 100 | 105 | 120 | 122 | 125 | 155 | 230 | 250 |
|--------------------------|-----|-----|-----|-----|----|----|----|----|----|----|----|----|----|----|----|-----|-----|-----|-----|-----|-----|-----|-----|
| Number of rounds per box | 500 | 500 | 400 | 100 | 50 | 50 | 40 | 25 | 34 | 24 | 10 |  2 |  2 |  2 |  2 |   1 |   1 |   1 |   1 |   1 |   1 |   1 |   1 |

The caliber of the weapon will be rounded to the nearest number and the number of rounds is calculated using the table above.
To fully rearm 2000 rounds of 7.62mm machine gun, you need five ammo boxes.


## 3. FAQ

### Can I drop the ammo box?
Yes, using the action menu.

### I dropped the ammo box. Can I pick it up?
Yes, using the interact menu <kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Interact Key`).

### We picked up to many ammo boxes. What shall we do?
When rearming with multiple people, you may pick up more ammo boxes than needed. You can return them using the `Store ammo` option. When using limited supply, returning unused ammo boxes will restore their supply.

### I'm carrying something - it's not an ammo box. What's wrong?
Nothing. Some objects, especially missiles and bombs, have proper static 3-D models which replace the ammo box.
Mod developers can use the framework to use their custom models as ammo box replacement.

### Does rearm work with vehicles from mods?
Yes, if the vehicle has the correct config entries or uses inheritance from vanilla ammo. Otherwise there is a compatibility mode.

### How do I replenish the ammunition supply on an ammo truck?
Please check the framework description for more details.

### The limited supply option `Only specific Magazines` doesn't work. What's wrong?
The mission creator has to use the framework to add specific magazines to the ammo truck(s). On this setting all ammo trucks are empty by default. For more information, please check the framework description.

## 5. Dependencies

{% include dependencies_list.md component="rearm" %}
