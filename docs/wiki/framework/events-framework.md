---
layout: wiki
title: Events Framework
description: Explains how to use CBA event handlers with ACE3 events used to trigger or allow triggering of specific functionality and lists all documented events.
group: framework
order: 5
parent: wiki
mod: ace
---

## 1. Event Handlers

Event handlers in ACE3 are implemented through CBA's Event System. They should be used to trigger or allow triggering of specific functionality.


## 2. Events List
ACE3 uses many events internally, this is not a complete list; but it should list most publicly usable events.

### 2.1 Fired Event Handlers (`ace_common`)

Different events for what type of unit has fired.
E.G.: If you only need to do action when player's weapon fires, this will be faster than adding an XEH for everything.
The vehicle events will also have the following local variables available `_gunner (OBJECT), _turret (ARRAY)`.

| Event Key | Parameters | Locality | Type | Description |
|----------|---------|---------|---------|---------|---------|
|`ace_firedPlayer` | [_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile] | Local | Listen | ACE_player fires
|`ace_firedPlayerNonLocal` | [_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile] | Local | Listen | Any other player fires
|`ace_firedNonPlayer` | [_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile] | Local | Listen | AI fires
|`ace_firedPlayerVehicle` | [_vehicle, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile] | Local | Listen | ACE_player turret fires
|`ace_firedPlayerVehicleNonLocal` | [_vehicle, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile] | Local | Listen | Any other player turret fires
|`ace_firedNonPlayerVehicle` | [_vehicle, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile] | Local | Listen | AI turret fires

### 2.2 Medical (`ace_medical`)

| Event Key | Parameters | Locality | Type | Description |
|----------|---------|---------|---------|---------|---------|
|`ace_unconscious` | [_unit, _state(BOOL)] | Global | Listen | Unit's unconscious state changed
|`ace_placedInBodyBag` | [_target, _bodyBag] | Global | Listen | Target placed into a bodybag Note: (Target will soon be deleted)
|`ace_treatmentSucceded` | [_caller, _target, _selectionName, _className] | Local | Listen | Treatment action is completed (local on the _caller)

### 2.3 Interaction Menu (`ace_interact_menu`)
MenuType: 0 = Interaction, 1 = Self Interaction

| Event Key | Parameters | Locality | Type | Description |
|----------|---------|---------|---------|---------|---------|
|`ace_interactMenuOpened` | [_menuType] | Local | Listen | Interaction Menu Opened
|`ace_interactMenuClosed` | [_menuType] | Local | Listen | Interaction Menu Closed

### 2.4 Cargo (`ace_cargo`)

| Event Key | Parameters | Locality | Type | Description |
|----------|---------|---------|---------|---------|---------|
|`ace_addCargo` | [_item (CLASSNAME or OBJECT), _vehicle, _cargoCount] | Target | Callable | Scripted way to add cargo to vehicle
|`ace_cargoLoaded` | [_item, _vehicle] | Global | Listen | Cargo has been Loaded into vehicle
|`ace_cargoUnloaded` | [_item, _vehicle] | Global | Listen | Cargo has been Unloaded from vehicle

### 2.5 Captives (`ace_captives`)

| Event Key | Parameters | Locality | Type | Description |
|----------|---------|---------|---------|---------|---------|
|`ace_captiveStatusChanged` | [_unit, _state(BOOL), _reason ("SetHandcuffed" or "SetSurrendered")] | Global | Listen | Unit's captivity state changed
|`ace_captives_setSurrendered` | [_unit, _state(BOOL)] | Target | Callable | Sets a unit to either start or stop surrendering
|`ace_captives_setHandcuffed` | [_unit, _state(BOOL)] | Target | Callable | Sets a unit to either start or stop being handcuffed

### 2.6 Settings (`ace_common`)

| Event Key | Parameters | Locality | Type | Description |
|----------|---------|---------|---------|---------|---------|
|`ace_settingsInitialized` | [] | Local | Listen | All modules are read and settings are ready
|`ace_settingChanged` | [_name,_value] | Local | Listen | A setting has been changed

### 2.7 Tagging (`ace_tagging`)

| Event Key | Parameters | Locality | Type | Description |
|----------|---------|---------|---------|---------|---------|
|`ace_tagCreated` | [_tagObject, _texture, _tagAttachedTo (can be null), _unitThatCreated] | Global | Listen | Tag is created

### 2.8 Explosives (`ace_explosives`)

| Event Key | Parameters | Locality | Type | Description |
|----------|---------|---------|---------|---------|---------|
|`ace_tripflareTriggered` | [_flareObject, [_posX, _posY, _posZ]] | Global | Listen | Tripflare triggered

### 2.9 Logistics Wirecutter (`ace_logistics`)

| Event Key | Parameters | Locality | Type | Description |
|----------|---------|---------|---------|---------|---------|
|`ace_wireCuttingStarted` | [_unit, _fence] | Global | Listen | Fence cutting started


## 3. Usage
Also Reference [CBA Events System](https://github.com/CBATeam/CBA_A3/wiki/Custom-Events-System){:target="_blank"} documentation.

### 3.1 Adding / Removing Events

#### 3.1.1 Add Event

`CBA_fnc_addEventHandler` - Adds an event handler with the event name and returns the event handler ID.

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Event name | String | Required
1  | Code block | Code | Required
**R** | Event ID | Number | Return value

#### 3.1.2 Remove Event

`CBA_fnc_removeEventHandler` - Removes a specific event handler of the given event name, using the ID returned from `CBA_fnc_addEventHandler`.

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Event name | String | Required
1  | Event ID | Number | Required
**R** | None | None | Return value

### 3.2 Calling Events

#### 3.2.1 Local Event

`CBA_fnc_localEvent` - Calls an event only on the local machine, useful for inter-module events.

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Event name | String | Required
1  | Arguments | Any | Required
**R** | None | None | Return value

#### 3.2.2 Target Event

`CBA_fnc_targetEvent` - Calls an event only on the target machine or list of target machines.

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Event name | String | Required
1  | Arguments | Any | Required
2  | Target(s) | Object OR Number OR Array | Required
**R** | None | None | Return value

#### 3.2.3 Server Event

`CBA_fnc_serverEvent` - Calls an event only on the server machine (dedicated or self-hosted).

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Event name | String | Required
1  | Arguments | Any | Required
**R** | None | None | Return value

#### 3.2.4 Global Event

`CBA_fnc_globalEvent` - Calls an event on all machines - the local machine, and the server machine.

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Event name | String | Required
1  | Arguments | Any | Required
**R** | None | None | Return value


### 3.3 Synchronized Events

#### 3.3.1 Add Synchronized Event

Adds a globally synchronized event handler which will expire events after the provided time-to-live, or the code returns true.

`ace_common_fnc_addSyncedEventHandler`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Event name | String | Required
1  | Code block | Code | Required
2  | Time to live | Number OR Code | Optional (default: `0`)
**R** | Event ID | Number | Return value

#### 3.3.2 Remove Synchronized Event

Removes a specific event handler of the given event name, using the ID returned from `ace_common_fnc_addSyncedEventHandler`.

`ace_common_fnc_removeSyncedEventHandler`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Event name | String | Required
**R** | None | None | Return value

#### 3.3.3 Call Synchronized Event

Calls a globally synchronized event, which will also be run on JIP players unless it has expired. Event will expire after the provided time-to-live, or the code returns true.

`ace_common_fnc_syncedEvent`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Event name | String | Required
1  | Arguments | Any | Required
2  | Time to live for this call | Number OR Code | Optional (default: `0`)
**R** | Event ID | Number | Return value


### 3.4 Example

```js
// Event handler added on a target machine
["ace_interact_tapShoulder", ace_example_fnc_onTapShoulder] call CBA_fnc_addEventHandler;

// Event called on another machine (tapping above target machine)
["ace_interact_tapShoulder", [arguments], [target]] call CBA_fnc_targetEvent;
```
