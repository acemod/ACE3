---
layout: wiki
title: Modules
group: missionmaker
order: 5
parent: wiki
---


**THIS PAGE IS NOT UP2DATE.**


## 1. Modules
### 1.1 Advanced Ballistics
*Part of: ace_advanced_ballistics*

This module allows to enable advanced external- and internal ballistics.

**Settings:**

1. **Advanced Ballistics (Boolean)<br>**
Enables advanced ballistics.<br>
`Default value: No`
2. **Always Enabled For Snipers (Boolean)<br>**
Always enables advanced ballistics when high power optics are used.<br>
`Default value: Yes`
3. **Disabled In FullAuto Mode (Boolean)<br>**
Disables the advanced ballistics during full auto fire.<br>
`Default value: No`
4. **Disabled For Non Local Players (Boolean)<br>**
Disables the advanced ballistics for bullets coming from other players (enable this if you encounter frame drops during heavy firefights in multiplayer).<br>
`Default value: Yes`
5. **Enable Ammo Temperature Simulation (Boolean)<br>**
Muzzle velocity varies with ammo temperature.<br>
`Default value: Yes`
6. **Enable Barrel Length Simulation (Boolean)<br>**
Muzzle velocity varies with barrel length.<br>
`Default value: Yes`
7. **Enable Bullet Trace Effect (Boolean)<br>**
Enables a bullet trace effect to high caliber bullets (only visible when looking through high power optics).<br>
8. **Simulation Interval (Number)<br>**
Defines the interval between every calculation step.<br>
`Default value: 0.05`
9. **Simulation Radius (Number)<br>**
Defines the radius around the player (in meters) at which advanced ballistics are applied to projectiles.<br>
`Default value: 3000`

### 1.2 BlueForceTracking
*Part of: ace_map*

When adding the "BlueForceTracking" module to your mission it adds map markers to every group on the players side and refreshes them in certain configurable interval (in seconds). The module takes the group type into account and uses the proper NATO icon for each marker.

**Settings:**

1. **Interval (Number)<br>**
How often the markers should be refreshed (in seconds).<br>
`Default value: 5`
2. **Hide AI Groups (Boolean)<br>**
Hide markers for "AI only" groups.<br>
`Default value: No`

### 1.3 Check PBOs
*Part of: ace_core*

If you are worried that players haven't updated ACE or other mods to the version you're using on the server, you can place the "Check PBOs" module on your map. You can choose one of three posible actions that are being executed when a player joins that has a wrong version of ACE or an other mod:

* Warn once
* Warn permanent
* Kick

**Settings:**

1. **Action (Option)<br>**
What to do with people who do not have the right PBOs.<br>
`Default value: "Warn once"`

2. **Check all addons (Boolean)<br>**
Check all addons instead of only those of ACE?<br>
`Default value: "No"`

3. **Whitelist<br>**
You can make a whitelist of addons that don't have to be on the server. If you want to use the "Check all addons" option of this module and allow the usage of client side modifications like Blastcore or JSRS, you have to list them here.  
The list must be in the following format: `["ADDON1","ADDON2",...]` where the addons are CfgPatches references to all PBOs of the optional mod. To figure these out, you can use the scripting command `activatedAddons` in the editor while those mods are enabled.  

Example 1: @Blastcore-A3:<br>
```sqf
["warfxpe","blastcore_vep"]
```
Example 2: @JSRS:<br>
```sqf
[TBD]
```  
Example 3: @JSRS + @Blastcore-A3:<br>
```sqf
[TBD, "warfxpe","blastcore_vep"]
```

### 1.4 Explosive System
*Part of: ace_explosive*

The "Explosive System" module lets you tweak the settings for the new explosive system that ACE introduces.

**Settings:**

1. **Require explosive specialists? (Boolean)<br>**
Require explosive specialists to disable explosives.<br>
`Default value: No`
2. **Punish non-specialists? (Boolean)<br>**
Increase the time it takes to complete actions for non-specialists.<br>
`Default value: Yes`

### 1.5 Fatigue System (deprecated)
**Warning:**
*This module is deprecated and only in there not to break older missions that have used this module. It will be removed in a future update. It serves no purpose.*

### 1.6 Friendly Fire Messages
*Part of: ace_respawn*

The "Friendly Fire Messages" module triggers a message when a player kills a friendly or civilian unit. This module isn't needed on servers with a low difficulty setting.

### 1.7 Interaction
*Part of: ace_interaction*

This module allows you to tweak the settings for player names tags.

**Settings:**

1. **Player Names View Distance (Number)<br>**
Sets the distance (in meters) at which player name tags become visible.<br>
`Default value: 5`

### 1.8 Medical System
*Part of: ace_medical*

When using the medical system ACE offers you probably want to fine tune some aspects of the wounding, healing or gameplay mechanics and fit them to your needs. The "Medical System" module offers a lot of settings to do just that.

**Settings:**

1. **Bleeding Speed Coefficient (Number)<br>**
Multiplier for the rate of bleeding.<br>
`Default value: 1`
2. **Pain Effect Coefficient (Number)<br>**
Multiplier for the intensity of the pain effect (chromatic abberation).<br>
`Default value: 1`
3. **Max Unconscious Time (Number)<br>**
Maximum time (in seconds) for a unit to be unconscious before dying. -1 disables this.<br>
`Default value: -1`
4. **Allow non-medics? (Boolean)<br>**
This setting is used to allow non-medics to use epipens and bloodbags.<br>
`Default value: No`
5. **Punish non-medics? (Boolean)<br>**
Increase the time it takes to complete actions for non-medics.<br>
`Default value: Yes`
6. **Require diagnosis? (Boolean)<br>**
Require an unconscious patient to be diagnosed before allowing treatment.<br>
`Default value: No`
7. **Prevent instant death? (Boolean)<br>**
Prevent instant death and always put players in unconscious state instead.<br>
`Default value: No`
8. **Prevent death while unconscious? (Boolean)<br>**
Make unconscious units invulnerable.<br>
`Default value: No`
9. **Single Bandage (Boolean)<br>**
Use one bandage to heal the entire body.<br>
`Default value: No`
10. **Unconscious can chat? (Boolean)<br>**
Allow all players to use chat while unconcious? Admin can always use the chat regardless.<br>
`Default value: No`

### 1.9 Rallypoint System
*Part of: ace_respawn*

This module was introduced with 0.94 and enables Mission Makers to specificly enable units to move a rallypoint. Every unit that is synced with that module is able to move a rallypoint.

**Note:**
It's important to mention that this doesn't work for player who join during a mission (JIP = Join in progress). That's something we can't change because that's the way Bohemia has implemented their module framework. To enable JIP players to move rally points have a look at [3.1 ACE Rallypoints](#31-ace-rallypoints).

### 1.10 Repair System
*Part of: ace_logistics*

Placing the "Repair System" module makes it possible to define the time it takes for certain repair actions.

**Settings:**

1. **Heavy Repair Time (Number)<br>**
Time to repair engine/turret/body/fuel components (in seconds).<br>
`Default value: 10`
2. **Wheel Replace Time (Number)<br>**
Time to replace a wheel (in seconds).<br>
`Default value: 10`
3. **Track Replace Time (Number)<br>**
Time to replace a track (in seconds).<br>
`Default value: 10`
4. **Maximum Repaired Damage (Number)<br>**
Limits the amount of damage that can be repaired. 0 = Repair all damage, 1 = Cannot repair any damage.<br>
`Default value: 0`

### 1.11 Respawn System
*Part of: ace_respawn*

The "Respawn System" module enables players to respawn with the gear they had before dying and to remove bodies of players after a configurable interval (in seconds).

**Settings:**

1. **Save Gear? (Boolean)<br>**
Respawn with the gear a player had just before his death.<br>
`Default value: No`

### 1.12 SwitchUnits System
*Part of: ace_switchunits*

The [SwitchUnits System](#32-ace-switchunits) enables players to control certain AI units on the map. 

**Settings:**

1. **Switch To West? (Boolean)<br>**
Allow switching to west units?<br>
`Default value: No`
2. **Switch To East? (Boolean)<br>**
Allow switching to east units?<br>
`Default value: No`
3. **Switch To Independent? (Boolean)<br>**
Allow switching to independent units?<br>
`Default value: No`
4. **Switch To Civilian? (Boolean)<br>**
Allow switching to civilian units?<br>
`Default value: No`
5. **Enable Safe Zone? (Boolean)<br>**
Enable a safe zone around enemy units? Players can't switch to units inside of the safe zone.<br>
`Default value: Yes`
6. **Safe Zone Radius (Number)<br>**
The safe zone around players from a different team (in meters)<br>
`Default value: 200`


### 1.13 LSD Vehicles
*Part of: ace_core*

### 1.14 Weather
*Part of: ace_weather*

This module allows you to customize the weather settings.

**Settings:**

1. **Weather propagation (Boolean)<br>**
Enables sever side weather propagation.<br>
`Default value: Yes`
2. **ACE Weather (Boolean)<br>**
Overrides the default weather (editor, mission settings) with ACE weather (map based).<br>
`Default value: Yes`
3. **Sync Rain (Boolean)<br>**
Synchronizes rain.<br>
`Default value: Yes`
3. **Sync Wind (Boolean)<br>**
Synchronizes wind.<br>
`Default value: Yes`
3. **Sync Misc (Boolean)<br>**
Synchronizes lightnings, rainbow, fog, ...<br>
`Default value: Yes`
4. **Update Interval (Number)<br>**
Defines the interval (seconds) between weather updates.<br>
`Default value: 60`
    
### 1.15 Wind Deflection
*Part of: ace_winddeflection*

This module allows you to define when wind deflection is active.

**Settings:**

1. **Wind Deflection (Boolean)<br>**
Enables wind deflection.<br>
`Default value: Yes`
2. **Vehicle Enabled (Boolean)<br>**
Enables wind deflection for static/vehicle gunners.<br>
`Default value: Yes`
3. **Simulation Interval (Number)<br>**
Defines the interval between every calculation step.<br>
`Default value: 0.05`
4. **Simulation Radius (Number)<br>**
Defines the radius around the player (in meters) at which projectiles are wind deflected.<br>
`Default value: 3000`

And then there's the "LSD Vehicles" module &hellip; it does 'something' to all vehicles synced to that module.
http://youtu.be/X3e0LTexEok
