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
|---------- |------------|----------|------|-------------|
|`ace_firedPlayer` | [_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile] | Local | Listen | ACE_player fires |
|`ace_firedPlayerNonLocal` | [_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile] | Local | Listen | Any other player fires |
|`ace_firedNonPlayer` | [_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile] | Local | Listen | AI fires |
|`ace_firedPlayerVehicle` | [_vehicle, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile] | Local | Listen | ACE_player turret fires |
|`ace_firedPlayerVehicleNonLocal` | [_vehicle, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile] | Local | Listen | Any other player turret fires |
|`ace_firedNonPlayerVehicle` | [_vehicle, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile] | Local | Listen | AI turret fires |

### 2.2 Medical (`ace_medical`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
|`ace_unconscious` | [_unit, _state(BOOL)] | Global | Listen | Unit's unconscious state changed |
|`ace_placedInBodyBag` | [_target, _bodyBag, _isGrave, _medic] | Global | Listen | Target placed into a bodybag Note: (Target will soon be deleted, target could be a bodybag) |
|`ace_placedInGrave` | [_target, _grave, _medic] | Global | Listen | Target placed into a grave, _grave will be objNull if `Create Grave Markers` is disabled Note: (Target will soon be deleted) |
|`ace_treatmentStarted` | [_caller, _target, _selectionName, _className, _itemUser, _usedItem, _createLitter] | Local | Listen | Treatment action has started (local on the _caller) |
|`ace_treatmentSucceded` | [_caller, _target, _selectionName, _className, _itemUser, _usedItem, _createLitter] | Local | Listen | Treatment action is completed (local on the _caller) |
|`ace_treatmentFailed` | [_caller, _target, _selectionName, _className, _itemUser, _usedItem, _createLitter] | Local | Listen | Treatment action has been interrupted (local on the _caller) |
|`ace_medical_handleUnitVitals` | [_unit, _deltaT] | Local | Listen | Vitals update ran for unit, _deltaT is the time elapsed since the previous vitals update (local to _unit) |
|`ace_medical_treatment_bandaged` | [_medic, _patient, _bodyPart, _className, _itemUser, _usedItem, _createLitter, _bandageEffectiveness] | Local | Listen | _medic has bandaged _patient, the array can be modified to change treatment parameters (local to _medic) |
|`ace_medical_overdose` | [_unit, _medication, _medicationDose, _overdoseThreshold, _incompatibleMed] | Local | Listen | _unit has overdosed on _medication by _overdoseThreshold - _medicationDose, overdoseThreshold was determined by _incompatibleMed (can be _medication itself or mixed incompatible medication) |

### 2.3 Interaction Menu (`ace_interact_menu`)
MenuType: 0 = Interaction, 1 = Self Interaction

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
|`ace_interactMenuOpened` | [_menuType] | Local | Listen | Interaction Menu Opened
|`ace_interactMenuClosed` | [_menuType] | Local | Listen | Interaction Menu Closed
|`ace_interact_menu_newControllableObject` | [_typeOf] | Local | Listen | New controlable object, only fires once per type (add self interactions)

### 2.4 Cargo (`ace_cargo`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
|`ace_addCargo` | [_item (CLASSNAME or OBJECT), _vehicle, _cargoCount] | Target | Callable | Scripted way to add cargo to vehicle |
|`ace_cargoLoaded` | [_item, _vehicle] | Global | Listen | Cargo has been Loaded into vehicle |
|`ace_cargoUnloaded` | [_item, _vehicle, _unloadType] | Global | Listen | Cargo has been Unloaded from vehicle |

### 2.5 Captives (`ace_captives`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
|`ace_captiveStatusChanged` | [_unit, _state(BOOL), _reason ("SetHandcuffed" or "SetSurrendered"), _caller] | Global | Listen | Unit's captivity state changed |
|`ace_captives_setSurrendered` | [_unit, _state(BOOL)] | Target | Callable | Sets a unit to either start or stop surrendering |
|`ace_captives_setHandcuffed` | [_unit, _state(BOOL)] | Target | Callable | Sets a unit to either start or stop being handcuffed |
|`ace_captives_escortingCaptive` | [_unit, _state(BOOL), _caller] | Local | Listen | Caller starting or stopping escort of unit |

### 2.6 Settings (`ace_common`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
|`ace_settingsInitialized` | [] | Local | Listen | All modules are read and settings are ready |
|`ace_settingChanged` | [_name,_value] | Local | Listen | A setting has been changed |

### 2.7 Tagging (`ace_tagging`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
|`ace_tagCreated` | [_tagObject, _texture, _tagAttachedTo (can be null), _unitThatCreated] | Global | Listen | Tag is created |

### 2.8 Explosives (`ace_explosives`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
|`ace_allowDefuse` | [_mine, _allow] | Global or Target | Callable | Set allowance of the dynamic defusal action on a mine |
|`ace_tripflareTriggered` | [_flareObject, _posAGL] | Global | Listen | Tripflare triggered |
|`ace_explosives_clackerAdded` | [_unit, _explosive, _id] | Local | Listen | Clacker added to explosive |
|`ace_explosives_place` | [_explosive, _dir, _pitch, _unit] | Global | Listen | Explosive is armed |
|`ace_explosives_setup` | [_explosive, _magClassname, _unit] | Global | Listen | Explosive is placed in the world |
|`ace_explosives_defuseStart` | [_explosive, _unit] | Global | Listen | Unit starts defusing explosive |
|`ace_explosives_defuse` | [_explosive, _unit] | Global | Listen | Explosive is safely defused |
|`ace_explosives_explodeOnDefuse` | [_explosive, _unit] | Global | Listen | Explosive blows up when trying to defuse |

### 2.9 Logistics Wirecutter (`ace_logistics`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
|`ace_wireCuttingStarted` | [_unit, _fence] | Global | Listen | Fence cutting started |

### 2.9 Refuel (`ace_refuel`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
|`ace_refuel_started` | [_source, _target, _nozzle, _unit] | Local | Listen | Refuelling has started |
|`ace_refuel_tick` | [_source, _target, _amount, _refuelContainer, _nozzle] | Local | Listen | Amount of fuel transferred in a tick |
|`ace_refuel_stopped` | [_source, _target, _nozzle] | Local | Listen | Refuelling has stopped |

### 2.10 Cook Off (`ace_cookoff`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
|`ace_cookoff_cookOff` | [_vehicle, _intensity, _instigator, _smokeDelayEnabled, _ammoDetonationChance, _detonateAfterCookoff, _fireSource, _canRing, _maxIntensity, _canJet] | Global | Listen | Vehicle cook-off has started |
|`ace_cookoff_cookOffBox` | [_box, _source, _instigator, _delay] | Global | Listen | Ammo box cook-off has started |
|`ace_cookoff_engineFire` | [_vehicle] | Global | Listen | Engine fire has started |

### 2.11 Attach (`ace_attach`)

| Event Key | Parameters | Locality | Type | Description |
|----------|---------|---------|---------|---------|
|`ace_attach_attached` | [_attachedObject, _itemClassname, _temporary] | Local | Listen | After an item was attached to a unit/vehicle. _temporary flag means a item is being re-attached after the player exits a vehicle |
|`ace_attach_detaching` | [_attachedObject, _itemName, _temporary] | Local | Listen | Just before an item gets detached/removed from a unit/vehicle. _temporary flag means its detached because the player unit entered a vehicle. |

### 2.12 Trenches (`ace_trenches`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
| `ace_trenches_placed` | [_unit, _trench] | Global | Listen | After trench object is placed by unit. |
| `ace_trenches_finished` | [_unit, _trench] | Global | Listen | After trench object is fully dug up by unit (100% progress). |

### 2.13 Medical GUI (`ace_medical_gui`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
| `ace_medical_gui_updateBodyImage` | [_ctrlGroup, _target, _selectionN] | Local | Listen | Allows mods to update any modifications they have made to the body image
| `ace_medical_gui_updateInjuryListGeneral` | [_ctrl, _target, _selectionN, _entries] | Local | Listen | Allows mods to update the general injury list by pushing to the _entries array
| `ace_medical_gui_updateInjuryListPart` | [_ctrl, _target, _selectionN, _entries, _bodyPartName] | Local | Listen | Allows mods to update the part injury list by pushing to the _entries array
| `ace_medical_gui_updateInjuryListWounds` | [_ctrl, _target, _selectionN, _woundEntries, _bodyPartName] | Local | Listen | Allows mods to update the wounds injury list by pushing to the _woundEntries array
| `ace_medical_gui_logListAppended` | [_ctrl, _row, _message, _unlocalizedMessage, _timeStamp, _arguments] | Local | Listen | After an entry is appended to the log list

### 2.14 Medical Treatment (`ace_medical_treatment`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
| `ace_medical_treatment_fullHealLocalMod` | [_patient] | Local | Listen | Called before a local unit is fully healed, mods can listen and apply their own healing logic

### 2.15 Medical Status (`ace_medical_status`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
| `ace_medical_status_getBloodLoss` | [_unit, _bloodLoss] | Local | Listen | Called when blood loss is calculated for a unit, mods can listen and modify the blood loss value by modifying the array

### 2.16 Interaction (`ace_interaction`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
| `ace_interaction_doorOpeningStarted` | [_house, _door, _animations] | Local | Listen | Called when local unit starts interacting with doors
| `ace_interaction_doorOpeningStopped` | [_house, _door, _animations] | Local | Listen | Called when local unit stops interacting with doors

### 2.17 Headless (`ace_headless`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
| `ace_headless_groupTransferPre` | [_group, _HC (OBJECT), _previousOwner, _idHC] | Target | Listen | Called just before a group is transferred from any machine to a HC. Called where group currently is local and on the HC, where group is going to be local.
| `ace_headless_groupTransferPost` | [_group, _HC (OBJECT), _previousOwner, _idHC, _transferredSuccessfully] | Target | Listen | Called just after a group is transferred from a machine to a HC. Called where group was local and on the HC, where group is now local. `_transferredSuccessfully` is passed so mods can actually check if the locality was properly transferred, as ownership transfer is not guaranteed.

### 2.18 Dragging (`ace_dragging`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
| `ace_dragging_cloneCreated` | [_clone, _corpse] | Local | Listen | Called when a clone used for dragging/carrying corpses is created
| `ace_dragging_cloneDeleted` | [_clone, _corpse] | Local | Listen | Called when a clone used for dragging/carrying corpses is deleted
| `ace_dragging_setupCarry` | [_unit, _target] | Local | Listen | Called when the unit starts the carrying animation for the target
| `ace_dragging_startedCarry` | [_unit, _target] | Local | Listen | Called when the unit starts successfully carrying the target. This event is called after `ace_dragging_setupCarry`.
| `ace_dragging_stoppedCarry` | [_unit, _target, _loadCargo] | Local | Listen | Called when the unit stops carrying the target. `_loadCargo` says if the target is being loaded as cargo/person or not.
| `ace_dragging_setupDrag` | [_unit, _target] | Local | Listen | Called when the unit starts the dragging animation for the target
| `ace_dragging_startedDrag` | [_unit, _target] | Local | Listen | Called when the unit starts successfully dragging the target. This event is called after `ace_dragging_setupDrag`.
| `ace_dragging_stoppedDrag` | [_unit, _target] | Local | Listen | Called when the unit stops dragging the target

### 2.19 HuntIR (`ace_huntir`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
| `ace_huntir_monitorOpened` | [_unit] | Local | Listen | Called when the monitor is opened
| `ace_huntir_monitorClosed` | [_unit] | Local | Listen | Called when the monitor is closed (may be fired multiple times when the monitor is closed by ACE and not the user)
| `ace_huntir_monitorStarted` | [_unit] | Local | Listen | Called when the monitor is started
| `ace_huntir_monitorSearching` | [_unit] | Local | Listen | Called when the monitor is searching
| `ace_huntir_monitorConnecting` | [_unit] | Local | Listen | Called when the monitor is connecting
| `ace_huntir_monitorConnected` | [_unit, _huntir] | Local | Listen | Called when the monitor is connected
| `ace_huntir_monitorNoGDS` | [_unit] | Local | Listen | Called when the monitor found no GDS

### 2.20 Mine detector (`ace_minedetector`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
| `ace_minedetector_detectorEnabled` | [_unit, _detectorType] | Local | Listen | Called when local unit turned on their mine detector
| `ace_minedetector_detectorDisabled` | [_unit, _detectorType] | Local | Listen | Called when local unit turned off their mine detector
| `ace_minedetector_mineDetected` | [_unit, _mine, _distance, _detectorType] | Local | Listen | Called when local unit has detected a mine

#### 2.21 PBO checking (`ace_common`)

| Event Key | Parameters | Locality | Type | Description |
|---------- |------------|----------|------|-------------|
|`ace_versioning_clientCheckDone` | [[_missingAddonsClient, _additionalAddonsClient, _olderVersionsClient, _newerVersionsClient]] | Local | Listen | When PBO checking has finished on a client |
|`ace_versioning_serverCheckDone` | [[_serverFiles, _serverVersions]] | Local | Listen | When PBO checking has finished on the server |

## 3. Usage
Also Reference [CBA Events System](https://github.com/CBATeam/CBA_A3/wiki/Custom-Events-System){:target="_blank"} documentation.

### 3.1 Adding / Removing Events

#### 3.1.1 Add Event

`CBA_fnc_addEventHandler` - Adds an event handler with the event name and returns the event handler ID.

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Event name | String | Required |
| 1  | Code block | Code | Required |
| **R** | Event ID | Number | Return value |

#### 3.1.2 Remove Event

`CBA_fnc_removeEventHandler` - Removes a specific event handler of the given event name, using the ID returned from `CBA_fnc_addEventHandler`.

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Event name | String | Required |
| 1  | Event ID | Number | Required |
| **R** | None | None | Return value |

### 3.2 Calling Events

#### 3.2.1 Local Event

`CBA_fnc_localEvent` - Calls an event only on the local machine, useful for inter-module events.

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Event name | String | Required |
| 1  | Arguments | Any | Required |
| **R** | None | None | Return value |

#### 3.2.2 Target Event

`CBA_fnc_targetEvent` - Calls an event only on the target machine or list of target machines.

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Event name | String | Required |
| 1  | Arguments | Any | Required |
| 2  | Target(s) | Object OR Number OR Array | Required |
| **R** | None | None | Return value |

#### 3.2.3 Server Event

`CBA_fnc_serverEvent` - Calls an event only on the server machine (dedicated or self-hosted).

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Event name | String | Required |
| 1  | Arguments | Any | Required |
| **R** | None | None | Return value |

#### 3.2.4 Global Event

`CBA_fnc_globalEvent` - Calls an event on all machines - the local machine, and the server machine.

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Event name | String | Required |
| 1  | Arguments | Any | Required |
| **R** | None | None | Return value |


### 3.3 Synchronized Events

#### 3.3.1 Add Synchronized Event

Adds a globally synchronized event handler which will expire events after the provided time-to-live, or the code returns true.

`ace_common_fnc_addSyncedEventHandler`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Event name | String | Required |
| 1  | Code block | Code | Required |
| 2  | Time to live | Number OR Code | Optional (default: `0`) |
| **R** | Event ID | Number | Return value |

#### 3.3.2 Remove Synchronized Event

Removes a specific event handler of the given event name, using the ID returned from `ace_common_fnc_addSyncedEventHandler`.

`ace_common_fnc_removeSyncedEventHandler`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Event name | String | Required |
| **R** | None | None | Return value |

#### 3.3.3 Call Synchronized Event

Calls a globally synchronized event, which will also be run on JIP players unless it has expired. Event will expire after the provided time-to-live, or the code returns true.

`ace_common_fnc_syncedEvent`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Event name | String | Required |
| 1  | Arguments | Any | Required |
| 2  | Time to live for this call | Number OR Code | Optional (default: `0`) |
| **R** | Event ID | Number | Return value |


### 3.4 Example

```sqf
// Event handler added on a target machine
["ace_interact_tapShoulder", ace_example_fnc_onTapShoulder] call CBA_fnc_addEventHandler;

// Event called on another machine (tapping above target machine)
["ace_interact_tapShoulder", [arguments], [target]] call CBA_fnc_targetEvent;
```
