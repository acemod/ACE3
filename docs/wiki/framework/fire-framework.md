---
layout: wiki
title: Fire Framework
description: Explains how to ignite thing using CBA events.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 14
  patch: 0
---


## 1. Events

Use `CBA_fnc_serverEvent` to use the following features. Events are defined only on the server in the system.

### 1.1 Adding a new fire source

`ace_fire_addFireSource`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Source of flame | Object/Position ASL | Required |
| 1  | Radius of fire | Number | Required |
| 2  | Intensity of fire (1, 10] | Number | Required |
| 3  | Fire source ID | Array/Boolean/Code/Config/Group/Namespace/NaN/Number/Object/Side/String | Required |
| 4  | Condition to stop fire | Code | Optional (default: `{true}`) |
| 5  | Arguments to pass to condition | Any | Optional (default: `[]`) |

### 1.2 Removing fire source

`ace_fire_removeFireSource`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Fire source ID | Array/Boolean/Code/Config/Group/Namespace/NaN/Number/Object/Side/String | Required |

## 2. Variables

Screams can be disabled for an individual unit by setting the `ace_fire_enableScreams` variable on the unit, which can be synced across machines.

```sqf
_unit setVariable ["ace_fire_enableScreams", false, _isGlobal];
```

## 3. Config Values

### 3.1 Adding fire protection to a uniform

{% raw %}
```cpp
class CfgWeapons {
    class yourUniformClass {
        ace_fire_protection = 1; // 0-1 value for protection, intensity and incoming damage are scaled by (1 - _protection)
                                 // 0 provides no protection, 1 provides full immunity to fire
    };
};
```
{% endraw %}

### 3.2 Custom scream sounds

{% raw %}
```cpp
class CfgVehicles {
    class CAManBase;
    class yourManClass: CAManBase {
        ace_fire_screamSounds[] = {
            "sound_name"    // Name of sound(s) in CfgSounds
        };
    };
};
```
{% endraw %}

## 4. Scripting

### 4.1 Setting/Adding Custom Screaming Sounds

`ace_fire_fnc_addScreamSounds`

```sqf
* Adds custom fire scream sounds for a unit class.
*
* Arguments:
* 0: Unit class <STRING>
* 1: Array of CfgSounds classes <ARRAY of STRING>
* 2: Append to existing sounds array <BOOL> (default: true)
*    - true : Passed sounds will be added to unit's existing sounds
*    - false: Passed sounds will replace unit's existing sounds
*
* Return Value:
* Succeeded <BOOL>
*
* Example:
* [typeOf player, ["sound1", "sound2"]] call ace_fire_fnc_addScreamSounds
```

### 4.1 Getting Screaming Sounds

`ace_fire_fnc_getScreamSounds`

```sqf
* Returns a list of scream sounds that a unit will play when on fire.
*
* Arguments:
* 0: Unit <OBJECT or STRING>
*
* Return Value:
* Scream sounds <ARRAY of STRINGs>
*
* Example:
* player call ace_fire_fnc_getScreamSounds
```
