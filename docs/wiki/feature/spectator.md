---
layout: wiki
title: Spectator
description: A flexible spectator system.
group: feature
category: interaction
parent: wiki
mod: ace
version:
  major: 3
  minor: 2
  patch: 0
---

## 1. Features

ACE3 spectator is heavily inspired by Bohemia Interactive's [End Game Spectator](https://community.bistudio.com/wiki/EG_Spectator_Mode). The reason for this is to try and keep the spectator user experience relatively consistent and so that ACE3 can focus more on providing additional functionality than reinventing how spectator actually works.

### 1.1 Camera modes

There are 3 available camera modes which can be enabled/disabled via the relevant setting and public API:

- Free Camera
- First Person
- Third Person

A button dock at the bottom of the UI can be used to switch camera modes as well as <kbd>Spacebar</kbd>.

### 1.2 Vision modes

By default, there are 3 available vision modes which can be enabled/disabled via the relevant setting and public API:

- Normal
- Night Vision
- Thermal (White and Black Hot)

However, via the public API a range of additional thermal vision modes are also possible. Cycling through available vision modes is currently hard coded to the <kbd>N</kbd> key.

### 1.3 Unit focusing

Focusing on a unit changes the active camera view to observe the given unit. In free camera, this means the camera will center on the unit regardless of where you move it (while in 1PP and 3PP the camera behaves as expected). To change the current focus, units can be:

- Clicked on in the 3D world (their rendered name will become highlighted when moused over)
- Clicked on in the 2D map (their icon will become highlighted when moused over)
- Clicked on in the unit list on the left side of the UI

Before 1PP and 3PP camera modes can be entered, a unit must be in focus as these camera modes require a unit to observe. To un-focus the free camera, simply click again while no new unit is highlighted.

### 1.4 Spectator map

Pressing the <kbd>M</kbd> key will open the spectator map. All spectatable units and locations are rendered on the map as well as the free camera if active. To teleport the free camera simply click on the map at the desired location (with no unit highlighted).

### 1.5 Camera speeds

Unlike End Game Spectator, instead of having two levels of fast camera speed, the default camera speed is more responsive and a hotkey is provided to slow the camera speed (for when more fine movement is desired) as well as increase it (for when traveling distance is desired).

### 1.6 Draw distance

Upon opening spectator the view distance defaults to 1200m, the <kbd>Page Up</kbd> and <kbd>Page Down</kbd> keys can be used to incrementally increase and decrease this view distance within the range of 500m to 2500m.

### 1.7 Camera lights

Pressing the <kbd>L</kbd> hotkey will toggle local camera lights on an off. A light is created at both the cursor position and camera position to assist in viewing night time scenarios without night vision. Nobody else will see these lights since they are created locally.

### 1.8 Focus info widget

When a unit is focused on, a small widget will be shown in the center of the UI with details on their loadout and performance. To toggle this UI element on and off the <kbd>I</kbd> hotkey can be used.

### 1.9 Unit drawing

The <kbd>O</kbd> hotkey can be used to toggle unit and group drawing on and off. Units will be drawn with a caret icon above their heads and their nametag when in close proximity to the camera. Groups will receive a dynamic (approximate) NATO group icon based on their composition - which is rendered above the group leader.

### 1.10 Projectile drawing

The <kbd>P</kbd> hotkey can be used to toggle projectile drawing on and off. Projectiles originating from units listed in the unit list will be drawn in real time and allow fire fights to be observed more clearly. Note that this feature may have a significant performance impact in scenarios with lots of projectiles on screen at once.

## 2. Dependencies

{% include dependencies_list.md component="spectator" %}
