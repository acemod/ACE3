---
layout: wiki
title: Events Framework
description: Explains how to use ACE3 event handlers used to trigger or allow triggering of specific functionality and lists all documented events.
group: framework
order: 5
parent: wiki
---

## 1. Event Handlers

Event handlers in ACE3 are implemented through our event system. They should be used to trigger or allow triggering of specific functionality. The functions are listed and described below with a brief explanation.


## 2. Events List

**Note:** This list is combined from other framework pages, where events are documented separately for each module. Each event listed here has information about its source or owner, which is a link to its framework page where it is documented in better detail.

### 2.1 Listenable

Event Name | Source | Passed Parameter(s) | Locality
---------- | ------ | ------------------- | --------
`GlassesChanged` | [goggles](http://ace3mod.com/wiki/framework/goggles-framework.html) | `[_glassesClass]` | Local
`GlassesCracked` | [goggles](http://ace3mod.com/wiki/framework/goggles-framework.html) | `[_unit]` | Local
`ace_missileguidance_handoff` | [missile-guidance](http://ace3mod.com/wiki/framework/missile-guidance-framework.html) | `[_target, _args]` | Global
`overpressure` | [overpressure](http://ace3mod.com/wiki/framework/overpressure-framework.html) | `[_firer, _position, _direction, _weapon]` | Target
`reloadLauncher` | [reloadlaunchers](http://ace3mod.com/wiki/framework/reloadlaunchers-framework.html) | `[_unit, _target, _weapon, _magazine]` | Target

### 2.2 Callable

Event Name | Owner | Passed Parameter(s) | Locality
---------- | ----- | ------------------- | --------



## 3. Usage

### 3.1 Adding / Removing Events

#### 3.1.1 Add Event

Adds an event handler with the event name and returns the event handler ID.

`ace_common_fnc_addEventHandler`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Event name | String | Required
1  | Code block | Code | Required
**R** | Event ID | Number | Return value

#### 3.1.2 Remove Event

Removes a specific event handler of the given event name, using the ID returned from `ace_common_fnc_addEventHandler`.

`ace_common_fnc_removeEventHandler`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Event name | String | Required
1  | Event ID | Number | Required
**R** | None | None | Return value


#### 3.1.3 Remove All Events

Removes all event handlers of the given event name.

`ace_common_fnc_removeAllEventHandlers`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Event name | String | Required
**R** | None | None | Return value


### 3.2 Calling Events

#### 3.2.1 Local Event

Calls an event only on the local machine, useful for inter-module events.

`ace_common_fnc_localEvent`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Event name | String | Required
1  | Arguments | Any | Required
**R** | None | None | Return value

#### 3.2.2 Server Event

Calls an event only on the server machine (dedicated or self-hosted).

`ace_common_fnc_serverEvent`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Event name | String | Required
1  | Arguments | Any | Required
**R** | None | None | Return value

#### 3.2.3 Global Event

Calls an event on all machines - the local machine, and the server machine.

`ace_common_fnc_globalEvent`

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

```c++
// Event handler added on a target machine
["tapShoulder", ace_example_onTapShoulder] call ace_common_fnc_addEventHandler;

// Event called on another machine (tapping above target machine)
["tapShoulder", [target], [arguments]] call ace_common_fnc_targetEvent;
```
