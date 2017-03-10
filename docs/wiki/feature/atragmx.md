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

### Sub-feature 1
Short description of sub-feature 1.

### Sub-feature 2
Short description of sub-feature 2.


## Usage

Quick example with the M14 and the default 7.62mm 20Rnd Mag :

 - Open your Range Card and check your cartridge, the zeroed distance, the rifle twist, 
the Muzzlz Velocity at 15°C and the Bore Height at the end.

![Range Card](https://photos-6.dropbox.com/t/2/AADFCNE77StOxf1EqYi3GKSx8aMjDZWPnjMKIFNKQrp8_g/12/621995618/jpeg/32x32/1/_/1/2/atragmx_wiki_1.jpg/ENGu4YQFGAYgBygH/_IzsptDz3wdrFH5HJPa0maethobYVXQyMQnggV2B93g?size=2048x1536&size_mode=3 "range card")

 - Open the AtragMx and the "Atmsphr" column, select "Default" and "Done".
 - "OpenGun" the 7.62x51mm M80 in the "GunList".
 - Select "E" (English unit) at the top right.
 - Open the "Gun" column, check and update the "Bore", the "Rifle Twist" and "Done"
 - Select "M" (Metric unit) at the top right.
 - Open the "Gun" column, check and update the "Muzzle Velocity", the "Zero Range" and "Done".
 - !!! The Muzzle Velocity Table will be automatically updated !!!
 - Actualise the "Atmsphr" column with the Kestrel and "Done" (Check the new Muzzle Velocity in the "Gun" column)
 - Actualise the "Target" column.
 - Apply the vertical and horizontal elevations on the scope.
 - Control the breath and press ...
 
## Dependencies

{% include dependencies_list.md component="atragmx" %}
