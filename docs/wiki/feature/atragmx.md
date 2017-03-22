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


## 2. Requirements

- [Advanced Ballistics module enabled](https://ace3mod.com/wiki/feature/advanced-ballistics.html)
- [Weather](https://ace3mod.com/wiki/feature/weather.html)


## 3. Usage

### 3.1 Opening the AtragMx

#### 3.1.1 User interface
- Open the self interaction menu <kbd>Ctrl</kbd> + <kbd>⊞&nbsp;Win</kbd>
- Select `Equipment`
- Select `Open AtragMx`

#### 3.1.2 Custom key

#### 3.1.3 Inventory

### 3.2 Example with M14 and default 7.62mm 20Rnd Mag

**Start of the mission:**
- Open the [Range Card](https://ace3mod.com/wiki/feature/rangecard.html) and check the cartridge, the zeroed distance, the rifle twist, the muzzle velocity at 15°C and the bore height.
<img src="{{ site.baseurl }}/img/wiki/feature/atragmx1.png" width="1400" height="600" alt="RangeCard" /> 

- Open the AtragMx and the `Atmsphr` column, select `Default` and `Done`. [[Manual]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=15)
- `Open Gun` the 7.62x51mm M80 in the `GunList`. [[Manual]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=25)
- Select `E` (English unit) at the top right. [[Manual]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=10)
- Open the `Gun` column, check and update the `Bore`, the `Rifle Twist` and `Done`.
- Select `M` (Metric unit) at the top right.
- Open the `Gun` column, check and update the `Muzzle Velocity`, the `Zero Range` and `Done`. 
- *The Muzzle Velocity Table will be automatically updated.* [[Manual]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=22)
- *(Must be edited manually for specific cartridges according with the range card)*
- Optionally, `Save Gun` and `Done` in the `GunList`.
 
**In position:**
- Update the `Atmsphr` column with the [Kestrel 4500](https://ace3mod.com/wiki/feature/kestrel4500.html) and `Done`.
- *Check the new `Muzzle Velocity` in the `Gun` column.*
- Update the `Target` column. [[1]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=16) [[2]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=30) [[3]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=32) [[4]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=33)
- Apply the vertical and horizontal elevations on the [scope](https://ace3mod.com/wiki/feature/scopes.html).
- Control the breath and press.
 
### 3.3 Example with Truing tool
 
**Start of the mission:**
- Select `Drag Coef Table` in the `Options` menu.
- Add the `ZR` and the `C1` (`Gun` column) in the table and `Done`.
  
**In position:**
- Open the `Truing Drop` in the `Options` menu. [[Manual]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=23)
- Add the actual `Target Range` in the `SUPER` column and `Calc`.
- Add the same `Target Range` in the `SUB` column  and `Calc`.
- Apply the actual scope elevation in the `Drop` field and `Calc`.
- `Accept` the new `C1`, `Gun` column and `Elev` are updated.
- *The Drag Coefficient Table will be automatically updated.* [[Manual]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=22)
- Optionally, `Save Gun` and `Done` in the `GunList`.
 
<img src="{{ site.baseurl }}/img/wiki/feature/atragmx2.png" width="1127" height="600" alt="Calculation" />
 
- If a new `Target Range` is applied in the `Target` column, select `Drag Coef Table` in the `Options` menu and `Done`.
- The ballistic coefficient `C1` and the elevation `Elev` will be recalculated.
 
<img src="{{ site.baseurl }}/img/wiki/feature/atragmx3.png" width="1123" height="600" alt="Interpolation" />

### 3.4 Example with overwritten zero distance

- The `Default zero distance` can be overwritten with the `Scopes module` or the `serverconfig.hpp`.
- In this case, the Range Card will be automatically updated, NOT the AtragMx.
- Open the `Gun` column, check and update the `Zero Range` and `Done`.
 
<img src="{{ site.baseurl }}/img/wiki/feature/atragmx4.png" width="1400" height="600" alt="Default zero distance" />

 
## 4. Official Manual and Horus Videos

- [Official Manual](https://github.com/acemod/ACE3/blob/master/extras/manual_Horus_ATrag-v385.pdf)
- [Horus video part1](https://www.youtube.com/watch?v=pg6oqT5jVds)
- [Horus video part2](https://www.youtube.com/watch?v=7SkRnbwoPmw)

## 5. Dependencies

{% include dependencies_list.md component="atragmx" %}
