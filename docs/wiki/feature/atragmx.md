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

- Open the self interaction menu <kbd>Ctrl</kbd> + <kbd>⊞&nbsp;Win</kbd>.
- Select `Equipment`.
- Select `Open AtragMx`.

#### 3.1.2 Custom key

- `OPTIONS` / `CONTROLS` / `CONFIGURE ADDONS` / `ACE3 Equipment`

### 3.2 Example with M14 and default 7.62mm 20Rnd Mag

**Start of the mission:**

- Open the [Range Card]({{ site.baseurl }}/wiki/feature/rangecard.html) and check the ammunition: bullet diameter, bullet weight, rifle twist, muzzle velocity at 15°C, zeroed distance and bore height.

<img src="{{ site.baseurl }}/img/wiki/feature/atragmx1ab.webp" width="1400" height="600" alt="Range card" />

- Open the AtragMx and the `Atmsphr` column, select `Default` and `Done`.
- `Open Gun` the 7.62x51mm M80 in the `GunList`.
- Select `E` (English unit) at the top right.
- Open the `Gun` column, check and update the `Bore (inches)`, `Bullet Weight (grains)`, `Bullet Diam (inches)`, `Rifle Twist (in/trn)` and `Done`.
- Select `M` (Metric unit) at the top right.
- Open the `Gun` column, check and update the `Muzzle Velocity (m/s)`, the `Zero Range (meters)` and `Done`.
  - *Muzzle Velocities (`Options` / `Muz Vel table`) may need a manual update according to the range card.*
- Verify that the set `C1 Coefficient` (also referred to as G1) is that of the desired ammunition:
  - *It can be viewed in the ACE Arsenal as a magazine stat, or with a Config Viewer (both may list G7, which has to be converted to G1).*
  - *The AtragMx's `GunList` comes pre-configured with the `C1 coefficient` of vanilla weapons and their ammunitions.*
  - *More information about C1 and how to convert it: [Example with `Add New Gun` in `GunList`](#35-example-with-add-new-gun-in-gunlist).*
- Check `Elev` = 0 with `ZR` = `TR` *(if not, open `Gun` column and `Done`)*.
- Optionally, `Save Gun` and `Done` in the `GunList`.

**In position:**

- Update the `Atmsphr` column and `Done`. Requirement: [Kestrel 4500]({{ site.baseurl }}/wiki/feature/kestrel4500.html).
- *Check the new `Muzzle Velocity` in the `Gun` column.*
- Update the `Target` column and `Done`. Requirement: [Wind arrow]({{ site.baseurl }}/wiki/feature/weather.html), [Protractor]({{ site.baseurl }}/wiki/feature/advanced-ballistics#22-protractor), [Map Tools]({{ site.baseurl }}/wiki/feature/maptools.html). For advanced tools: [ACE3 Equipment]({{ site.baseurl }}/wiki/feature.html).
    - `Latitude`: *[ACE3 Github]({{ site.ace.githubUrl }}/blob/master/addons/common/functions/fnc_getMapData.sqf) or Eden Editor's Extended Debug Console: Watch:* `ace_common_maplatitude`.
    - `Dir of Fire (deg from N)`: *The value is therefore given as the direction of the barrel axis from true north.* [Horus manual p.14]
    - `Wind speed (m/s)`: *Two wind speed values (low and high) may be entered on the target screen,[...] Lead/Wind2 button on the screen.* [Horus manual p.32]
        - Wind takes into account geographic location, season, time of day, obstacles, altitude and surface roughness: [Wind Profile](https://wind-data.ch/tools/profile.php?lng=en).
    - `Wind Direction (clock)`: *Wind Direction is expressed in clock points.[...], wind is always described in terms of where it is coming from.* [Horus manual p.16]
    - `Inclination Angle`: *The degrees field is marked with a “d” and the cosine field with a “c”.* [Horus manual p.33]
    - `Target Speed`: *Target Speed Assist* [Horus manual p.21]
    - `Target Range (meters)`: *Parameter Limits minimum and maximum values: 25 - 3700 meters.* [Horus manual p.17]
- Apply vertical (Page Up and Down keys as default) and horizontal (Left Ctrl + Page Up and Down keys as default) elevations to the [scope]({{ site.baseurl }}/wiki/feature/scopes.html).
- Hold Breath (Left Shift as default) and Fire (Prim. Mouse. Btn. as default).

### 3.3 Example with Truing tool

> This process is called “Truing Drop”, or simply “Truing”. It involves taking 2 or 3 real flight data points (finding bullet drop at 2 or 3 places along its flight) and feeding it into the calculation parameters. [Horus manual p.23]

> The Truing Drop function is opened from ATrag’s main screen by selecting “Options” [...], then selecting “Truing Drop” from the menu that appears. [Horus manual p.23]

> With C1, you can also insert the new BC into the C1 table (with the target range value), or you can replace the C1 table with the following values:
> 1. first entry: Zero Range, original C1.
> 2. second entry: range at 75% of distance between transonic start and subsonic start, with original C1.
> 3. third entry: range 200 (y/m) beyond subsonic start, with new calculated C1. [Horus manual p.24]

- Basic example with ammunition 7.62x51mm G7 ballistic coefficient.
    - Open the AtragMx and the `Atmsphr` column, select `Default` and `Done`.
    - `Open Gun` a custom profile in the `GunList`.
    - *More information about custom profile: [Example with `Add New Gun` in `GunList`](#35-example-with-add-new-gun-in-gunlist).*
    - Check `Elev` = 0 with `ZR` = `TR` *(if not, open `Gun` column and `Done`)*.
    - Open the `Truing Drop` in the `Options` menu.
    - Add the actual `Target Range` in the `SUPER` column and `Calc`.
    - Add the same `Target Range` in the `SUB` column  and `Calc`.
    - Apply the actual scope elevation in the `Drop` field and `Calc`.
    - `Accept` the new `C1`, `Gun` column and `Elev` are updated.
    - *C1 Ballistic Coefficient vs. Distance Interpolation Table (`Options` / `Drag Coef Table`) will be updated.*
    - Optionally, `Save Gun` and `Done` in the `GunList`.

<img src="{{ site.baseurl }}/img/wiki/feature/atragmx2.webp" width="1127" height="600" alt="Calculation" />

- If a new `Target Range` is applied in the `Target` column, the ballistic coefficient `C1` and the elevation `Elev` will be recalculated.

<img src="{{ site.baseurl }}/img/wiki/feature/atragmx31.webp" width="1123" height="600" alt="Interpolation" />

<img src="{{ site.baseurl }}/img/wiki/feature/atragmx31a.webp" width="1123" height="600" alt="Extrapolation" />

### 3.4 Example with overwritten zero distance

- The `Default zero distance` can be overwritten with the [Scopes Options]({{ site.baseurl }}/wiki/feature/scopes.html), the [Scopes Framework]({{ site.baseurl }}/wiki/framework/scopes-framework.html) or the [CBA Settings System](https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System).
- In this case, the [Range Card]({{ site.baseurl }}/wiki/feature/rangecard.html) will be updated, **NOT the AtragMx**.
- Open the AtragMx and the `Atmsphr` column, select `Default` and `Done`.
- Open the `Gun` column, check and update the `Zero Range` and `Done`.
- Check `Elev` = 0 with `ZR` = `TR` *(if not, open `Gun` column and `Done`)*.
- Optionally, `Save Gun` and `Done` in the `GunList`.

<img src="{{ site.baseurl }}/img/wiki/feature/atragmx41.webp" width="1400" height="600" alt="Zero distance 300m" />

### 3.5 Example with `Add New Gun` in `GunList`

- Open the [Range Card]({{ site.baseurl }}/wiki/feature/rangecard.html) and check the ammunition's: **bullet Class Name**, bullet diameter, bullet weight, rifle twist, muzzle velocities, zeroed distance and bore height.
- Open the AtragMx and the `Atmsphr` column, select `Default` and `Done`.
- Select `Add New Gun` in the `GunList`.
- Add a `New Gun Name` and `Open Gun`.
- Select `E` (English unit) at the top right.
- Open the `Gun` column, check and update the `Bore (inches)`, `Bullet Weight (grains)`, `Bullet Diam (inches)`, `Rifle Twist (in/trn)` and `Done`.
- Select `M` (Metric unit) at the top right.
- Open the `Gun` column, check and update the `Zero Range (meters)` and `Done`.
- Open the `Muz Vel Table` in the `Options` menu or click on `MV` in the `Gun` column.
- Manually edit the `Muzzle Velocity Table` according to the [Range Card]({{ site.baseurl }}/wiki/feature/rangecard.html) and `Done`.
- Input the `C1 coefficient` (also referred to as G1) of the bullet, which can be found in two different ways:
  - in the ACE Arsenal, as a stat on a selected magazine that lists the bullet's ballistic coefficient and drag model (G1 can be used directly, while G7 requires conversion).
  - with the Eden Editor's or Debug Console's `Config Viewer`, which lists the BC and DM respectively, under the following paths:

> configfile >> "CfgAmmo" >> "**bullet Class Name**" >> "ACE_ballisticCoefficients"

> configfile >> "CfgAmmo" >> "**bullet Class Name**" >> "ACE_dragModel"

- Check `Elev` = 0 with `ZR` = `TR` *(if not, open `Gun` column and `Done`)*.
- Optionally, `Save Gun` and `Done` in the `GunList`.

> Note: The AtragMx accepts only **C1/G1 ballistic coefficient**. It can be calculated by using the [360 Degree Training Course mission](#5-resources) as a chronograph at different distances and [JBM Ballistics Calculators](http://www.jbmballistics.com/cgi-bin/jbmbcv-5.1.cgi) for example, another ballistic software at your own convenience, or the [AtragMx Truing Tool](#33-example-with-truing-tool).

> If only **G7 ballistic coefficient** is listed, it must be converted to G1, for example with the online [JBM Ballistics Calculators](http://www.jbmballistics.com/cgi-bin/jbmgf-5.1.cgi).

> Example direct conversion with .408 Cheytac 305 grains, G7 BC 0.279 at 2000 meters, ICAO conditions (15°C, 1013.25hPa, 0%):

<img src="{{ site.baseurl }}/img/wiki/feature/atragmx5.webp" width="1400" height="600" alt="Conversion G7/G1 BC" />

### 3.6 Connecting AtragMx with Vector 21 and DAGR

- Requirement: [Vector]({{ site.baseurl }}/wiki/feature/vector.html) and [DAGR]({{ site.baseurl }}/wiki/feature/dagr.html).
- Open the self interaction menu <kbd>Ctrl</kbd> + <kbd>⊞&nbsp;Win</kbd>.
- Select `Equipment`.
- Select `Configure DAGR` and `CONNECT TO` (DOWN and HELP/SEL) `Vector 21`(HELP/SEL).
- Equip and use the Vector (B key as default).
- Check target's [slope distance and azimuth]({{ site.baseurl }}/wiki/feature/vector#23-slope-distance-and-azimuth) (hold both R and Tab keys as default).
- Open the [AtragMx properly configured before](#32-example-with-m14-and-default-762mm-20rnd-mag) according to current rifle and ammunition.
- Open the `Target` column: `Dir of Fire (deg from N)`, `Inclination Angle` and `Target Range (meters)` updated with Vector's values.

### 3.7 Adding AtragMx Presets

- [AtragMx Framework]({{ site.baseurl }}/wiki/framework/atragmx.html)

> Scope Base Angle value:
> - Open the AtragMx and the `Atmsphr` column, select `Default` and `Done`.
> - `Open Gun` the custom profile (with an arbitrary scope base angle) in the `GunList`.
> - Check `Elev` value with `ZR` = `TR`.
> - Open the `Gun` column and `Done`.
> - Execute `copyToClipboard Str(ace_atragmx_workingMemory select 3);` [LOCAL EXEC] with the Eden Editor's Extended Debug Console.
> - Paste new value to the `preset`.
> - After new test, check `Elev` = 0 with `ZR` = `TR`.

### 3.7 Reseting AtragMx `GunList`

- Open the Eden Editor's Extended Debug Console.
- Execute `call ace_atragmx_fnc_clear_user_data` or `call ace_atragmx_fnc_initGunList` [LOCAL EXEC], (`RESTART` eventually needed).
- The original ACE3 `GunList` will be restored (all `Add New Gun` entries deleted).

### 3.8 Example with AtragMx and default ballistic (M14, 7.62mm 20Rnd Mag)

> Note: ACE3 has two external ballistics, the vanilla default ballistic (enabled as default) and the [Advanced Ballistics]({{ site.baseurl }}/wiki/feature/advanced-ballistics.html) (must be enabled). The ACE3 default ballistic doesn't take atmospheric conditions (except wind), powder temperature, rifle twist and Earth effects into account. The AtragMx will need for `Gun` column: `Bore`, `C1 Coefficient`, `Muzzle Velocity` and `Zero Range`. With `Target` column, `Latitude` and `Dir of Fire` are useless. `Atmsphr` column must not be updated.

**Start of the mission:**

- Open the [Range Card]({{ site.baseurl }}/wiki/feature/rangecard.html) and check the ammunition: **bullet Class Name**, muzzle velocity, zeroed distance and bore height.

<img src="{{ site.baseurl }}/img/wiki/feature/atragmx1db.webp" width="1400" height="600" alt="Range card" />

- Open the AtragMx and the `Atmsphr` column, select `Default` and `Done`.
- Select `E` (English unit) at the top right.
- Open the `Gun` column, check and update the `Bore (inches)` and `Done`.
- Select `M` (Metric unit) at the top right.
- Open the `Gun` column, check and update the `Muzzle Velocity (m/s)`, the `Zero Range (meters)` and `Done`.
- `C1 coefficient` of the bullet = `airFriction x -1000`.
- `airFriction` can be found with the Eden Editor `Config Viewer`:

> configfile >> "CfgAmmo" >> "**bullet Class Name**" >> "airFriction"

- *AtragMx is configured with `C1 coefficient` according to vanilla weapons and its ammunitions in `GunList`.*
- *Spin drift and Earth effects not taken into account, `Options` / `Show Coriolis` can be disabled.*
- Check `Elev` = 0 with `ZR` = `TR` *(if not, open `Gun` column and `Done`)*.
- Optionally, `Save Gun` and `Done` in the `GunList`.

**In position:**

- **Do not update the `Atmsphr` column.** Default ballistic doesn't take into account temperature, pressure and humidity.
- Update the `Target` column and `Done`. Requirement: [Wind arrow]({{ site.baseurl }}/wiki/feature/weather.html), [Protractor]({{ site.baseurl }}/wiki/feature/advanced-ballistics#22-protractor), [Map Tools]({{ site.baseurl }}/wiki/feature/maptools.html). For advanced tools: [ACE3 Equipment]({{ site.baseurl }}/wiki/feature.html).
    - `Wind speed (m/s)`: *Two wind speed values (low and high) may be entered on the target screen,[...] Lead/Wind2 button on the screen.* [Horus manual p.32]
        - Wind takes into account geographic location, season, time of day and obstacles.
    - `Wind Direction (clock)`: *Wind Direction is expressed in clock points.[...], wind is always described in terms of where it is coming from.* [Horus manual p.16]
    - `Inclination Angle`: *The degrees field is marked with a “d” and the cosine field with a “c”.* [Horus manual p.33]
    - `Target Speed`: *Target Speed Assist* [Horus manual p.21]
    - `Target Range (meters)`: *Parameter Limits minimum and maximum values: 25 - 3700 meters.* [Horus manual p.17]
- Apply vertical (Page Up and Down keys as default) and horizontal (Left Ctrl + Page Up and Down keys as default) elevations to the [scope]({{ site.baseurl }}/wiki/feature/scopes.html).
- Hold Breath (Left Shift as default) and Fire (Prim. Mouse. Btn. as default).


## 4. Official References

- [Horus AtragMx Manual]({{ site.ace.githubUrl }}/blob/master/extras/manual_Horus_ATrag-v385.pdf)


## 5. Resources

Missions by Ruthberg, author of Advanced Ballistics and its tools:

- Arma3 Missions folder: [360 Degree Training Course v1.3]({{ site.ace.githubUrl }}/blob/master/extras/ruthberg_missions/360_Degree_Training_Course-Missions.zip), *[Features](https://forums.bistudio.com/forums/topic/171228-sp-360-degree-training-course/)*
- Eden Editor mission: [360 Degree Training Course Framework]({{ site.ace.githubUrl }}/blob/master/extras/ruthberg_missions/360_Degree_Training_Course-Framework.zip)
