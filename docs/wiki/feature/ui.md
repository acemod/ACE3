---
layout: wiki
title: User Interface
component: ui
description: Selective User Interface framework and other tweaks.
group: feature
category: general
parent: wiki
mod: ace
version:
  major: 3
  minor: 1
  patch: 0
---

## 1. Overview

User Interface component adds the ability for almost every element in vanilla Arma to be hidden and shown on the fly, as well as frameworks for modders and mission makers to add their own elements and toggle them as necessary. In addition it removes vignette (black borders around the edges) and changes the chat contrast on the map to allow easier reading.

## 2. Mission Vars

### ace_ui_hidehud_hidechat

Controls if chat is hidden when the Hide HUD keybind is used. Default is true.

```sqf
missionNamespace setVariable ["ace_ui_hidehud_hidechat", false];
```
