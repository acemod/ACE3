---
layout: wiki
title: Advanced Throwing Framework
description: Explains how to interact with the Advanced Throwing API.
group: framework
parent: wiki
mod: ace
version:
  major: 3
  minor: 7
  patch: 0
---

## 1. Disabling pick up of ammo attached to an object

Pick-up interaction can be disabled for ammo (e.g. chemlights) attached to an object.

```sqf
OBJECT setVariable ["ace_advanced_throwing_disablePickUp", true, true];
```

## 2. Disable showing grenade preview

Hide the (non-primed) preview grenade object by

```sqf
ace_advanced_throwing_hiddenThrowables pushBack "grenadeHand"; // disable specific grenade types (CfgAmmo classname)
ace_advanced_throwing_hiddenThrowables pushBack true; // disable all
```
