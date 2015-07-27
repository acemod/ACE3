---
layout: wiki
title: Spectator
description: A flexible spectator system
group: feature
parent: wiki
---

## 1. Overview

The ACE3 spectator system is designed to act as a flexible and easy to configure framework. Most scenarios can be set up as desired using only the settings provided, however public functions are available for finer control of these configurable aspects.

### 1.1 Spectator System

The current itteration of the ACE3 spectator system only officially supports scenarios using respawn type 3 (or "BASE"). However there's nothing to stop its use alongside anything else, just be aware that it might not function entirely as expected.

By default, the ACE3 spectator system does nothing - meaning existing missions will behave exactly as before. The setting `ace_spectator_onDeath` can be used to automatically put players into spectator mode each time they die.

For scenario designers who seek a more advanced setup (such as multiple lives or wave respawning) the function `ace_spectator_fnc_setSpectator` is provided to transition players to/from spectator mode as desired:
```
 * Arguments:
 * 0: Unit to put into spectator state <OBJECT>
 * 1: New spectator state <BOOL> <OPTIONAL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [player, true] call ace_spectator_fnc_setSpectator
```

### 1.2 Spectatable Units

Spectatable units are stored in an automatically maintained list (`ace_spectator_unitList`) on each client. However, directly accessing this list is not encouraged. Instead scenario designers have two tools at their disposal to tweak the list:
- Unit filter
- Unit whitelist/blacklist

The unit filter determines which units will automatically be used to populate the spectatable unit list. It's controlled by setting `ace_spectator_filterUnits` and there are three possible options:
- No units
- Player units (default)
- All units

In cases where more specific control is required function `ace_spectator_fnc_updateUnits` can be used to whitelist units from the filter or blacklist them from the list (on the local client):
```
 * Arguments:
 * 0: Units to add to the whitelist <ARRAY>
 * 1: Use blacklist <BOOL> <OPTIONAL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [allUnits,true] call ace_spectator_fnc_updateUnits
 *
```

### 1.3 Spectatable Sides

Spectatable sides can simply be considered an extra layer of filtering for the spectatable unit list. Again, there are two methods of controlling the spectatable sides:
- Side filter
- Side list

The side list is exactly what it sounds like, a list of sides spectatable by the local client. However, unlike spectatable units the side list remains static and can only be updated manually. This is because the side filter is applied on top of the side list as the unit list is automatically maintained - meaning the unit list will update if the player changes side or if the side relations change.

Note that the unit whitelist/blacklist also serves to override this side filtering mechanism.

The default side list is `[west,east,resistance,civilian]` and to update it (on the local client) function `ace_spectator_fnc_updateSpectatableSides` can be used:
```
 * Arguments:
 * 0: Sides to add <ARRAY>
 * 1: Sides to remove <ARRAY>
 *
 * Return Value:
 * Spectatable sides <ARRAY>
 *
 * Example:
 * [[west], [east,civilian]] call ace_spectator_fnc_updateSpectatableSides
```

The side filter determines which sides from the side list are valid each time the unit list is updated. It's controlled by setting `ace_spectator_filterSides` and there are four possible options:
- Player side (default)
- Friendly sides
- Hostile sides
- All sides

### 1.4 Camera Modes

There are 3 possible camera modes:
- Free
- Internal
- External

Scenario designers can control the camera modes available to spectators via the setting `ace_spectator_restrictModes`. Function `ace_spectator_fnc_updateCameraModes` is also provided to alter the available modes (to the local player) as desired at any point in the mission:
```
 * Arguments:
 * 0: Camera modes to add <ARRAY>
 * 1: Camera modes to remove <ARRAY>
 *
 * Return Value:
 * Available camera modes <ARRAY>
 *
 * Example:
 * [[0], [1,2]] call ace_spectator_fnc_updateCameraModes
```

### 1.5 Vision Modes

### 1.6 Camera Attributes

## 2. Usage

### 2.1 Spectator Shortcuts

Shortcuts are currently hardcoded in the ACE3 spectator system. Future versions are likely to change that.

#### 2.1.1 Interface Shortcuts

<table>
    <thead>
        <tr>
            <th>Shortcut</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><kbd>H</kbd></td>
            <td>Toggle help</td>
        </tr>
        <tr>
            <td><kbd>M</kbd></td>
            <td>Toggle map</td>
        </tr>
        <tr>
            <td><kbd>1</kbd></td>
            <td>Toggle unit list</td>
        </tr>
        <tr>
            <td><kbd>2</kbd></td>
            <td>Toggle toolbar</td>
        </tr>
        <tr>
            <td><kbd>3</kbd></td>
            <td>Toggle compass</td>
        </tr>
        <tr>
            <td><kbd>4</kbd></td>
            <td>Toggle unit icons</td>
        </tr>
        <tr>
            <td><kbd>Backspace</kbd></td>
            <td>Toggle interface</td>
        </tr>
    </tbody>
</table>

#### 2.1.2 Free Camera Shortcuts

<table>
    <thead>
        <tr>
            <th>Shortcut</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><kbd>W</kbd></td>
            <td>Camera forward</td>
        </tr>
        <tr>
            <td><kbd>S</kbd></td>
            <td>Camera backward</td>
        </tr>
        <tr>
            <td><kbd>A</kbd></td>
            <td>Camera left</td>
        </tr>
        <tr>
            <td><kbd>D</kbd></td>
            <td>Camera right</td>
        </tr>
        <tr>
            <td><kbd>Q</kbd></td>
            <td>Camera up</td>
        </tr>
        <tr>
            <td><kbd>Z</kbd></td>
            <td>Camera down</td>
        </tr>
        <tr>
            <td><kbd>LMB</kbd></td>
            <td>Camera dolly</td>
        </tr>
        <tr>
            <td><kbd>RMB</kbd></td>
            <td>Camera pan and tilt</td>
        </tr>
        <tr>
            <td><kbd>Scrollwheel</kbd></td>
            <td>Zoom +/-</td>
        </tr>
        <tr>
            <td><kbd>Ctrl</kbd>+<kbd>Scrollwheel</kbd></td>
            <td>Speed +/-</td>
        </tr>
        <tr>
            <td><kbd>N</kbd></td>
            <td>Next vision mode</td>
        </tr>
        <tr>
            <td><kbd>Ctrl</kbd>+<kbd>N</kbd></td>
            <td>Previous vision mode</td>
        </tr>
    </tbody>
</table>

#### 2.1.3 Unit Camera Shortcuts

<table>
    <thead>
        <tr>
            <th>Shortcut</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><kbd>Right arrow</kbd></td>
            <td>Next unit</td>
        </tr>
        <tr>
            <td><kbd>Left arrow</kbd></td>
            <td>Previous unit</td>
        </tr>
        <tr>
            <td><kbd>RMB</kbd></td>
            <td>Toggle gun camera</td>
        </tr>
    </tbody>
</table>

#### 2.1.4 General shortcuts

<table>
    <thead>
        <tr>
            <th>Shortcut</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><kbd>Up arrow</kbd></td>
            <td>Next camera</td>
        </tr>
        <tr>
            <td><kbd>Down arrow</kbd></td>
            <td>Previous camera</td>
        </tr>
    </tbody>
</table>

### 2.2 The Interface

#### 2.2.1 Unit list

The unit list on the left lists all of the units currently available to spectate.
Double click on any unit name in the list to switch to the unit.
Double click on the current unit to switch between internal and external view.

#### 2.2.2 Toolbar

The toolbar along the bottom of the screen displays various useful values. From left to right these are:

* Unit name
* Camera mode
* Camera zoom/Unit side
* 24-hour Clock
* Vision mode/Unit depth
* Camera/Unit speed

#### 2.2.3 Map

The map overlay will show the current position of the free camera and all spectatable units. The unit icons are tied into the unit icon toggle shortcut. When spectating a unit the map will also show the icons of units it knows about. In free camera you can double click on the map to teleport the camera to the position of the mouse.

## 3. Dependencies

`ace_common`
