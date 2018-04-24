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


## 2. Requirement

- [Advanced Ballistics module enabled]({{ site.baseurl }}/wiki/feature/advanced-ballistics.html)


## 3. Usage

### 3.1 Opening the AtragMx

#### 3.1.1 Interaction Menu

- Open the self interaction menu <kbd>Ctrl</kbd> + <kbd>⊞&nbsp;Win</kbd>
- Select `Equipment`
- Select `Open AtragMx`

#### 3.1.2 Custom key

- `OPTIONS` / `CONTROLS` / `CONFIGURE ADDONS` / `ACE3 Equipment`

#### 3.1.3 Inventory

<img src="{{ site.baseurl }}/img/wiki/feature/abtools_inventory.png" width="900" height="450" alt="Inventory management" />

### 3.2 Example with M14 and default 7.62mm 20Rnd Mag

**Start of the mission:**

- Open the [Range Card]({{ site.baseurl }}/wiki/feature/rangecard.html) and check the cartridge, the zeroed distance, the rifle twist, the muzzle velocity at 15°C and the bore height.

<img src="{{ site.baseurl }}/img/wiki/feature/atragmx1.png" width="1400" height="600" alt="Range card" /> 

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

- Update the `Atmsphr` column with the [Kestrel 4500]({{ site.baseurl }}/wiki/feature/kestrel4500.html) and `Done`.
- *Check the new `Muzzle Velocity` in the `Gun` column.*
- Update the `Target` column (the [wind arrow]({{ site.baseurl }}/wiki/feature/weather.html) will also help). [[1]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=16) [[2]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=30) [[3]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=32) [[4]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=33)
- *The latitude for all common maps can be found in the [ACE3 Github]({{ site.ace.githubUrl }}/blob/master/addons/common/functions/fnc_getMapData.sqf).*
- Apply the vertical and horizontal elevations on the [scope]({{ site.baseurl }}/wiki/feature/scopes.html).
- Control the breath and press.
 
### 3.3 Example with Truing tool

- Open the `Truing Drop` in the `Options` menu. [[Manual]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=23)
- Add the actual `Target Range` in the `SUPER` column and `Calc`.
- Add the same `Target Range` in the `SUB` column  and `Calc`.
- Apply the actual scope elevation in the `Drop` field and `Calc`.
- `Accept` the new `C1`, `Gun` column and `Elev` are updated.
- *The Drag Coefficient Table will be automatically updated.* [[Manual]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=22)
- Optionally, `Save Gun` and `Done` in the `GunList`.
 
<img src="{{ site.baseurl }}/img/wiki/feature/atragmx2.png" width="1127" height="600" alt="Calculation" />
 
- If a new `Target Range` is applied in the `Target` column, the ballistic coefficient `C1` and the elevation `Elev` will be automatically recalculated.
 
<img src="{{ site.baseurl }}/img/wiki/feature/atragmx31.png" width="1123" height="600" alt="Interpolation" />

<img src="{{ site.baseurl }}/img/wiki/feature/atragmx31a.png" width="1123" height="600" alt="Extrapolation" />

### 3.4 Example with overwritten zero distance

- The `Default zero distance` can be overwritten with the [Scopes module]({{ site.baseurl }}/wiki/feature/scopes.html), the [Scopes Framework]({{ site.baseurl }}/wiki/framework/scopes-framework.html) or the [CBA Settings System](https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System).
- In this case, the [Range Card]({{ site.baseurl }}/wiki/feature/rangecard.html) will be automatically updated, NOT the AtragMx.
- Open the AtragMx and the `Atmsphr` column, select `Default` and `Done`. [[Manual]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=15)
- Open the `Gun` column, check and update the `Zero Range` and `Done`.
 
<img src="{{ site.baseurl }}/img/wiki/feature/atragmx41.png" width="1400" height="600" alt="Zero distance 300m" />

### 3.5 Example with `Add New Gun` in `GunList`

- Open the [Range Card]({{ site.baseurl }}/wiki/feature/rangecard.html) and check the bullet diameter, the bullet weight, the **(bullet Class Name)** and the muzzle velocities.
- Open the AtragMx and the `Atmsphr` column, select `Default` and `Done`. [[Manual]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=15)
- Select `Add New Gun` in the `GunList`. [[Manual]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=25)
- Add a `New Gun Name` and `Open Gun`.
- Select `E` (English unit) at the top right. [[Manual]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=10)
- Open the `Gun` column, check and update the `Bullet Weight (grains)`, the `Bullet Diam (inches)` and `Done`.
- Select `M` (Metric unit) at the top right.
- Open the `Muz Vel Table` in the `Options` menu or click on `MV` in the `Gun` column. 
- Edit manually the `Muzzle Velocity Table` according with the [Range Card]({{ site.baseurl }}/wiki/feature/rangecard.html) and `Done`. [[Manual]](https://horusvision.com/download/manual_Horus_ATrag-v385.pdf#page=22)
- The `C1 coefficient` of the bullet can be found with the Eden Editor `Config Viewer`:

> configfile >> "CfgAmmo" >> "**bullet Class Name**" >> "ACE_ballisticCoefficients"

> configfile >> "CfgAmmo" >> "**bullet Class Name**" >> "ACE_dragModel"

- *The AtragMx accepts only **G1 ballistic coefficient**.*
- *G7 ballistic coefficient can be converted, for example, with the online [JBM Ballistics Calculators](http://www.jbmballistics.com/cgi-bin/jbmgf-5.1.cgi)*.
- Optionally, `Save Gun` and `Done` in the `GunList`.


> Note: The ballistic coefficient can be calculated by using the [360 Degree Training Course mission](https://forums.bistudio.com/forums/topic/171228-sp-360-degree-training-course/) as a chronograph at different distances and [JBM Ballistics Calculators](http://www.jbmballistics.com/cgi-bin/jbmbcv-5.1.cgi) for example, an another ballistic software at your own convenience, or the [AtragMx Truing Tool](#33-example-with-truing-tool).

> Example direct conversion with .408 Cheytac 305 grains G7 BC 0.279 at 2000 meters 15°C:

<img src="{{ site.baseurl }}/img/wiki/feature/atragmx5.png" width="1400" height="600" alt="Conversion G7/G1 BC" />

### 3.6 Adding ATragMX Presets

- [ATragMX Framework]({{ site.baseurl }}/wiki/framework/atragmx.html)

 
## 4. Official Manual and Horus Videos

- [Official Manual]({{ site.ace.githubUrl }}/blob/master/extras/manual_Horus_ATrag-v385.pdf)
- [Horus video part1](https://www.youtube.com/watch?v=pg6oqT5jVds)
- [Horus video part2](https://www.youtube.com/watch?v=7SkRnbwoPmw)


## 5. Dependencies

{% include dependencies_list.md component="atragmx" %}
