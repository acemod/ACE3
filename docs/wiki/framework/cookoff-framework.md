---
layout: wiki
title: Cook Off Framework
description: Explains the Cook off system for developers & mission makers.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 7
  patch: 0
---

## 1. Disabling / Enabling Cook off for individual vehicles

You can dynamically enable and/or disable vehicle cook off for individual vehicles by using `setVariable`:

```
VEHICLE setVariable ["ace_cookoff_enable", true, true];
```

The above will enable cook off for that specific vehicle, no matter the mission settings.

Likewise, cook off can also be disabled for a specific vehicle:

```
VEHICLE setVariable ["ace_cookoff_enable", false, true];
```

## 2. Cook off probability

You can set the probability of cook off for individual vehicle types by changing the `ace_cookoff_probability` value in the vehicle's config:

```
class MyVehicle {
    ace_cookoff_probability = 0.6;
};
```

Global cook off probability can also be adjusted with the `ace_cookoff_probabilityCoef` mission setting.

Higher values will make cook-off more probable, whilst lower values will make cook-off less probable.

## 3. Ignore damage to turret

For use on vehicles when damage to the main turret would not cause a vehicle cookoff.
e.g. RCWS turrets

```
class MyVehicle {
    ace_cookoff_ignoreTurret = 1;
};
```
