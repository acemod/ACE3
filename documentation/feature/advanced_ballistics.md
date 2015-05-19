---
layout: wiki
title: Advanced Ballistics
description: The advanced ballistics module improves internal and external ballistics. 
group: feature
parent: wiki
---

## 1. Overview
The Advanced Ballistics module improves internal and external ballistics. 

## 2. Features
- Drag modeling based on real-world ballistic coefficients.
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

## 3. Usage
Press <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>K</kbd> while using a compatible weapon to toggle the protractor. The red line indicates the current inclination angle in degrees. The protractor will disappear if you lower or holster your weapon.

This module uses relatively complex scripting. Several options are provided in the ACE menu to reduce the performance impact of this module.

## Dependencies
`ace_ballistics`, `ace_weather`, `ace_modules`
