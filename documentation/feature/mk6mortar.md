---
layout: wiki
title: Mk6 Mortar
description: Improve the existing mk6 mortar.
group: feature
category: equipment
parent: wiki
---

## 1. Overview

### 1.1 mk6 mortar overhaul
ACE3 adds wind deflection for shells as well as a rangetable to accurately take out your target without the artillery computer.

## 2. Usage

### 2.1 Switching charge
- Press <kbd>F</kbd> (Arma 3 default key bind `Fire Mode Switch`) to switch between charges

### 2.2 Opening the table
- Self interact <kbd>Ctrl</kbd> + <kbd>⊞&nbsp;Win</kbd>
- Select `equipment`.
- Select `Open 82mm Rangetable`.

### 2.2 Getting your shells to land where you want.
For this you need a `82mm Rangetable`, `Map Tools` and a `Vector 21` are also recommended.


- Get the distance and elevation difference between you and the target for this you can use map tools.
- Select the charge you want to use (0 = close / 1 = medium  / 2 = far).
- Open the `82mm Rangetable`
- Calculate the correct ELEV (elevation):
  - Open the `Rangetable` and click on the charge you're using.
  - Find your range under the `RANGE` collumn
  - Under the `ELEV` collumn find the number that match your range, that's the base elevation you're going to work with.
  - Under the `D ELEV for 100m DR` find the number that match your ELEV and compensate:
     - Example, if you're 200m above your target multiply the number by 2 and add it to your ELEV.
     - If you're 200m below the target multiply the number by 2 and substract it to your ELEV.
     - The lower the elev the closer to you it will land.
  - Once you finished calculating the ELEV align the barrel of the mortar with your target (directly looking at it) and set your ELEV to what you calculated by using <kbd>Page Up</kbd> and <kbd>Page Down</kbd>.
  - Once the ELEV is correctly set and the barrel is facing the right direction, shoot and enjoy your bananas while watching hell rain on your enemies.  
## 3. Dependencies

`ace_interaction`
