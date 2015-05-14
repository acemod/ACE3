---
layout: wiki
title: Advanced Ballistics
group: feature
parent: wiki
---
# Overview
## Advanced ballistics simulation
Advanced ballistics changes above and beyond the ballistics module. Bullet velocity and flight paths are dynamically simulated in response to the following factors:

- Ambient air pressure, temperature and humidity
- Wind drift
- [Magnus effect](https://en.wikipedia.org/wiki/Magnus_effect) (spin drift)
- [Coriolis effect](https://en.wikipedia.org/wiki/Coriolis_effect) and [Eötvös effect](https://en.wikipedia.org/wiki/Eotvos_effect) (Earth rotation)
- Loss of stability during transonic flight 
- Ammo temperature
- Barrel length

## Advanced drag model
Realistic drag modeling based on the G Model and real-world ballistic coefficient data.

## Wind simulation
Wind speed varies with altitude. Terrain features, buildings and other objects disrupt the wind.

## Protractor
Adds a protractor for quick reference when sniping.

# Usage
Press <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>K</kbd> to display the protractor.

This module uses relatively complex scripting. Several options are provided in the ACE menu to reduce the performance impact of this module.

# Dependencies
`ace_ballistics`, `ace_weather`, `ace_modules`
