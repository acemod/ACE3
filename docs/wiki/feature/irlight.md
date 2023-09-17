---
layout: wiki
title: IR Lights
component: irlight
description: IR flashlights and multi function lasers.
group: feature
category: equipment
parent: wiki
mod: ace
version:
  major: 3
  minor: 16
  patch: 0
---

## 1. Overview

### 1.1 DBAL-A3

The DBAL-A3 is a multi function laser and can be run in the following modes:

- IR laser and IR illuminator
- IR laser
- IR illuminator
- Visible laser

### 1.2 SPIR

The SPIR is an IR only flashlight. It uses a diffused laser, which improves its effective range considerably compared to a conventional flashlight. It has three modes with different beam widths to allow both easy terrain navigation and engagements at longer ranges during difficult lighting conditions.

### 1.3 Long Range Variants

Due to Arma 3's dated lighting system, flashlights can shine through objects and walls. To avoid these visual bugs, we have opted to tone down their range considerably compared to their real life counterparts. Although the DBAL-A3 has a range of up to 4000 m according to its manufacturer, such intense lights are simply not feasible in Arma.

Realism focused players which are not bothered by some visual bugs can use the long range variants of the DBAL-A3 and the SPIR. They are, besides their increased lighting power, identical to their normal range counterparts and can be accessed by appending `_LR` to the class name (see [Class Names](../class-names#ir-lights)). They still provide a lower lighting range than their real life counter parts, but should offer a nice middleground.

| Attachment | Normal Range    | Long Range       |
| ---------- | --------------- | ---------------- |
| DBAL-A3    | 220 m           | 570 m            |
| SPIR       | 50 / 80 / 120 m | 80 / 100 / 180 m |

## 2. Usage

### 2.1 Momentary Switch

ACE IR Lights adds a keybind in the equipment category to temporarily turn on a flashlight or laser while holding down the key. There is no default keybind set.

### 2.2 Function Mode Switching

The DBAL-A3 function mode can be switched using the [CBA Accessory Functions](https://github.com/CBATeam/CBA_A3/wiki/Accessory-Functions) (default: <kbd>Ctrl</kbd> + <kbd>L</kbd>) or the item context menu, which can be accessed by double clicking the attachment in the inventory menu.
