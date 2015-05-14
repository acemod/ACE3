---
layout: wiki
title: Advanced Ballistics
group: feature
parent: wiki
---
# Overview
## Advanced ballistics simulation
The advanced ballistics module improves projectile physics by simulating internal and external ballistics. Factors used in the simulation include:

- Ambient air pressure, temperature and humidity
- Wind drift
- [Magnus effect](https://en.wikipedia.org/wiki/Magnus_effect) (spin drift)
- [Coriolis effect](https://en.wikipedia.org/wiki/Coriolis_effect) and [Eötvös effect](https://en.wikipedia.org/wiki/Eotvos_effect) (Earth rotation)
- Loss of stability during transonic flight 
- Variable muzzle velocity based on on powder burn rate and barrel length
- Barrel length effect on muzzle velocity

## Advanced drag model
Realistic drag modeling based on the G Model and real-world ballistic coefficient data.

## Wind simulation
Wind speed varies with altitude. Terrain features, buildings and other objects disrupt the wind.

## Bullet trace effects
Supersonic bullets have a refraction effect due to air pressure waves.

## Protractor
Adds a protractor for quickly measuring inclination angle.

# Usage
Press <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>K</kbd> while using a compatible weapon to toggle the protractor. The red line indicates the current inclination angle in degrees. The protractor will disappear if you lower or holster your weapon.

This module uses relatively complex scripting. Several options are provided in the ACE menu to reduce the performance impact of this module.

# Dependencies
`ace_ballistics`, `ace_weather`, `ace_modules`
