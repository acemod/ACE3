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

## 1. Overview

The ACE3 spectator system is designed to act as a flexible and easy to configure framework. Most scenarios can be set up as desired using only the settings provided, however public functions are available for finer control of these configurable aspects.

### 1.1 Spectator System

By default, the ACE3 spectator system does nothing - meaning existing missions will behave exactly as before. There are two tools available to enable the spectator system in your missions:

- An `"ace_spectator"` [respawn template](https://community.bistudio.com/wiki/Arma_3_Respawn)
- Public functions `ace_spectator_fnc_setSpectator` and `ace_spectator_fnc_stageSpectator`

With respawn template `"ace_spectator"` in effect players will enter spectator mode upon death and exit upon respawn. The template is compatible with all respawn types and allows you to take advantage of the vanilla framework's flexibility (combining templates, side specific templates, etc.). This makes for very simple combination of a wide variety of spectator and respawn setups.

An example description.ext file using the respawn template:

```js
respawn = 3;
respawnDelay = 180;
respawnTemplates[] = {"ace_spectator"};
respawnTemplatesWest[] = {"ace_spectator","Counter","Wave"};
```

For groups using custom respawn frameworks - or for missions where you want finer control over who, how and when players enter spectator - the two following functions are provided:

`ace_spectator_fnc_setSpectator`

```js
/*
* Sets local client to the given spectator state (virtually)
* To physically handle a spectator see ace_spectator_fnc_stageSpectator
*
* Client will be able to communicate in ACRE/TFAR as appropriate
* The spectator interface will be opened/closed
*
* Arguments:
* 0: Spectator state of local client <BOOL> (default: true)
*
* Return Value:
* None <NIL>
*
* Example:
* [true] call ace_spectator_fnc_setSpectator
*/
```

`ace_spectator_fnc_stageSpectator`

```js
/*
* Sets target unit to the given spectator state (physically)
* To virtually handle a spectator see ace_spectator_fnc_setSpectator
*
* Units will be gathered at marker ace_spectator_respawn (or [0,0,0] by default)
* Upon unstage, units will be moved to the position they were in upon staging
*
* Arguments:
* 0: Unit to put into spectator stage <OBJECT> (default: player)
* 1: Spectator stage <BOOL> (default: true)
*
* Return Value:
* None <NIL>
*
* Example:
* [player, false] call ace_spectator_fnc_stageSpectator
*/
```

### 1.2 Spectatable Units

Spectatable units are stored in an automatically maintained list (`ace_spectator_unitList`) on each client. However, directly accessing this list is not encouraged. Instead mission makers have two tools at their disposal to tweak the list:

- Unit filter
- Unit whitelist/blacklist

The unit filter determines which units will automatically be used to populate the spectatable unit list. It's controlled by setting `ace_spectator_filterUnits` and there are four possible options:

- **No units**
- **Player units**
- **Playable units** *(default)*
- **All units**

In cases where more specific control is required function `ace_spectator_fnc_updateUnits` can be used to whitelist units from the filter or blacklist them from the list (on the local client):

```js
/*
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
 */
```

### 1.3 Spectatable Sides

Spectatable sides can be considered another filter for the unit list to determine which units are available to spectate base on their side. As such, units can also be whitelisted from this filter as detailed above. There are two stages in the spectatable sides mechanism:

- Side list
- Side filter

The side list is a list of sides *possible* to spectate. By default this is always `[west, east, resistance, civilian]` and does not change. To update the local client's side list the function `ace_spectator_fnc_updateSpectatableSides` can be used:

```js
/*
 * Arguments:
 * 0: Sides to add <ARRAY>
 * 1: Sides to remove <ARRAY>
 *
 * Return Value:
 * Spectatable sides <ARRAY>
 *
 * Example:
 * [[west], [east,civilian]] call ace_spectator_fnc_updateSpectatableSides
 */
```

The side filter is then applied *on top* of this list to determine which sides are *truly* available to spectate. It's controlled by setting `ace_spectator_filterSides` and there are four possible options:

- **Player side** *(default)*
- **Friendly sides**
- **Hostile sides**
- **All sides**

### 1.4 Camera Modes

There are 3 possible camera modes:

- **Free**
- **Internal**
- **External**

Mission makers can control the camera modes available to spectators via the setting `ace_spectator_restrictModes`. Function `ace_spectator_fnc_updateCameraModes` is also provided to alter the available modes (to the local player) as desired at any point in the mission:

```js
/*
 * Possible camera modes are:
 *   - 0: Free
 *   - 1: Internal
 *   - 2: External
 *
 * Arguments:
 * 0: Camera modes to add <ARRAY>
 * 1: Camera modes to remove <ARRAY>
 *
 * Return Value:
 * Available camera modes <ARRAY>
 *
 * Example:
 * [[0], [1,2]] call ace_spectator_fnc_updateCameraModes
 */
```

### 1.5 Vision Modes

Vision modes are only available in free camera mode. By default there are 4 available vision modes:

- **Normal**
- **Night vision**
- **Thermal imaging (white hot)**
- **Thermal imaging (black hot)**

Mission makers can control which of these vision modes are available to spectators via the setting `ace_spectator_restrictVisions`. However, there are actually a total of 10 possible vision modes and function `ace_spectator_fnc_updateVisionModes` can be used to alter which of them are available (to the local player) at any point in the mission:

```js
/*
 * Possible vision modes are:
 *   - -2: Normal
 *   - -1: Night vision
 *   -  0: White hot
 *   -  1: Black hot
 *   -  2: Light Green Hot / Darker Green cold
 *   -  3: Black Hot / Darker Green cold
 *   -  4: Light Red Hot / Darker Red Cold
 *   -  5: Black Hot / Darker Red Cold
 *   -  6: White Hot / Darker Red Cold
 *   -  7: Thermal (Shade of Red and Green, Bodies are white)
 *
 * Arguments:
 * 0: Vision modes to add <ARRAY>
 * 1: Vision modes to remove <ARRAY>
 *
 * Return Value:
 * Available vision modes <ARRAY>
 *
 * Example:
 * [[0], [1,2]] call ace_spectator_fnc_updateVisionModes
 */
```

### 1.6 Camera Attributes

The spectator camera has 8 manipulatable attributes:

- **Camera mode:** The camera view
- **Camera unit:** The unit used for internal and external view
- **Camera vision:** The vision mode used by the free camera
- **Camera position:** The position of the free camera
- **Camera pan:** The pan (direction/heading) of the free camera
- **Camera tilt:** The tilt (pitch) of the free camera
- **Camera zoom:** The zoom level of the free camera
- **Camera speed:** The movement speed of the free camera

Function `ace_spectator_fnc_setCameraAttributes` can be used to change any of these attributes at any point (including before spectator has ever opened):

```js
/*
 * Arguments:
 * 0: Camera mode <NUMBER> <OPTIONAL>
 *   - 0: Free
 *   - 1: Internal
 *   - 2: External
 * 1: Camera unit (objNull for random) <OBJECT> <OPTIONAL>
 * 2: Camera vision <NUMBER> <OPTIONAL>
 *   - -2: Normal
 *   - -1: Night vision
 *   -  0: Thermal white hot
 *   -  1: Thermal black hot
 * 3: Camera position (ATL) <ARRAY> <OPTIONAL>
 * 4: Camera pan (0 - 360) <NUMBER> <OPTIONAL>
 * 5: Camera tilt (-90 - 90) <NUMBER> <OPTIONAL>
 * 6: Camera zoom (0.01 - 2) <NUMBER> <OPTIONAL>
 * 7: Camera speed in m/s (0.05 - 10) <NUMBER> <OPTIONAL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [1, objNull] call ace_spectator_fnc_setCameraAttributes
 */
```

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
            <td><kbd>1</kbd></td>
            <td>Toggle unit list</td>
        </tr>
        <tr>
            <td><kbd>2</kbd></td>
            <td>Toggle help</td>
        </tr>
        <tr>
            <td><kbd>3</kbd></td>
            <td>Toggle toolbar</td>
        </tr>
        <tr>
            <td><kbd>4</kbd></td>
            <td>Toggle compass</td>
        </tr>
        <tr>
            <td><kbd>5</kbd></td>
            <td>Toggle unit icons</td>
        </tr>
        <tr>
            <td><kbd>M</kbd></td>
            <td>Toggle map</td>
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
            <td><kbd>RMB</kbd></td>
            <td>Pan camera</td>
        </tr>
        <tr>
            <td><kbd>LMB</kbd></td>
            <td>Dolly camera</td>
        </tr>
        <tr>
            <td><kbd>⇧&nbsp;Shift</kbd></td>
            <td>Speed boost</td>
        </tr>
        <tr>
            <td><kbd>F</kbd></td>
            <td>Focus on unit</td>
        </tr>
    </tbody>
</table>

#### 2.1.3 Camera Attribute Shortcuts

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
        <tr>
            <td><kbd>Right arrow</kbd></td>
            <td>Next unit</td>
        </tr>
        <tr>
            <td><kbd>Left arrow</kbd></td>
            <td>Previous unit</td>
        </tr>
        <tr>
            <td><kbd>N</kbd></td>
            <td>Next vision mode</td>
        </tr>
        <tr>
            <td><kbd>Ctrl</kbd>+<kbd>N</kbd></td>
            <td>Previous vision mode</td>
        </tr>
        <tr>
            <td><kbd>Scrollwheel</kbd></td>
            <td>Adjust zoom</td>
        </tr>
        <tr>
            <td><kbd>Ctrl</kbd>+<kbd>Scrollwheel</kbd></td>
            <td>Adjust speed</td>
        </tr>
        <tr>
            <td><kbd>Num-</kbd>/<kbd>Num+</kbd></td>
            <td>Increment zoom</td>
        </tr>
        <tr>
            <td><kbd>Ctrl</kbd>+<kbd>Num-</kbd>/<kbd>Num+</kbd></td>
            <td>Increment speed</td>
        </tr>
        <tr>
            <td><kbd>Alt</kbd>+<kbd>Num-</kbd></td>
            <td>Reset zoom</td>
        </tr>
        <tr>
            <td><kbd>Alt</kbd>+<kbd>Num+</kbd></td>
            <td>Reset speed</td>
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

- Unit name
- Camera mode
- Vision mode/Unit side
- 24-hour Clock
- Camera zoom/Unit depth
- Camera/Unit speed

#### 2.2.3 Map

The map overlay will show the current position of the free camera and all spectatable units. In free camera you can alt-click on the map to teleport the camera to the position of the cursor.

## 3. Dependencies

{% include dependencies_list.md component="spectator" %}
