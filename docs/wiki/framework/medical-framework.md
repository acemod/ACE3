---
layout: wiki
title: Medical Framework
description: This document explains how to extend the ACE Medical Framework to modify or add functionality.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 13
  patch: 7
---

## 1. Overview

ACE Medical is a large system with a lot of functionality spread across multiple components. Some of the system is hard-coded, but a lot of it is defined through config so it can be altered or extended without causing problems.


## 2. Processing Flow
This section explains the components responsible for turning damage into wounds, and how they interact with each other.

### 2.1 Damage Handling
ACE Medical Engine uses the `handleDamage` event handler to intercept incoming damage and replace it with wounds. This function is complex as it must work around a number of quirks in the engine and the vanilla game's handling of damage, so it should generally be left alone, but the important note is that if another mod or script adds its own `handleDamage` event handler this is virtually guaranteed to break ACE's handling and cause undesired behaviour.

This event handler aggregates incoming damage information into individual damage events, then uses the CBA event system to pass on these individual damage events. For each thing that damages a unit (each bullet or explosion) it raises an event of type `ace_medical_woundReceived`. A couple of minor exceptions to this are burning (e.g. from being near a burning vehicle) and some types of collisions, which create a large number of small damage ticks because the event handler doesn't provide enough information to collect them into one event.

#### 2.1.1 Damage Type
The `woundReceived` event receives information about how much damage was dealt to each body part and the ammo type - each `CfgAmmo` [class](#41-cfgammo) should define an `ACE_damageType` property which the handler uses to determine what type of damage that ammo does. ACE Medical Damage sets this property on all relevant base classes, so if your custom ammo class inherits from any vanilla ammo it will also inherit the corresponding damage type. Usually this is what you want, though sometimes you may want to change it e.g. a special type of bullet that actually deals `explosive` damage.

The default `woundReceived` event handler uses the `ace_medical_damage_fnc_getTypeOfDamage` function to look up and cache the damage type. Some types of damage, such as burning, collisions and falls, aren't caused by weapons therefore don't have an ammo type - instead they pass the name of the damage type. All the configured damage types are preloaded into the cache, so it simply returns the same string.

#### 2.1.2 Selection Specific
Due to a quirk in the engine behaviour, projectiles like bullets don't only deal damage to the body part they hit - they also deal damage to other nearby parts. To get around this, ACE treats certain [damage types](#43-acemedicalinjuries--damagetypes) (like `bullet`) as "selection-specific", meaning that when damage of that type generates wounds they will only be applied to whichever body part took the _most_ damage, which should be whichever part was _actually_ hit.
Damage types which are non-selection-specific create wounds on every body part that received damage (which is often all of them).

The `woundReceived` event is passed all the damage and the default event handler added by ACE Medical Damage checks the damage type config to decide whether to pass on all of the damage, or just one part.

### 2.2 Wound Handlers
To convert these raw damage numbers into discrete wounds, ACE uses a collection of functions called wound handlers. Each [damage type](#43-acemedicalinjuries--damagetypes) may specify its own list of wound handlers under a `woundHandlers` class, or if it does not the default handlers defined in `ACE_Medical_Injuries >> "damageTypes" >> "woundHandlers"` will be used.

All wound handlers defined for a particular damage type will be called, and they are called in the _opposite_ order they were added. The value returned by each handler is what will be passed as parameters to the next one - if the return is not valid (not an array, or not enough arguments) handling will be terminated and no other handler functions will be called. This allows custom wound handlers to selectively handle damage and either block the built-in handling or pass modified damage data.

ACE comes with a built-in wound handler that does all the work of creating wounds, checking for death or unconsciousness and updating important effects (like the blood visuals that appear on body parts). ACE also uses some custom wound handlers which usually perform additional processing and then pass the result on to be used by the default handler - a good example of this is `ace_medical_damage_fnc_woundsVehicleCrash`. If you need to add custom handling for a damage type it is recommended to use this pattern to avoid breaking existing functionality; if you choose not to pass damage on to the default handler, you must ensure that all the necessary processing is done.

## 3. Extending ACE Medical

### 3.1 Adding new ammo types
Generally when adding new ammo types it is sufficient to simply inherit from an existing vanilla class; your ammo will inherit the damage type of its parent class. You can check this using the in-game config viewer.
If, for whatever reason, you want to change the damage type you can simply define the `ACE_damageType` [property](#41-cfgammo).

### 3.2 Adding new wound types
To add a new wound type all that is technically necessary is to create a new [wound class](#42-acemedicalinjuries--wounds).
In order to allow that wound type to be created, you must add it to one or more [damage types](#43-acemedicalinjuries--damagetypes) or create new damage types that cause your new wound type.

To allow your wound to be bandaged or treated in other ways, look into the [ACE Medical Treatment](https://github.com/acemod/ACE3/tree/master/addons/medical_treatment) component (documentation not yet available).

### 3.3 Adding new damage types
To create a new damage type, create a new [damage type class](#43-acemedicalinjuries--damagetypes) and define a class within it for each type of wound you want it to be able to create. All the properties listed are optional and most can be left at their default values or tweaked to produce special behaviour, but you will probably want to change the `thresholds` and `weighting`.

If you want to add custom wound handling, define the `woundHandlers` class and create a [handler function](#44-wound-handler-function). Your `woundHandlers` class may inherit from the default one to automatically add the default wound handlers to it.

#### 3.3.1 Thresholds
This entry is used to determine how many individual wounds that type of damage will create. Its format is:
```cpp
class MY_custom_damageType {
    thresholds[] = {
        {damage, number of wounds},
        ...
    };
    ...
};
```
When damage of this type is dealt, the wound handler scans through this array to find the _first_ entry whose damage value is _less than_ the incoming damage; it then takes that entry and the one _before_ it in the list and uses `linearConversion` to interpolate between the two "number of wounds" values. If the result is a decimal, it is rounded up or down by chance based on the decimal part. Usually the points should be in descending order of `damage`.
For specific details, look at `ace_medical_damage_fnc_interpolatePoints`.

Example:
{% raw %}
```cpp
thresholds[] = {{0.7, 3}, {0.5, 2}, {0.3, 1}};
```
{% endraw %}

- `damage = 0.65`
- 0.65 75% of the way from 0.5 to 0.7, so the interpolated value is 2.75
- this has a 75% chance to create 3 wounds, and a 25% chance to create 2 wounds
- the incoming damage is split evenly between the wounds created

Additionally:
- If the damage value is greater than the first entry in the list, the first number is returned as-is. In the above example, a damage value of 0.8 would always create 3 wounds.
- If the damage value is lower than the last entry in the list, that value is used as-is. In the example, any value below 0.3 would always create 1 wound.

#### 3.3.2 Weighting
This entry is used to determine the chance for a damage type to produce each wound type. Its format is the same as thresholds and it is interpolated in the same way, except that decimals are **not rounded** and instead returned as-is. This is calculated for each wound type and the results are used as weights for `selectRandomWeighted` to determine which wound is created.

- The weights are calculated once per body part damaged.
- If multiple wounds are created, the type is chosen randomly for each one but the weighting remains the same.
- The damage value used is the damage _per wound_, which is the total damage divided by the number of wounds.

Example:
{% raw %}
```cpp
class Contusion {
    weighting[] = {{0.35, 0}, {0, 2}};
};
class VelocityWound {
    weighting[] = {{0.35, 2}, {0, 0}};
};
```
{% endraw %}

- `damage = 0.6` and `nWounds = 3`, therefore `damagePerWound = 0.2`
- 0.2 is 4/7 of the way from 0 to 0.35
- `weight` for contusion is approximately `0.857`
- `weight` for velocitywound is approximately `1.143`
- total `weight` is `2`
- this means each wound has about a 43% chance to be a contusion, and 57% to be a velocity wound

## 4. Reference

### 4.1 CfgAmmo
```cpp
class CfgAmmo {
    class BulletCore;
    class BulletBase: BulletCore {
        ACE_damageType = "bullet"; //any valid damage type
    };
    class B_20mm: BulletBase {
        ACE_damageType = "explosive"; //sub-classes are free to override
    };
};
```

### 4.2 ACE_Medical_Injuries >> wounds
```cpp
class ACE_Medical_Injuries {
    class wounds {
        // each sub-class defines a valid wound type
        class MY_custom_woundType {
            bleeding = 0.05; // maximum blood loss per wound as a multiple of cardiac output, will be scaled by wound size. (default: 0)
            pain = 0.8; // maximum pain produced on a scale of 0..1, will be scaled by wound size (default: 0)
            causeLimping = 1; // 0 to ignore this wound type when determining whether damage to the legs is sufficient to cause limping (default: 0)
            causeFracture = 1; // 0 to prevent this wound type from causing fractures (default: 0)
        };
    };
};
```

### 4.3 ACE_Medical_Injuries >> damageTypes
See above for full explanations of [thresholds](#331-thresholds) and [weighting](#332-weighting).
{% raw %}
```cpp
class ACE_Medical_Injuries {
    class damageTypes {
        // default values used if a damage type does not define them itself
        thresholds[] = {{0.1, 1}};
        selectionSpecific = 1;

        // list of damage handlers, which will be called in reverse order
        // each entry should be a SQF expression that returns a function
        // this can also be overridden for each damage type
        class woundHandlers {
            ace_medical_damage = "ace_medical_damage_fnc_woundsHandlerBase";
        };

        // each sub-class defines a valid damage type
        class MY_custom_damageType {
            // this is used to determine how many wounds to produce - see explanation above
            thresholds[] = {{0.1, 1}, {0.1, 0}};

            // if 1, wounds are only applied to the most-damaged body part. if 0, wounds are applied to all damaged parts
            selectionSpecific = 1;

            // if 1, wounds do not produce blood spurts
            noBlood = 0;

            // custom handling for this damage type
            // inherits from the default handlers - the function(s) defined here will be called first, then the default one(s)
            class woundHandlers: woundHandlers {
                my_addon = "my_fnc_customDamageHandler";
            };

            // one class for each type of wound this damage type is allowed to create
            // must match a wound type defined above
            class MY_custom_woundType {
                // used to determine the chance of producing this type of wound instead of another - see explanation above
                weighting[] = {{0.01, 1}, {0.01, 0}};

                // multiplier for incoming damage, applied before anything else is calculated (default: 1)
                damageMultiplier = 1;

                // multiplies the damage value used to determine wound size as shown in the UI.
                // size is used to scale bleeding & pain but *not* death or unconsciousness (default: 1)
                sizeMultiplier = 1;

                // multiplies bleeding rate (applied after size) (default: 1)
                bleedingMultiplier = 1;

                // multiplies pain produced (applied after size) (default: 1)
                painMultiplier = 1;

                // multiplies the probability to create fractures (default: 1)
                fractureMultiplier = 1;
            };
            class Contusion {
                weighting[] = {{0.35, 0}, {0.35, 1}};
            };
            class VelocityWound {
                weighting[] = {{0.35, 1}, {0.35, 0}};
            };
        };
    };
};
```
{% endraw %}

### 4.4 Wound Handler Function
Custom wound handlers should follow the same spec as the built-in handler:

`ace_medical_damage_fnc_woundsHandlerBase`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Unit that was hit | Object | Required |
| 1  | Array of damage dealt to each body part | Array | Required |
| 2  | Type of damage | String | Required |
| 3  | Ammo | String | Required |
| **R** | Parameters to be passed to the next handler in the list, e.g. `_this` or a modified copy of it. Return `[]` to prevent further handling. | Array | Required |

We recommend modifying `_this` with `set` and returning it instead of returning a copy of the array to prevent any issues with API changes. Existing parameters will not change in type, function, or format without warning, but new parameters may be added.

The damage elements are sorted in descending order according to how much damage was dealt to each body part _before armor was taken into account_, but the actual damage values are _after armor_.

Ammo can be a CfgAmmo classname (like `" B_556x45_Ball"`), empty string, or special ammo from `medical_engine`/another wound handler. Check if the passed ammo is within your expected values (like `!isNull (configFile >> "CfgAmmo" >> _ammo)` for CfgAmmo classes) before using it.

### Example
`[player, [[0.5, "Body", 1], [0.3, "Head", 0.6]], "grenade", "grenade_ammo"] ace_medical_damage_fnc_woundsHandlerBase`

|    | Arguments | Explanation |
| ---| --------- | ----------- |
| 0  | `player` | Unit that was hit |
| 1  | `[[0.5, "Body", 1], [0.3, "Head", 0.6]]` | 0.5 damage to body (was 1 before armor), 0.3 damage to head (was 0.6 before armor) |
| 2  | `"grenade"` | type grenade (non-selection-specific) |
| 3  | `"grenade_ammo"` | ammo |

## 5. Tweaking internal variables
Some of ACE Medical's underlying behavior, primarily related to damage handling and the vitals loop, can be fine-tuned by editing `ace_medical_const_` variables, found in [script_macros_medical.hpp](https://github.com/acemod/ACE3/blob/master/addons/medical_engine/script_macros_medical.hpp).

Modification of those values should be done by advanced users only. Values and variable names are subject to change without prior warning. Modifying values mid-mission may lead to undefined behavior. Expect minimal support.

### 5.1 Disable seat locking for unconscious
ACE will lock the seat of an unconscious or dead unit to prevent automatic unloading. This can be disabled by setting:
```sqf
ace_medical_engine_disableSeatLocking = true;     // disable on everything
ace_medical_engine_disableSeatLocking = ["ship"]; // disable just on boats
```

### 5.2 Running vitals loop on untouched AI
For performance ACE will skip running vitals loop on AI that have never been wounded or treated. This can be disabled by setting:
```sqf
// always run all vitals calculations on all AI
ace_medical_const_medicalActivity = true;

// specific AI
unit setVariable ["ace_medical_medicalActivity", true]  
```
Once medical activity has been enabled, you can't disable it. In other words: if you execute `unit setVariable ["ace_medical_medicalActivity", true]`, you can't disable medical activity for that specific AI anymore. If you run `ace_medical_const_medicalActivity = true;`, you can no longer set it to `false` and all AI will have their medical activity enabled.

## 6. Persisting medical state between missions

A unit's medical state can be saved to JSON by calling `ace_medical_fnc_serializeState`. This can then be persisted in `profileNamespace` or your preferred flavor of persistence:
```sqf
private _state = player call ace_medical_fnc_serializeState;

profileNamespace setVariable ["MyPlayerMedicalState", _state];
saveProfileNamespace;
```

After a mission restart, `ace_medical_fnc_deserializeState` can be called:
```sqf
private _state = profileNamespace getVariable ["MyPlayerMedicalState", ""];

[player, _state] call ace_medical_deserializeState;
```

## 6.1 Extending with custom handling

You can save additional data or add custom handling by hooking into the events:

| Event Name | Params | Description |
| ---------- | ------ | ----------- |
| ace_medical_serializeState | Unit, Namespace | Raised locally after ACE Medical's serialization has taken place |
| ace_medical_deserializeState | Unit, Namespace | Raised locally after ACE Medical's deserialization has taken place |
