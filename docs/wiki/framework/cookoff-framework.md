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
