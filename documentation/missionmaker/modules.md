---
layout: wiki
title: Modules
description: A list of all modules in ACE3 and all the settings that can be tweaked by them
group: missionmaker
order: 5
parent: wiki
---

## 1. ACE
### 1.1 Advanced Ballistics
*Part of: ace_advanced_ballistics*

This module allows to enable advanced external- and internal ballistics.

**Settings:**

1. **Advanced Ballistics (Boolean)**<br>
Enables advanced ballistics.<br>
`Default value: No`
2. **Always Enabled For Snipers (Boolean)**<br>
Always enables advanced ballistics when high power optics are used.<br>
`Default value: Yes`
3. **Disabled In FullAuto Mode (Boolean)**<br>
Disables the advanced ballistics during full auto fire.<br>
`Default value: No`
4. **Disabled For Non Local Players (Boolean)**<br>
Disables the advanced ballistics for bullets coming from other players (enable this if you encounter frame drops during heavy firefights in multiplayer).<br>
`Default value: Yes`
5. **Enable Ammo Temperature Simulation (Boolean)**<br>
Muzzle velocity varies with ammo temperature.<br>
`Default value: Yes`
6. **Enable Barrel Length Simulation (Boolean)**<br>
Muzzle velocity varies with barrel length.<br>
`Default value: Yes`
7. **Enable Bullet Trace Effect (Boolean)**<br>
Enables a bullet trace effect to high caliber bullets (only visible when looking through high power optics).<br>
8. **Simulation Interval (Number)**<br>
Defines the interval between every calculation step.<br>
`Default value: 0.05`
9. **Simulation Radius (Number)**<br>
Defines the radius around the player (in meters) at which advanced ballistics are applied to projectiles.<br>
`Default value: 3000`

### 1.2 Allow Config Export
*Part of: ace_Optionmenu*

This modules allows to export all current ACE settings from the ACE Option menu to the clipboard and RPT file.

1. **Allow (Boolean)**<br>
Enables the "export" button in the ACE Option menu<br>
`Default value: Yes`

### 1.3 BlueForceTracking
*Part of: ace_map*

When adding the "Blue Force Tracking" module to your mission it adds map markers to every group on the players side and refreshes them in certain configurable interval (in seconds). The module takes the group type into account and uses the proper NATO icon for each marker.

**Settings:**

1. **Interval (Number)**<br>
How often the markers should be refreshed (in seconds).<br>
`Default value: 1`
2. **Hide AI Groups (Boolean)**<br>
Hide markers for "AI only" groups.<br>
`Default value: No`

### 1.4 Check PBOs
*Part of: ace_common*

If you are worried that players haven't updated ACE or other mods to the version you're using on the server, you can place the "Check PBOs" module on your map. You can choose one of three posible actions that are being executed when a player joins that has a wrong version of ACE or an other mod:

* Warn once
* Warn permanent
* Kick

**Settings:**

1. **Action (Option)**<br>
What to do with people who do not have the right PBOs.<br>
`Default value: "Warn once"`

2. **Check all addons (Boolean)**<br>
Check all addons instead of only those of ACE?<br>
`Default value: "No"`

3. **Whitelist**<br>
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


### 1.5 Explosive System
*Part of: ace_explosive*

The "Explosive System" module lets you tweak the settings for the new explosive system that ACE introduces.

**Settings:**

1. **Require specialists? (Boolean)**<br>
Require explosive specialists to disable explosives.<br>
`Default value: No`
2. **Punish non-specialists? (Boolean)**<br>
Increase the time it takes to complete actions for non-specialists.<br>
`Default value: Yes`


### 1.6 Friendly Fire Messages
*Part of: ace_respawn*

The "Friendly Fire Messages" module triggers a message when a player kills a friendly or civilian unit. This module isn't needed on servers with a low difficulty setting.


### 1.7 Hearing
*Part of: ace_hearing*

Placing this modules allows you to disable combat deafness usually triggerd by loud explosions or heavy weapons in a players proximity.

**Settings:**

1. **Enable combat deafness? (Boolean)***<br>
Enable combat deafness?<br>
`Default value: Yes`


### 1.8 Interaction System
*Part of: ace_interaction*

This module allows you to tweak if players should be able to use team management functions (e.g. "switch group", "become leader").

**Settings:**

1. **Enable Team Management (Boolean)**<br>
Should players be allowed to use the Team Management Menu?.<br>
`Default value: Yes`

### 1.9 Make Unit Surrender
*Part of: ace_captives*

Syncing units to that module sets them in the captive state with their arms behind their back. Usefull for e.g. hostage rescue missions. 


### 1.10 Map
*Part of: ace_map*

ACE3 introdcues a bit more realism for the vanilla Arma 3 map and how it behaves. Some of these settings can be toggled by this module. 

**Settings:**

1. **Map illumination? (Boolean)**<br>
Calculate dynamic map illumination based on light conditions?.<br>
`Default value: Yes`
2. **Map shake? (Boolean)**<br>
Make map shake when walking?.<br>
`Default value: Yes`
3. **Limit map zoom? (Boolean)**<br>
Limit the amount of zoom available for the map?.<br>
`Default value: No`
4. **Show cursor coordinates? (Boolean)**<br>
Show the grid coordinates on the mouse pointer?.<br>
`Default value: No`


### 1.11 MicroDAGR Map Fill
*Part of: ace_microdagr*

Controls how much data is filled on the microDAGR items. Less data restricts the map view to show less on the minimap.

**Settings:**

1. **MicroDAGR Map Fill (Option)**<br>
How much map data is filled on MicroDAGR's.<br>
`Default value: "Full Satellite + Buildings"`


### 1.12 MK6 Settings
*Part of: ace_mk6mortar*

ACE3 now includes the first iteration of getting a less arcady point and click mortar experience. 
Placing this modules allows you to enable the increased realism in game. 

**Settings:**

1. **Air Resistance (Boolean)**<br>
For Player Shots, Model Air Resistance and Wind Effects.<br>
`Default value: Yes`
2. **Allow MK6 Computer (Boolean)**<br>
Show the Computer and Rangefinder (these **NEED** to be removed if you enable air resistance).<br>
`Default value: No`
3. **Allow MK6 Compass (Boolean)**<br>
Show the MK6 Digital Compass.<br>
`Default value: Yes`

### 1.13 Name Tags
*Part of: ace_nametags*

This module allows you to tweak the settings for player names tags.

**Settings:**

1. **Player Names View Distance (Number)**<br>
Distance (in meters) at which player names are shown.<br>
`Default value: 5`
2. **Show name tags for AI? (Option)**<br>
Show the name and rank tags for friendly AI units, or by default allows players to choose it on their own.<br>
`Default value: "Do Not Force"`
3. **Show crew info? (Option)**<br>
Show vehicle crew info, or by default allows players to choose it on their own.<br>
`Default value: "Do Not Force"`
4. **Show for Vehicles? (Boolean)**<br>
Show cursor NameTag for vehicle commander (only if client has name tags enabled).<br>
`Default value: No`


### 1.14 Rallypoint System
*Part of: ace_respawn*

This module enables Mission Makers to specificly enable units to move a rallypoint. Every unit that is synced with that module is able to move a rallypoint.

<div class="panel callout">
    <h5>Note:</h5>
    <p>It's important to mention that this doesn't work for player who join during a mission (JIP = Join in progress). That's something we can't change because that's the way Bohemia has implemented their module framework.</p>
</div>

To enable JIP players to move rally points have a look at [ACE Rallypoints](./mission-tools.html#1.-ace-rallypoints).


### 1.15 Respawn System
*Part of: ace_respawn*

The "Respawn System" module enables players to respawn with the gear they had before dying and to remove bodies of players after a configurable interval (in seconds).

**Settings:**

1. **Save Gear? (Boolean)**<br>
Respawn with the gear a player had just before his death.<br>
`Default value: No`

### 1.16 SwitchUnits System
*Part of: ace_switchunits*

The [SwitchUnits System](./mission-tools.html#2.-ace-switchunits) enables players to control certain AI units on the map. 

**Settings:**

1. **Switch To West? (Boolean)**<br>
Allow switching to west units?<br>
`Default value: No`
2. **Switch To East? (Boolean)**<br>
Allow switching to east units?<br>
`Default value: No`
3. **Switch To Independent? (Boolean)**<br>
Allow switching to independent units?<br>
`Default value: No`
4. **Switch To Civilian? (Boolean)**<br>
Allow switching to civilian units?<br>
`Default value: No`
5. **Enable Safe Zone? (Boolean)**<br>
Enable a safe zone around enemy units? Players can't switch to units inside of the safe zone.<br>
`Default value: Yes`
6. **Safe Zone Radius (Number)**<br>
The safe zone around players from a different team (in meters)<br>
`Default value: 200`


### 1.17 Vehicle Lock
*Part of: ace_vehiclelock*

#### 1.17.1 Vehicle Key Assign
Sync with vehicles and players.  Will handout custom keys to players for every synced vehicle. Only valid for objects present at mission start.

#### 1.17.2 Vehicle Lock Setup
Settings for lockpick strength and initial vehicle lock state. Removes ambiguous lock states.

**Settings:**

1. **Lock Vehicle Inventory? (Boolean)**<br>
Locks the inventory of locked vehicles<br>
`Default value: No`
2. **Vehicle Starting Lock State (Option)**<br>
Set lock state for all vehicles (removes ambiguous lock states)<br>
`Default value: "As Is"`
3. **Default Lockpick Strength (Number)**<br>
Default Time to lockpick (in seconds)<br>
`Default value: 10`


### 1.18 Weather
*Part of: ace_weather*

This module allows you to customize the weather settings.

<div class="panel callout">
    <h5>Note:</h5>
    <p>ACE Weather overrides weather settings (editor, mission settings) and automatically calculates wind, temperature and pressure according to map location, date, time of day and cloud coverage and allows the weather to evolve realistically as the simulation progresses. Weather synchronization occurs between all clients.
- Adjustment of the weather is possible by modifying the <code>overcast</code> value (for example: 0.7 may result in intermittent rain) or disabling the feature</p>
</div>


**Settings:**

1. **Weather propagation (Boolean)**<br>
Enables sever side weather propagation.<br>
`Default value: Yes`
2. **ACE Weather (Boolean)**<br>
Overrides the default weather with ACE weather (map based).<br>
`Default value: Yes`
3. **Sync Rain (Boolean)**<br>
Synchronizes rain.<br>
`Default value: Yes`
3. **Sync Wind (Boolean)**<br>
Synchronizes wind.<br>
`Default value: Yes`
3. **Sync Misc (Boolean)**<br>
Synchronizes lightnings, rainbow, fog, ...<br>
`Default value: Yes`
4. **Update Interval (Number)**<br>
Defines the interval (seconds) between weather updates.<br>
`Default value: 60`
    
### 1.19 Wind Deflection
*Part of: ace_winddeflection*

This module allows you to define when wind deflection is active.

<div class="panel callout">
    <h5>Note:</h5>
    <p>Wind Deflection doesn't work in combination with Advanced Ballistics. If the Advanced Ballistics module is placed Wind deflection will exit and won't trigger.</p>
</div>

**Settings:**

1. **Wind Deflection (Boolean)**<br>
Enables wind deflection.<br>
`Default value: Yes`
2. **Vehicle Enabled (Boolean)**<br>
Enables wind deflection for static/vehicle gunners.<br>
`Default value: Yes`
3. **Simulation Interval (Number)**<br>
Defines the interval between every calculation step.<br>
`Default value: 0.05`
4. **Simulation Radius (Number)**<br>
Defines the radius around the player (in meters) at which projectiles are wind deflected.<br>
`Default value: 3000`


### 1.20 LSD Vehicles
*Part of: ace_core*

And then there's the "LSD Vehicles" module &hellip; it does 'something' to all vehicles synced to that module.
<div class="videoWrapper">
    <iframe src="https://www.youtube.com/embed/X3e0LTexEok" frameborder="0" allowfullscreen></iframe>
</div>

## 2. ACE Medical
*Part of: ace_medical*

### 2.1 Medical Settings

This module allows to tweak all the medical settings used in ACE3

**Settings:**

1. **Medical Level (Option)**<br>
What is the medical simulation level?<br>
`Default value: "Basic"`
2. **Medics setting (Option)**<br>
What is the level of detail preferred for medics?<br>
`Default value: "Normal"`
3. **Enable Litter (Boolean)**<br>
Enable litter being created upon treatment.<br>
`Default value: "Normal"`
4. **Life time of litter objects (Number)**<br>
How long should litter objects stay? In seconds. -1 is forever.<br>
`Default value: 1800`
5. **Enable Screams (Boolean)**<br>
Enable screaming by injured units.<br>
`Default value: Yes`
6. **Player Damage (Number)**<br>
What is the damage a player can take before being killed?<br>
`Default value: 1`
7. **AI Damage (Number)**<br>
What is the damage an AI can take before being killed?<br>
`Default value: 1`
8. **AI Unconsciousness (Option)**<br>
Allow AI to go unconscious.<br>
`Default value: "50/50"`
9. **Prevent instant death (Boolean)**<br>
Have a unit move to unconscious instead of death.<br>
`Default value: No`
10. **Bleeding coefficient (Number)**<br>
Coefficient to modify the bleeding speed.<br>
`Default value: 1`
11. **Pain coefficient (Number)**<br>
Coefficient to modify the pain intensity.<br>
`Default value: 1`
12. **Pain coefficient (Boolean)**<br>
Keep unit status synced. Recommended on.<br>
`Default value: Yes`


### 2.2 Advanced Medical Settings

This module allows you to change the default Advanced Medical Settings, when [2.1 Medical Settings](#2.1-medical-settings) is set to "Advanced".

**Settings:**

1. **Enabled for (Option)**<br>
Select what units the advanced medical system will be enabled for.<br>
`Default value: "Players only"`
2. **Enable Advanced wounds (Boolean)**<br>
Allow reopening of bandaged wounds?<br>
`Default value: No`
3. **Vehicle Crashes (Boolean)**<br>
Do units take damage from a vehicle crash?<br>
`Default value: Yes`
4. **Allow PAK (Option)**<br>
Who can use the PAK for full heal?<br>
`Default value: "Medics only"`
5. **Remove PAK on use (Boolean)**<br>
Should PAK be removed on usage?<br>
`Default value: Yes`
6. **Locations PAK (Option)**<br>
Where can the personal aid kit be used?<br>
`Default value: "Vehicles & facility"`
7. **Allow Surgical kit (Option)**<br>
Who can use the surgical kit?<br>
`Default value: "Medics only"`
8. **Remove Surgical kit (Boolean)**<br>
Should Surgical kit be removed on usage?<br>
`Default value: Yes`
9. **Locations Surgical kit (Option)**<br>
Where can the Surgical kit be used?<br>
`Default value: "Vehicles & facility"`


### 2.3 Revive Settings

This modules allows a mission maker to limit the amount of revives for units in basic and advanced medical. 

**Settings:**

1. **Enable Revive (Option)**<br>
Enable a basic revive system<br>
`Default value: "disable"`
2. **Max Revive time (Number)**<br>
Max amount of seconds a unit can spend in revive state<br>
`Default value: 120`
3. **Max Revive lives (Number)**<br>
Max amount of lives a unit. 0 or -1 is disabled.<br>
`Default value: -1`


### 2.4 Set Medic Class

Using this module you can define which unit class is defined as a medic / doctor. 

**Settings:**

1. **List (String)**<br>
List of unit names that will be classified as medic, separated by commas.<br>
`Default value: ""`
2. **Is Medic (Boolean)**<br>
Medics allow for more advanced treatment in case of Advanced Medic roles enabled<br>
`Default value: "Regular medic"`


### 2.5 Set Medical Facility

Defines an object as a medical facility. This allows for more advanced treatments. Can be synced with buildings and vehicles.

**Settings:**

1. **Is Medical Facility (Boolean)**<br>
Registers an object as a medical facility.<br>
`Default value: Yes`


### 2.6 Set Medical Vehicle

Defines an object as a medical facility. This allows for more advanced treatments. Can be synced with buildings and vehicles.

**Settings:**

1. **List (String)**<br>
List of vehicles that will be classified as medical vehicle, separated by commas.<br>
`Default value: ""`
2. **Is Medical Vehicle (Boolean)**<br>
Whether or not the objects in the list will be a medical vehicle.<br>
`Default value: Yes`


## 3. ACE Mission Modules
*Part of: ace_missionmodules*

### 3.1 Ambiance Sounds

Used for ambiance sounds loop (synced across MP). 

This module randomizes the time when the sound file is played and the position where the sound file is played (If "Follow Players" is set to No).
`Minimal Distance` and `Maximal Distance` influence the position from where the sound file is played. Setting both values to 0 forces the module to play the sound from where it was placed in the editor.
`Minimal Delay` and `Maximal Delay` work in a similar fashion but are used to randomize when the sound file is played. Setting both values to 0 plays the sound from mission start.

**Settings:**

1. **Sounds (String)**<br>
Class names of the ambiance sounds played. Separated by ','. (Example: `radio_track_01, electricity_loop`).<br>
`Default value: ""`
2. **Minimal Distance (Number)**<br>
Used for calculating a random position and sets the minimal distance between the players and the played sound file(s) (in meters)<br>
`Default value: 400`
3. **Maximum Distance (Number)**<br>
Used for calculating a random position and sets the maximum distance between the players and the played sound file(s) (in meters)<br>
`Default value: 900`
4. **Minimal Delay (Number)**<br>
Minimal delay (in seconds) between sounds played<br>
`Default value: 10`
5. **Maximum Delay (Number)**<br>
Maximum delay (in seconds) between sounds played<br>
`Default value: 10`
6. **Follow Players (Boolean)**<br>
Follow players. If set to false, loop will play sounds only nearby logic position.<br>
`Default value: No`
7. **Volume (Number)**<br>
The volume of the sounds played<br>
`Default value: 1`
