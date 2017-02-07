---
layout: wiki
title: Mk6 Mortar
description: Improve the existing Mk6 Mortar.
group: feature
category: equipment
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Overview

### 1.1 Mk6 Mortar overhaul
ACE3 adds wind deflection for shells as well as a rangetable to accurately take out your target without the artillery computer. If ammunition handling is enabled, rounds must be loaded manually.


## 2. Usage

### 2.1 Switching charge
- Press <kbd>F</kbd> (Arma 3 default key bind `Fire Mode Switch`) to switch between charges

### 2.2 Opening the table
- Self interact <kbd>Ctrl</kbd> + <kbd>⊞&nbsp;Win</kbd>
- Select `Equipment`.
- Select `Open 82mm Rangetable`.

### 2.2 Getting your shells to land where you want.
For this you need a `82mm Rangetable`, `Map Tools` and a `Vector 21` are also recommended.


- Get the distance and elevation difference between you and the target (you can use map tools).
- Select the charge you want to use (0 = close / 1 = medium  / 2 = far).
- Open the `82mm Rangetable`
- Calculate the correct ELEV (elevation):
  - Open the `82mm Rangetable` and click on the charge you are using.
  - Find your range under the `RANGE` column
  - Under the `ELEV` column find the number that matches your range, that's the base elevation you are going to work with.
  - Under the `D ELEV for 100m DR` find the number that matches your ELEV and compensate:
     - _Example_, if you're 200m above your target multiply the number by 2 and add it to your ELEV.
     - If you're 200m below the target multiply the number by 2 and substract it to your ELEV.
     - The lower the elevation the closer to you it will land.
  - Once you finished calculating the ELEV align the barrel of the mortar with your target (directly looking at it) and set your ELEV to what you calculated by using <kbd>Page Up</kbd> and <kbd>Page Down</kbd>.
  - Once the ELEV is correctly set and the barrel is facing the right direction, shoot and enjoy your bananas while watching hell rain on your enemies.


### 2.3 Loading the mortar
You need the proper mortar magazines in your inventory.


- Interact with the mortar by pressing the interaction key <kbd>⊞&nbsp;Win</kbd> and looking near the muzzle.
- Select the `Load Mortar` action and then select the round type you want to load.
- If you want to unload the mortar without firing, interact near the muzzle again and select `Remove Round`. If there isn't space in your inventory for the round, it will be placed on the ground.

## 3. Dependencies

{% include dependencies_list.md component="mk6mortar" %}
