---
layout: wiki
title: Weather Framework
description: Explains how to work with ACE3 weather system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Overview

ACE3 Weather overrides weather settings (editor, mission settings) and automatically calculates wind, temperature and pressure according to map location, date, time of day and cloud coverage and allows the weather to evolve realistically as the simulation progresses.

Weather synchronization occurs between all clients.

Adjustment of the weather is possible by modifying the `overcast` value (for example: `0.7` may result in intermittent rain).

### 1.1 Weather Propagation

Weather propagation is responsible for synchronizing weather between all clients. Disabling it is **NOT** recommended.

### 1.2 Using ACE3 Weather

ACE3 Weather overrides the default weather a custom system (map based).

This can be disabled without affecting the weather propagation above. Useful if you prefer changing weather settings manually.
