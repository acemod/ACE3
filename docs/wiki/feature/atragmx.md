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

## Overview

### AtragMx from HORUS VISION
Horus ATragMX software considers atmospheric conditions, gun data, ammunition, range, speed and muzzle velocity to calculate precise aiming solutions with "come-up" results – and even accounts for Coriolis and spin drift effects. ATragMX, loaded on a handheld computer made by TDS Recon, is easy to use and lightning-fast. The Recon meets the rigorous MIL-STD-810F military standard for drops, vibration, humidity, altitude and extreme temperatures.

### Official Manuel and Horus Videos
https://github.com/acemod/ACE3/blob/master/extras/manual_Horus_ATrag-v385.pdf

https://www.youtube.com/watch?v=pg6oqT5jVds
https://www.youtube.com/watch?v=7SkRnbwoPmw

## Usage

Quick example with the M14 and the default 7.62mm 20Rnd Mag :

 - Open your Range Card and check your cartridge, the zeroed distance, the rifle twist, 
the Muzzle Velocity at 15°C and the Bore Height at the end.

![Range Card](http://arma3.fr/files/media/user/204_45d986716bca9973.jpg)

 - Open the AtragMx and the `Atmsphr` column, select `Default` and `Done`.
 - `Open Gun` the 7.62x51mm M80 in the `GunList`.
 - Select `E` (English unit) at the top right.
 - Open the `Gun` column, check and update the `Bore`, the `Rifle Twist` and `Done`.
 - Select `M` (Metric unit) at the top right.
 - Open the `Gun` column, check and update the `Muzzle Velocity`, the `Zero Range` and `Done`.
 - **!!! The Muzzle Velocity Table will be automatically updated !!!**
 - At this moment and optionally, `Save Gun` in the `GunList`.
 - Actualise the `Atmsphr` column with the Kestrel and `Done` (Check the new Muzzle Velocity in the "Gun" column).
 - Actualise the `Target` column.
 - Apply the vertical and horizontal elevations on the scope.
 - Control the breath and press ...
 
## Dependencies

{% include dependencies_list.md component="atragmx" %}
