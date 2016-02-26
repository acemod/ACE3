---
layout: wiki
title: Rearm
description: Adds the option to rearm vehicles
group: feature
category: interaction
parent: wiki
---

## 1. Overview

This adds the option to rearm vehicles.

## 2. Usage

### 2.1 Rearming a vehicle with setting `Entire vehicle`
- Interact with the ammo truck <kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Interact Key`).
- Select the vehicle from the list. It takes a few seconds to rearm the vehicle.

### 2.2 Rearming a vehicle with setting `Entire Magazine`
- Interact with the ammo truck <kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Interact Key`).
- Select the vehicle and the magazine from the list. You will pick up an ammo box.
- Walk to the vehicle and interact with it.
- Select `Rearm`. You will rearm the vehicle.

### 2.3 Rearming a vehicle with setting `Amount based on caliber`
It's the same process as with setting `Entire Magazine`, but you will have to do more carrying.

| Caliber in mm            |   6 |   7 |   8 |  13 | 19 | 20 | 25 | 30 | 35 | 39 | 40 | 60 | 70 | 80 | 82 | 100 | 105 | 120 | 122 | 125 | 155 | 230 | 250 |
|--------------------------|-----|-----|-----|-----|----|----|----|----|----|----|----|----|----|----|----|-----|-----|-----|-----|-----|-----|-----|-----|
| Number of rounds per box | 500 | 500 | 400 | 100 | 50 | 50 | 40 | 25 | 34 | 24 | 10 |  2 |  2 |  2 |  2 |   1 |   1 |   1 |   1 |   1 |   1 |   1 |   1 |

So to fully rearm 2000 rounds of 7.62mm machine gun, you need four ammo boxes.

## 3. FAQ

### Can I drop the ammo box?
Yes, using the action menu.

### I dropped the ammo box. Can I pick it up?
Yes, using the interact menu <kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Interact Key`).

### I'm carrying something else. What's wrong?
Some objects, especially missiles and bombs, have proper static 3-D models which replace the ammo box.

### Does rearm work with vehicles from mods?
Yes, if the vehicle has the correct config entries or uses inheritance from vanilla ammo. Otherwise there is a compatibility mode.

## 4. Dependencies

`ace_interaction`
