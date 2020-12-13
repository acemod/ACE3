---
layout: wiki
title: Fire Framework
description: Explains how to ignite thing using CBA events.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 14
  patch: 0
---


## 1. Events

Events are only called on the server. Use `cba_fnc_globalEvent` to call.

### 1.1 Adding a new fire source

`ace_fire_addFireSource`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Source of flame | Object/Position ASL | Required
1  | Radius of fire | Number | Required
2  | Intensity of fire (1, 10] | Number | Required
3  | Fire source ID | Any | Required
4  | Condition to stop fire | Code | Optional (default: `{ true }`)
5  | Arguments to pass to condition | Any | Optional (default: `[]`)

### 1.2 Removing fire source

`ace_fire_removeFireSource`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Fire source ID | Any  | Required
