---
layout: wiki
title: HuntIR
description: High-altitude Unit Navigated Tactical Imaging Round
group: feature
category: equipment
parent: wiki
mod: ace
version:
  major: 3
  minor: 1
  patch: 0
---

## 1. Overview

### 1.1 The HuntIR
The **H**igh-altitude **U**nit **N**avigated **T**actical **I**maging **R**ound (HuntIR) is designed to be fired from a grenade launcher. After being fired in the air the in-built parachute will be deployed and the IR CMOS camera will activate, providing a video stream until it touches the ground or get shot down.

## 2. Usage
NOTE: The HuntIR round does not work with modded weapons without a compatibility fix made either by the ACE3 team or the mod team.

### 2.1 Using the HuntIR
- To be able to connect to the IR CMOS camera you will need a `HuntIR monitor`.
- Fire the HuntIR round as high as possible over the area you want to observe.
- Open the `HuntIR monitor`.
  - To open the `HuntIR monitor` self interact <kbd>Ctrl</kbd> + <kbd>⊞&nbsp;Win</kbd> (ACE3 default)
  - Select `Equipment`.
  - Select `Activate HuntIR monitor`.
- You now have control of the IR CMOS camera, to close the monitor press <kbd>ESC</kbd> or <kbd>⊞&nbsp;Win</kbd>

### 2.2 IR CMOS camera controls

Shortcut | Action
------------ | -------------
<kbd>A</kbd>  | Decrease zoom level
<kbd>D</kbd> | Increase zoom level
<kbd>N</kbd> | Toggle NV
<kbd>S</kbd> | Next camera
<kbd>W</kbd> | Previous camera
<kbd>←</kbd> | Rotate camera anticlockwise
<kbd>→</kbd>|  Rotate camera clockwise
<kbd>↑</kbd> | Raise camera
<kbd>↓</kbd> | Lower camera
<kbd>R</kbd> | Reset camera

## 3. Dependencies

{% include dependencies_list.md component="huntir" %}
