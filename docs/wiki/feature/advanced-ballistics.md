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

### 1.1 Features
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

### 2.1 Enabling Advanced Ballistics

#### 2.1.1 OPTIONS → GAME → CONFIGURE ADDONS

<img src="{{ site.baseurl }}/img/wiki/feature/ab_module1.jpg" width="800" height="484" alt="Advanced Ballistics module" />

#### 2.1.2 CBA Settings System
- [CBA Settings System](https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System)

#### 2.1.3 Enabled in-game ?
- Pick up a [Range Card]({{ site.baseurl }}/wiki/feature/rangecard.html) and open it.

<img src="{{ site.baseurl }}/img/wiki/feature/ab_ingame.png" width="1400" height="280" alt="Advanced Ballistics vs Default Ballistic" />

### 2.2 Protractor
- You need a compatible weapon.
- Press <kbd>Ctrl</kbd>+<kbd>⇧&nbsp;Shift</kbd>+<kbd>K</kbd>.
- Red line indicates the current inclination angle in degrees.
- Protractor will disappear if you lower or holster your weapon.


## 3. Dependencies

{% include dependencies_list.md component="advanced_ballistics" %}
