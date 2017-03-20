---
layout: wiki
title: ATragMX
description: Handheld ballistics calculator.
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

### 1.1 AtragMx from Horus Vision

Horus ATragMX software considers atmospheric conditions, gun data, ammunition, range, speed and muzzle velocity to calculate precise aiming solutions with "come-up" results – and even accounts for Coriolis and spin drift effects. ATragMX, loaded on a handheld computer made by TDS Recon, is easy to use and lightning-fast. The Recon meets the rigorous MIL-STD-810F military standard for drops, vibration, humidity, altitude and extreme temperatures.

## 2. Usage

### 2.1 Example with M14 and default 7.62mm 20Rnd Mag

**Start of the mission:**
 - Open the Range Card and check the cartridge, the zeroed distance, the rifle twist, the muzzle velocity at 15°C and the bore height.

<img src="{{ site.baseurl }}/img/wiki/feature/atragmx1.png" width="1400" height="600" alt="RangeCard" /> 

 - Open the AtragMx and the `Atmsphr` column, select `Default` and `Done`. (cf manual, p 15)
 - `Open Gun` the 7.62x51mm M80 in the `GunList`. (cf manual, p 25)
 - Select `E` (English unit) at the top right. (cf manual, p 10)
 - Open the `Gun` column, check and update the `Bore`, the `Rifle Twist` and `Done`.
 - Select `M` (Metric unit) at the top right.
 - Open the `Gun` column, check and update the `Muzzle Velocity`, the `Zero Range` and `Done`. 
 - *The Muzzle Velocity Table will be automatically updated.* (cf manual, p 22)
 - Optionally, `Save Gun` and `Done` in the `GunList`.
 
**In position:**
 - Update the `Atmsphr` column with the Kestrel and `Done`. (cf manual, p 15)
 - *Check the new `Muzzle Velocity` in the `Gun` column.*
 - Update the `Target` column. (cf manual, p 16, 30, 32, 33)
 - Apply the vertical and horizontal elevations on the scope.
 - Control the breath and press.
 
### 2.2 Example with Truing tool
 
**Start of the mission:**
 - Select `Drag Coef Table` in the `Options` menu. (cf manual, p 22)
 - Add the `ZR` and the `C1` (`Gun` column) in the table and `Done`.
  
**In position:**
 - Open the `Truing Drop` in the `Options` menu. (cf manual, p 23)
 - Add the actual `Target Range` in the `SUPER` column and `Calc`.
 - Add the same `Target Range` in the `SUB` column  and `Calc`.
 - Apply the actual scope elevation in the `Drop` field and `Calc`.
 - `Accept` the new `C1`, `Gun` column and `Elev` are updated.
 - *The Drag Coefficient Table will be automatically updated.*
 - Optionally, `Save Gun` and `Done` in the `GunList`.
 
 <img src="{{ site.baseurl }}/img/wiki/feature/atragmx2.png" width="1127" height="600" alt="Calculation" />
 
 - If a new `Target Range` is applied in the `Target` column, select `Drag Coef Table` in the `Options` menu and `Done`.
 - The ballistic coefficient `C1` and the elevation `Elev` will be recalculated.
 
 <img src="{{ site.baseurl }}/img/wiki/feature/atragmx3.png" width="1123" height="600" alt="Interpolation" />

### 2.3 Example with overwritten zero distance

 - The `Default zero distance` can be overwritten with the `Scopes module` or the `serverconfig.hpp`.
 - In this case, the Range Card will be automatically updated, NOT the AtragMx.
 - Open the `Gun` column, check and update the `Zero Range` and `Done`.
 
 <img src="{{ site.baseurl }}/img/wiki/feature/atragmx4.png" width="1400" height="600" alt="Default zero distance" />
 
## 3. Official Manual and Horus Videos
 
 - [Official Manual](https://github.com/acemod/ACE3/blob/master/extras/manual_Horus_ATrag-v385.pdf)
 - [Horus video part1](https://www.youtube.com/watch?v=pg6oqT5jVds)
 - [Horus video part2](https://www.youtube.com/watch?v=7SkRnbwoPmw)
 
## 4. Dependencies

{% include dependencies_list.md component="atragmx" %}
