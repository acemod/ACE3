---
layout: wiki
title: Advanced Ballistics
description: The advanced ballistics module improves internal and external ballistics.
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
The Advanced Ballistics module improves internal and external ballistics.

## 1.1 Features
- Drag modelling based on real-world ballistic coefficients.
- Ambient air density (air pressure, temperature, humidity) affects drag.
- Wind affects drag and deflects the trajectory.
- Wind speed varies with altitude.
- Terrain features, buildings and other objects disrupt the wind.
- [Magnus effect](https://en.wikipedia.org/wiki/Magnus_effect) (spin drift)
- [Coriolis effect](https://en.wikipedia.org/wiki/Coriolis_effect) and [Eötvös effect](https://en.wikipedia.org/wiki/Eotvos_effect) (Earth rotation)
- Loss of stability during transonic flight.
- Variable muzzle velocity based on powder burn rate and barrel length.
- Bullet trace effect for supersonic bullets (light refraction due to air pressure waves).
- A protractor for quickly measuring the inclination angle.

## 2. Usage

### 2.1 Protractor
Press <kbd>Ctrl</kbd>+<kbd>⇧&nbsp;Shift</kbd>+<kbd>K</kbd> while using a compatible weapon to toggle the protractor. The red line indicates the current inclination angle in degrees. The protractor will disappear if you lower or holster your weapon.

## 3. Dependencies
`ace_ballistics`, `ace_weather`, `ace_modules`

## 4. Addon Configs:
Reference https://github.com/acemod/ACE3/blob/master/extras/CfgAmmoReference.hpp for examples of bullets with correct configs.
It is probably best to modify an example that's close to the bullet you are trying to add.

<div class="panel callout">
    <h5>ALL VALUES ARE IN METRIC</h5>
</div>

### 4.1 CfgWeapons (Example M4):
 - `ACE_barrelTwist=177.8;`
    >1:7 inch rifle twist

    7 inches * 25.4(mm/in) = 177.8 mm
    Same as the Capital T in https://en.wikipedia.org/wiki/Miller_twist_rule (convert to metric)

 - `ACE_barrelLength = 368.3;`
    >14.5 in (370 mm)

    Self explanatory

 - `ACE_twistDirection`

    Right handed is 1, Left is -1, none is 0
    Leaving blank will default to 1 (Almost everything is right-handed)
    A smooth-bore gun (e.g. shotgun) would be `0`.

### 4.2 CfgAmmo (Example B_556x45_Ball):
 - `ACE_caliber=5.69;`

     Bullet diameter in mm (diameter is a little different from caliber)

 - `ACE_bulletLength=23.012;`

 Bullet Length in mm

 - `ACE_bulletMass=4.0176;`

    Mass in grams (example is roughly 62 grains)

 - `ACE_ammoTempMuzzleVelocityShifts[]={-27.20, -26.44, -23.76, -21.00, -17.54, -13.10, -7.95, -1.62, 6.24, 15.48, 27.75};`

    Array of muzzle velocity shifts in m/s with 11 data points from -15 °C to 35 °C
    Example: At 0°C the shift will be -21.0

 - `ACE_ballisticCoefficients[]={0.151};`

    Array of ballistic coefficients (contains one element more than the velocity boundary array)

 - `ACE_velocityBoundaries[]={};`

    Array of velocity boundaries

 - `ACE_standardAtmosphere="ASM";`

    "ASM" or "ICAO"

 - `ACE_dragModel=7;`

    Number that specifies the drag model [1, 2, 5, 6, 7, 8]

 - `ACE_muzzleVelocities[]={723, 764, 796, 825, 843, 866, 878, 892, 906, 915, 922, 900};`

    Array of muzzle velocities (same size as barrel length array)

 - `ACE_barrelLengths[]={210.82, 238.76, 269.24, 299.72, 330.2, 360.68, 391.16, 419.1, 449.58, 480.06, 508.0, 609.6};`

    Array of barrel lengths (same size as muzzle velocity array)
    Example, when shooting with the M4 barrel (`368.3`mm).
    The length is between the 5th and 6th barrelLengths (`360.68, 391.16`).
    So the muzzle velocity will be between 5th and 6th muzzleVelocities (`866, 878`).

## 5. Dependencies

{% include dependencies_list.md component="advanced_ballistics" %}
