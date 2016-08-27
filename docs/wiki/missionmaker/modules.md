---
layout: wiki
title: Modules
description: A list of all modules in ACE3 and all the settings that can be tweaked by them
group: missionmaker
order: 5
parent: wiki
---

### 1.5 Check PBOs
*Part of: ace_common*

If you are worried that players haven't updated ACE3 or other mods to the version you're using on the server, you can place the "Check PBOs" module on your map. You can choose one of three posible actions that are being executed when a player joins that has a wrong version of ACE3 or an other mod:

- Warn once
- Warn permanent
- Kick

**Settings:**

Name | Type | Description | Default value
---- | ---- | ---- | ---- |
Action | Option | What to do with people who do not have the right PBOs. | Warn once
Check all addons | Boolean | Check all addons instead of only those of ACE3? | No

 **Whitelist**

You can make a whitelist of addons that don't have to be on the server. If you want to use the "Check all addons" option of this module and allow the usage of client side modifications like Blastcore or JSRS, you have to list them here.
The list must be in the following format: `["ADDON1","ADDON2",...]` where the addons are CfgPatches references to all PBOs of the optional mod. To figure these out, you can use the scripting command `activatedAddons` in the editor while those mods are enabled.

Example 1: @Blastcore-A3:<br>
```
["warfxpe","blastcore_vep"]
```

Example 2: @JSRS:<br>
```
[TBD]
```

Example 3: @JSRS + @Blastcore-A3:<br>
```
[TBD, "warfxpe","blastcore_vep"]
```


### 1.22 Vehicle Lock
*Part of: ace_vehiclelock*

These modules allow you to lock and unlock vehicles and their inventory using a key. Players don't receive a key automatically; for key names, see [Class names Wiki](http://ace3mod.com/wiki/missionmaker/class-names.html#vehicle-lock).

#### 1.22.1 Vehicle Key Assign
Sync with vehicles and players. Will handout custom keys to players for every synced vehicle. Only valid for objects present at mission start.
Example: `[bob, car1, true] call ACE_VehicleLock_fnc_addKeyForVehicle;` - will add a key to bob and program it to work only on car1

#### 1.22.2.1 Vehicle Lock Setup
Settings for lockpick strength and initial vehicle lock state. Removes ambiguous lock states.

**Settings:**

Name | Type | Description | Default value
---- | ---- | ---- | ---- |
Lock Vehicle Inventory? | Boolean | Locks the inventory of locked vehicles. | No
Vehicle Starting Lock State | Option | Set lock state for all vehicles (removes ambiguous lock states). | "As Is"
Default Lockpick Strength | Number | Default Time to lockpick (in seconds). | 10

#### 1.22.2.2 Vehicle setVariables
* `ACE_VehicleLock_lockSide` - SIDE: overrides a vehicle's side, allowing locking and unlocking using a different side's key. For example: Unlocking INDEP vehicles with a BLUFOR key.
* `ACE_vehicleLock_lockpickStrength` - NUMBER: seconds, determines how long lockpicking with take, overrides the value set in the module for a specific vehicle of the mission maker's choice.


### 1.24 Weather
*Part of: ace_weather*

This module allows you to customize the weather settings.

<div class="panel callout">
    <h5>Note:</h5>
    <p>ACE3 Weather overrides weather settings (editor, mission settings) and automatically calculates wind, temperature and pressure according to map location, date, time of day and cloud coverage and allows the weather to evolve realistically as the simulation progresses. Weather synchronization occurs between all clients. <br>Adjustment of the weather is possible by modifying the <code>overcast</code> value (for example: <code>0.7</code> may result in intermittent rain).</p>
</div>

**Settings:**

Name | Type | Description | Default value
---- | ---- | ---- | ---- |
Weather propagation | Boolean | Enables sever side weather propagation.(This is responsible for synchronizing weather between all clients. Disabling it is **NOT** recommended). | Yes
ACE3 Weather | Boolean | Overrides the default weather with ACE3 weather (map based)(This can be disabled without affecting the weather propagation above. Useful if you prefer changing weather settings manually). | Yes
Sync Rain | Boolean | Synchronizes rain. | Yes
Sync Wind | Boolean | Synchronizes wind. | Yes
Sync Misc | Boolean | Synchronizes lightnings, rainbow, fog, ... | Yes
Update Interval | Number | Defines the interval (seconds) between weather updates. | 60

### 1.25 Wind Deflection
*Part of: ace_winddeflection*

This module allows you to define when Wind Deflection is active.

<div class="panel callout">
    <h5>Note:</h5>
    <p>Wind Deflection is compatible with Advanced Ballistics and allows the following combinations:</p>
    <ul>
        <li>Only Wind Deflection</li>
        <li>Only Advanced Ballistics</li>
        <li>Combined Wind Deflection + Advanced Ballistics</li>
    </ul>
</div>

**Settings:**

Name | Type | Description | Default value
---- | ---- | ---- | ---- |
Wind Deflection | Boolean | Enables Wind Deflection. | Yes
Vehicle Enabled | Boolean | Enables Wind Deflection for static/vehicle gunners. | Yes
Simulation Interval | Number | Defines the interval between every calculation step. | 0.05
Simulation Radius | Number | Defines the radius around the player (in meters) at which projectiles are wind deflected. | 3000


## 4. ACE3 Mission Modules
*Part of: ace_missionmodules*

### 4.1 Ambiance Sounds

Used for ambiance sounds loop (synced across MP).

This module randomizes the time when the sound file is played and the position where the sound file is played (If "Follow Players" is set to No).
`Minimal Distance` and `Maximal Distance` influence the position from where the sound file is played. Setting both values to 0 forces the module to play the sound from where it was placed in the editor.
`Minimal Delay` and `Maximal Delay` work in a similar fashion but are used to randomize when the sound file is played. Setting both values to 0 plays the sound from mission start.

**Settings:**

Name | Type | Description | Default value
---- | ---- | ---- | ---- |
Sounds | String | Class names of the ambiance sounds played. Separated by ','. (Example: `radio_track_01, electricity_loop`)|
Minimal Distance | Number | Used for calculating a random position and sets the minimal distance between the players and the played sound file(s) (in meters) | 400
Maximum Distance | Number | Used for calculating a random position and sets the maximum distance between the players and the played sound file(s) (in meters) | 900
Minimal Delay | Number | Minimal delay (in seconds) between sounds played | 10
Maximum Delay | Number | Maximum delay (in seconds) between sounds played | 10
Follow Players | Boolean | Follow players. If set to false, loop will play sounds only nearby logic position. | No
Volume | Number | The volume of the sounds played. | 1
