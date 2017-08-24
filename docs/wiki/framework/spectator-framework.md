---
layout: wiki
title: Spectator Framework
description: Explains how to set-up and manipulate the ACE3 spectator system.
group: framework
parent: wiki
mod: ace
version:
  major: 3
  minor: 2
  patch: 0
---

## 1. Enabling Spectator

By default, the ACE3 spectator system does nothing - meaning existing missions will behave exactly as before. There are two tools available to enable the spectator system in your missions:

- An `ace_spectator` [respawn template](https://community.bistudio.com/wiki/Arma_3_Respawn) which can be enabled via description.ext or through the eden editor multiplayer attributes
- The public function `ace_spectator_fnc_setSpectator` which can be used at any time to open/close the spectator interface

With respawn template `ace_spectator` in effect players will enter spectator mode upon death and exit upon respawn (if there is respawn). The template is compatible with all respawn types (except `None`/`0`) and allows you to take advantage of the vanilla framework's flexibility (combining templates, side specific templates, etc.).

<div class="panel callout">
   <h5>Note:</h5>
   <p>It's worth noting that templates "MenuPosition" and "MenuInventory" are not currently compatible with the "ace_spectator" template.</p>
</div>

An example description.ext file using the respawn template:

```cpp
respawn = 3; // Players respawn at base
respawnDelay = 180; // Players spectate for 3 minutes between respawns
respawnTemplates[] = {"ace_spectator"}; // Enables the spectator template for all
respawnTemplatesWest[] = {"ace_spectator","Counter","Wave"}; // Wave respawns and a countdown for west side
```

## 2. Global Settings

To tweak the default spectator experience three settings are provided:

- **AI Enabled:** Whether AI will appear in the unit list and be spectatable. Defaults to only players.
- **Camera modes:** Which camera modes (1PP, 3PP and Free) are available to use by default.
- **Vision modes:** Which vision modes (Normal, Night and Thermal) are available to use by default.

Note that these settings govern the default spectator behaviour. Through the use of public functions, the spectator experience can be more finely controlled (e.g. to limit each player to only be able to spectate units on their side) on top of these.

## 3. Events

### 3.1 Listenable

Event Name | Passed Parameter(s) | Locality | Description
---------- | ----------- | ------------------- | --------
`ace_spectatorSet` | [_isSpectator, _player] | Global | Player's spectator status was changed

## 4. Scripting

While the majority of scenarios can be set up as desired using only the settings provided, some require more specific limitations on what functionality is available to whom. All of the following public functions are provided to try and accommodate for such needs.

### 4.1 Change the local player's spectator status

`ace_spectator_fnc_setSpectator`
If the interface is not forced then the player can close spectator with the <kbd>ESC</kbd> key.

If the player is hidden they will become invisible, invulnerable and removed from their group until they exit spectator.

```cpp
 * Arguments:
 * 0: Spectator state of local client <BOOL> (default: true)
 * 1: Force interface <BOOL> (default: true)
 * 2: Hide player (if alive) <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_spectator_fnc_setSpectator
```

### 4.2 Whitelist/Blacklist units available to spectate

`ace_spectator_fnc_updateUnits`
Whitelisted units will always show in the unit list regardless of the usual filtering applied (with the exception of the local player, who will never be shown). Blacklisted units will always be filtered out of the unit list (this overrides the whitelist).

Note that this function takes local effect, so only the local player will see these changes.

```cpp
 * Arguments:
 * 0: Units to show in the list <ARRAY>
 * 1: Units to hide in the list <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [allPlayers, [player]] call ace_spectator_fnc_updateUnits
 ```
 
### 4.3 Add/Remove sides available to spectate

`ace_spectator_fnc_updateSides`
By default, units on all 4 sides (`west`, `east`, `independent` and `civilian`) are available to spectate provided they pass through basic filtering (AI setting, simulated and visible). By removing a side, you effectively add a layer of filtering that removes units belonging to that side from the spectator unit list. Adding sides is simply available to reverse a removal - you cannot add a side beyond the main 4 (e.g. `sideLogic`) as those units do not appear in the `allUnits` array (you could whitelist a unit belonging to such a side).

Note that this function takes local effect, so only the local player will see these changes.

```cpp
 * Arguments:
 * 0: Sides to add <ARRAY>
 * 1: Sides to remove <ARRAY>
 *
 * Return Value:
 * Sides available <ARRAY>
 *
 * Example:
 * [[west], [east,civilian]] call ace_spectator_fnc_updateSides
 ```

### 4.4 Add/Remove available camera modes

`ace_spectator_fnc_updateCameraModes`
You can change the spectator camera modes available at any point during the mission and independently on different machines with this function (e.g. if you only want one side of players to have a free camera). Remember that the **Camera modes** setting will change which modes are available to everyone by default - changes with this function will override that. 

Note that this function takes local effect, so only the local player will experience these changes.

```cpp
 * Possible camera modes are:
 *   - 0: Free
 *   - 1: First person
 *   - 2: Follow
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
 ```

### 4.5 Add/Remove available vision modes

`ace_spectator_fnc_updateVisionModes`
You can change the spectator vision modes available at any point during the mission and independently on different machines with this function (e.g. if you only want one side of players to have night vision). Remember that the **Vision modes** setting will change which modes are available to everyone by default (if thermal is enabled via the setting then both black and white hot are available) - changes with this function will override that. 

Note that this function takes local effect, so only the local player will experience these changes.

```cpp
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
 ```

### 4.6 Set the camera mode/focus/vision/position/direction

`ace_spectator_fnc_setCameraAttributes`
You can change any of the listed camera attributes at any time during a mission (including before spectator has opened if you want to pre-set them to change the initial view). All arguments are optional and default to no change (if you use `nil`).

Note that this function takes local effect, so only the local player will experience these changes.

```cpp
 * Arguments:
 * 0: Camera mode <NUMBER>
 *   - 0: Free
 *   - 1: First Person
 *   - 2: Follow
 * 1: Camera focus <OBJECT or BOOL>
 * 2: Camera vision <NUMBER>
 *   - -2: Normal
 *   - -1: Night vision
 *   -  0: Thermal white hot
 *   -  1: Thermal black hot
 *   - ...
 * 3: Camera position (ATL) <ARRAY>
 * 4: Camera direction (0 - 360) <NUMBER>
 *
 * Notes:
 * - If camera mode is not free and camera has no focus, random will be used
 * - To remove any current camera focus in free cam, use objNull
 * - To select a random camera focus, use a boolean
 *
 * Return Value:
 * None
 *
 * Example:
 * [1, objNull] call ace_spectator_fnc_setCameraAttributes
 ```

### 4.7 Get the camera mode/focus/vision/position/direction

`ace_spectator_fnc_getCameraAttributes`
Returns an array of the listed camera attributes (see `setCameraAttributes` for more details) for the local player. If the spectator camera is not currently active any pre-set attributes will be returned (otherwise default values will be returned - position will be `[0,0,0]` if unset).

```cpp
 * Arguments:
 * None
 *
 * Return Value:
 * [Mode, Focus, Vision, Position, Direction] <ARRAY>
 *
 * Example:
 * [] call ace_spectator_fnc_getCameraAttributes
 ```

### 4.8 Get all players currently spectating

`ace_spectator_fnc_players`
Will return both alive and dead players (note that dead player corpses are never deleted until the player has respawned - even when `deleteVehicle` is used on them).

```cpp
 * Arguments:
 * None
 *
 * Return Value:
 * Spectator Players <ARRAY>
 *
 * Example:
 * [] call ace_spectator_fnc_players
 ```
