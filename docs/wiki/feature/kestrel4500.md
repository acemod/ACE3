---
layout: wiki
title: Kestrel 4500
description: Kestrel 4500 Pocket Weather Tracker.
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

The Kestrel 4500 Pocket Weather Tracker is Kestrel's environmental meter. This is a mini weather station in itself :
- Heading
- Wind direction
- Crosswind
- Headwind
- Altitude
- Barometric pressure
- Wet bulb temperature
- Relative humidity in %
- Dewpoint
- Density altitude
- Wind chill
- Temperature °C
- Time and date
- Minimum, Maximum and Average values


## 2. Usage

### 2.1 Opening the Kestrel

#### 2.1.1 Interaction Menu

- Open the self interaction menu <kbd>Ctrl</kbd> + <kbd>⊞&nbsp;Win</kbd>
- Select `Equipment`
- Select `Open Kestrel 4500`

#### 2.1.2 Custom key

- `OPTIONS` / `CONTROLS` / `CONFIGURE ADDONS` / `ACE3 Equipment`

#### 2.1.3 Inventory

<img src="{{ site.baseurl }}/img/wiki/feature/abtools_inventory.png" width="900" height="450" alt="Inventory management" />

### 2.2 `CROSSWIND` / `HEADWIND` Feature

- [Official Kestrel Instruments video](https://www.youtube.com/watch?v=4Q_qgXwlRqk)

- *[Wind info]({{ site.baseurl }}/wiki/feature/weather.html) is toggled on/off using <kbd>SHIFT</kbd> + <kbd>K</kbd>.*


## 3. Official Manual

- [Official Manual]({{ site.ace.githubUrl }}/blob/master/extras/K4500_Instruction_Manual_English.pdf)


## 4. Dependencies

{% include dependencies_list.md component="kestrel4500" %}
