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

## 1. Disabling cook-off fire for individual vehicles

Cook-off fire can be disabled for a specific vehicle (does not affect ammo cook-off):

```
_vehicle setVariable ["ace_cookoff_enable", false, true];
```

Mission settings will always apply however, so you can't enable cook-off on a vehicle if the mission settings have cook-off for vehicles disabled.

## 2. Disabling ammunition cook-off for individual vehicles and boxes

Ammunition cook-off can be disabled for a specific vehicle or box (does not affect cook-off fire):

```
_vehicleOrBox setVariable ["ace_cookoff_enableAmmoCookoff", false, true];
```

Mission settings will always apply however, so you can't enable ammunition cook-off on a vehicle or box if the mission settings have ammunition cook-off disabled.
