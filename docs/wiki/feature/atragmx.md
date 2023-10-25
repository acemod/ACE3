---
layout: wiki
title: ATragMX
component: atragmx
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

- [Advanced Ballistics enabled]({{ site.baseurl }}/wiki/feature/advanced-ballistics.html)


## 3. Usage

### 3.1 Opening the AtragMx

#### 3.1.1 Interaction Menu

- Open the self interaction menu <kbd>Ctrl</kbd> + <kbd>⊞&nbsp;Win</kbd>
- Select `Equipment`
- Select `Open AtragMx`

#### 3.1.2 Custom key

- `OPTIONS` / `CONTROLS` / `CONFIGURE ADDONS` / `ACE3 Equipment`

### 3.2 Example with M14 and default 7.62mm 20Rnd Mag

**Start of the mission:**

- Open the [Range Card]({{ site.baseurl }}/wiki/feature/rangecard.html) and check the ammunition: bullet diameter, bullet weight, rifle twist, muzzle velocity at 15°C, zeroed distance and bore height.

<img src="{{ site.baseurl }}/img/wiki/feature/atragmx1.webp" width="1400" height="600" alt="Range card" /> 

- Open the AtragMx and the `Atmsphr` column, select `Default` and `Done`.
- `Open Gun` the 7.62x51mm M80 in the `GunList`.
- Select `E` (English unit) at the top right.
- Open the `Gun` column, check and update the `Bore (inches)`, `Bullet Weight (grains)`, `Bullet Diam (inches)`, `Rifle Twist (in/trn)` and `Done`.
- Select `M` (Metric unit) at the top right.
- Open the `Gun` column, check and update the `Muzzle Velocity (m/s)`, the `Zero Range (meters)` and `Done`. 
- *Muzzle Velocities (`Options` / `Muz Vel table`) may need a manual update according to the range card.*
- *More information about C1: [Example with `Add New Gun` in `GunList`](#35-example-with-add-new-gun-in-gunlist).*
- Optionally, `Save Gun` and `Done` in the `GunList`.
 
**In position:**

- Update the `Atmsphr` column and `Done`. Basic tool needed: [Kestrel 4500]({{ site.baseurl }}/wiki/feature/kestrel4500.html).
- *Check the new `Muzzle Velocity` in the `Gun` column.*
- Update the `Target` column and `Done`. Basic tools needed: [wind arrow]({{ site.baseurl }}/wiki/feature/weather.html), [Protractor]({{ site.baseurl }}/wiki/feature/advanced-ballistics#22-protractor.html), [Map Tools]({{ site.baseurl }}/wiki/feature/maptools.html). For advanced tools: [ACE3 Equipments]({{ site.baseurl }}/wiki/feature.html)
- `Latitude`: *The latitude for all common maps can be found in the [ACE3 Github]({{ site.ace.githubUrl }}/blob/master/addons/common/functions/fnc_getMapData.sqf) or the Eden Editor's Extended Debug Console: Watch `ace_common_maplatitude`.*
- `Dir of Fire (deg from N)`: *The value is therefore given as the direction of the barrel axis from true north.* (Horus manual p.14)
- `Wind speed (m/s)`: *Two wind speed values (low and high) may be entered on the target screen,[...] Lead/Wind2 button on the screen.* (Horus manual p.32)
- `Wind Direction (clock)`: *[...], wind is always described in terms of where it is coming from.* (Horus manual p.16)
- `Inclination Angle`: *The degrees field is marked with a “d” and the cosine field with a “c”.* (Horus manual p.33)
- `Target Speed`: *Target Speed Assist* (Horus manual p.21)
- `Target Range (meters)`: *Parameter Limits: 25 - 3700 meters.* (Horus manual p.17)
- Apply vertical and horizontal elevations to the [scope]({{ site.baseurl }}/wiki/feature/scopes.html).
- Hold Breath (Left Shift as default) and Fire (Prim. Mouse. Btn. as default). 
 
### 3.3 Example with Truing tool

- Open the `Truing Drop` in the `Options` menu.
- Add the actual `Target Range` in the `SUPER` column and `Calc`.
- Add the same `Target Range` in the `SUB` column  and `Calc`.
- Apply the actual scope elevation in the `Drop` field and `Calc`.
- `Accept` the new `C1`, `Gun` column and `Elev` are updated.
- *The Drag Coefficient Table will be automatically updated.*
- Optionally, `Save Gun` and `Done` in the `GunList`.
 
<img src="{{ site.baseurl }}/img/wiki/feature/atragmx2.webp" width="1127" height="600" alt="Calculation" />
 
- If a new `Target Range` is applied in the `Target` column, the ballistic coefficient `C1` and the elevation `Elev` will be automatically recalculated.
 
<img src="{{ site.baseurl }}/img/wiki/feature/atragmx31.webp" width="1123" height="600" alt="Interpolation" />

<img src="{{ site.baseurl }}/img/wiki/feature/atragmx31a.webp" width="1123" height="600" alt="Extrapolation" />

### 3.4 Example with overwritten zero distance

- The `Default zero distance` can be overwritten with the [Scopes Options]({{ site.baseurl }}/wiki/feature/scopes.html), the [Scopes Framework]({{ site.baseurl }}/wiki/framework/scopes-framework.html) or the [CBA Settings System](https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System).
- In this case, the [Range Card]({{ site.baseurl }}/wiki/feature/rangecard.html) will be automatically updated, **NOT the AtragMx**.
- Open the AtragMx and the `Atmsphr` column, select `Default` and `Done`.
- Open the `Gun` column, check and update the `Zero Range` and `Done`.
 
<img src="{{ site.baseurl }}/img/wiki/feature/atragmx41.webp" width="1400" height="600" alt="Zero distance 300m" />

### 3.5 Example with `Add New Gun` in `GunList`

- Open the [Range Card]({{ site.baseurl }}/wiki/feature/rangecard.html) and check the ammunition: **bullet Class Name**, bullet diameter, bullet weight, rifle twist, muzzle velocities, zeroed distance and bore height.
- Open the AtragMx and the `Atmsphr` column, select `Default` and `Done`.
- Select `Add New Gun` in the `GunList`.
- Add a `New Gun Name` and `Open Gun`.
- Select `E` (English unit) at the top right.
- Open the `Gun` column, check and update the `Bore (inches)`, `Bullet Weight (grains)`, `Bullet Diam (inches)`, `Rifle Twist (in/trn)` and `Done`.
- Select `M` (Metric unit) at the top right.
- Open the `Gun` column, check and update the `Zero Range (meters)` and `Done`. 
- Open the `Muz Vel Table` in the `Options` menu or click on `MV` in the `Gun` column. 
- Edit manually the `Muzzle Velocity Table` according to the [Range Card]({{ site.baseurl }}/wiki/feature/rangecard.html) and `Done`.
- The `C1 coefficient` of the bullet can be found with the Eden Editor `Config Viewer`:

> configfile >> "CfgAmmo" >> "**bullet Class Name**" >> "ACE_ballisticCoefficients"

> configfile >> "CfgAmmo" >> "**bullet Class Name**" >> "ACE_dragModel"

- *The AtragMx accepts only **G1 ballistic coefficient**.*
- *G7 ballistic coefficient can be converted, for example, with the online [JBM Ballistics Calculators](http://www.jbmballistics.com/cgi-bin/jbmgf-5.1.cgi)*.
- *For a better accuracy, a Ballistic Coefficient vs. Distance Interpolation table can be used: `Options` / `Drag Coef Table` (Horus manual p.22)*
- Optionally, `Save Gun` and `Done` in the `GunList`.


> Note: The ballistic coefficient can be calculated by using the [360 Degree Training Course mission](https://forums.bistudio.com/forums/topic/171228-sp-360-degree-training-course/) as a chronograph at different distances and [JBM Ballistics Calculators](http://www.jbmballistics.com/cgi-bin/jbmbcv-5.1.cgi) for example, an another ballistic software at your own convenience, or the [AtragMx Truing Tool](#33-example-with-truing-tool).

> Example direct conversion with .408 Cheytac 305 grains G7 BC 0.279 at 2000 meters 15°C:

<img src="{{ site.baseurl }}/img/wiki/feature/atragmx5.webp" width="1400" height="600" alt="Conversion G7/G1 BC" />

### 3.6 Adding ATragMX Presets

- [ATragMX Framework]({{ site.baseurl }}/wiki/framework/atragmx.html)

### 3.7 Reseting AtragMx `GunList`

- Open the Eden Editor and the Extended Debug Console (Ctrl+D).
- Execute `call ace_atragmx_fnc_clear_user_data` or `call ace_atragmx_fnc_initGunList` (LOCAL EXEC).
- The original ACE3 `GunList` will be restored (all `Add New Gun` entries deleted).

### 3.8 Example with AtragMx and default ballistic

> Note: ACE3 has two ballistics: the vanilla default ballistic (enabled as default) and the [Advanced Ballistics]({{ site.baseurl }}/wiki/feature/advanced-ballistics.html) (must be enabled).
The ACE3 default ballistic doesn't take atmospheric conditions, powder temperature, rifle twist and Earth effects into account.
The AtragMx will need for `Gun` column: `Bore`, `C1 Coefficient`, `Muzzle Velocity` and `Zero Range`. With `Target` column, `Latitude` and `Dir of Fire` are useless. `Atmsphr` column mustn't be updated.

**Start of the mission:**

- Open the [Range Card]({{ site.baseurl }}/wiki/feature/rangecard.html) and check the ammunition: **bullet Class Name**, muzzle velocity, zeroed distance and bore height.
- Open the AtragMx and the `Atmsphr` column, select `Default` and `Done`.
- Select `E` (English unit) at the top right.
- Open the `Gun` column, check and update the `Bore (inches)` and `Done`.
- Select `M` (Metric unit) at the top right.
- Open the `Gun` column, check and update the `Muzzle Velocity (m/s)`, the `Zero Range (meters)` and `Done`. 
- `C1 coefficient` of the bullet = `airFriction x -1000`.
- `airFriction` can be found with the Eden Editor `Config Viewer`:

> configfile >> "CfgAmmo" >> "**bullet Class Name**" >> "airFriction"

- *AtragMx is configured with `C1 coefficient` according to vanilla weapons in `GunList`.*
- Optionally, `Save Gun` and `Done` in the `GunList`.
 
**In position:**

- Update the `Target` column and `Done`. Basic tools needed: [wind arrow]({{ site.baseurl }}/wiki/feature/weather.html), [Protractor]({{ site.baseurl }}/wiki/feature/advanced-ballistics#22-protractor.html), [Map Tools]({{ site.baseurl }}/wiki/feature/maptools.html). For advanced tools: [ACE3 Equipments]({{ site.baseurl }}/wiki/feature.html)
- `Wind speed (m/s)`: *Two wind speed values (low and high) may be entered on the target screen,[...] Lead/Wind2 button on the screen.* (Horus manual p.32)
- `Wind Direction (clock)`: *[...], wind is always described in terms of where it is coming from.* (Horus manual p.16)
- `Inclination Angle`: *The degrees field is marked with a “d” and the cosine field with a “c”.* (Horus manual p.33)
- `Target Speed`: *Target Speed Assist* (Horus manual p.21)
- `Target Range (meters)`: *Parameter Limits: 25 - 3700 meters.* (Horus manual p.17)
- Apply vertical and horizontal elevations to the [scope]({{ site.baseurl }}/wiki/feature/scopes.html).
- Hold Breath (Left Shift as default) and Fire (Prim. Mouse. Btn. as default). 

## 4. Official References

- [Official Manual]({{ site.ace.githubUrl }}/blob/master/extras/manual_Horus_ATrag-v385.pdf)
