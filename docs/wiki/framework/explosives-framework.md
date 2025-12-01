---
layout: wiki
title: Explosives Framework
description: Explains how to set-up custom explosives with the ACE3 explosives system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

<div class="panel callout">
    <h5>Note:</h5>
    <p>This is just the necessary to make explosives using the framework, this is not a guide to make your own explosives.</p>
</div>

## 1. Explosives

### 1.1 Setting the magazine

```cpp
class CfgMagazines {
    class CA_Magazine;
    class banana_satchel_remote_mag: CA_Magazine {
        useAction = 0;  // Disable the vanilla interaction
        ace_explosives_placeable = 1;  // Can be placed
        ace_explosives_setupObject = "banana_satchel_place";  // The object placed before the explosive is armed
        class ACE_Triggers {  // Trigger configurations
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter", "DeadmanSwitch"};  // Triggers that can be used
            class Timer {
                FuseTime = 0.5;  // Time for the fuse to burn
            };
            class Command {
                FuseTime = 0.5;
            };
            class MK16_Transmitter: Command {};
            class DeadmanSwitch: Command {};
        };
    };
};
```

### 1.2 Setting the ammo

{% raw %}
```cpp
class CfgAmmo {
    class PipeBombBase;
    class SatchelCharge_Remote_Ammo: PipeBombBase {
        soundActivation[] = {"", 0, 0, 0};  // (Optional) No sound on activation
        soundDeactivation[] = {"", 0, 0, 0};  // (Optional) No sound on deactivation
        triggerWhenDestroyed = 1;  // (Optional) Explode when the object is shot and destroyed (after being placed) (0-disabled, 1-enabled). Required to be enabled prior to ACE 3.18.0.
        ace_explosives_defuseTime = 5; // (Optional) Time it takes to defuse explosive (in seconds, default: 5)
        ace_explosives_explodeOnDefuseChance = 0.02;  // (Optional) Add a chance for the explosive to detonate after being disarmed (in percent) (default: 0)
        ace_explosives_defuseObjectPosition[] = {-1.415, 0, 0.12};  // (Optional) The position relative to the model where the defuse helper object will be attached and thus the interaction point will be rendered (default: [0, 0, 0])
        ace_explosives_size = 0;  // (Optional) Setting to 1 will use a defusal action with a larger radius (useful for large mines or mines with a wide pressure plane trigger area) (default: 0)
        ace_explosives_ringtones[] = {{"\z\ace\addons\explosives\Data\Audio\Cellphone_Ring.wss", 0.75, 3.15, 1, 75}};  // (Optional) Defines IED ringtone(s) to be randomly selected upon detonation by cellphone. Each entry includes a sound file path, duration (in seconds), volume (optional: default 3.16228), pitch (optional: default 1), and maximum audible distance (optional: default 75).
        ace_explosives_callConnectTime[] = {1, 8};  // (Optional) Defines the connection delay range (in seconds) for a dialled explosive, where the first value sets the minimum time and the second value sets the maximum time before detonation.
        ace_explosives_detonationTimingOffset = 0.75;  // (Optional) Defines the maximum random deviation (in seconds) for detonation timing, allowing the explosive to detonate up to this value earlier or later than the ringtone's end.
    };
};
```
{% endraw %}

### 1.3 Adding the place item

```cpp
class CfgVehicles {
    class ace_explosives_Place;
    class banana_satchel_place: ace_explosives_Place {
        displayName = "Banana satchel";  // Name of the item
        model = "";  // Path to your model
    };
};
```


## 2. Mines

### 2.1 Setting the magazine

_Pretty much the same as Explosives except that we inherit from_ `ATMine_Range_Mag` _instead of_ `CA_Magazine`.

```cpp
class CfgMagazines {
    class ATMine_Range_Mag;
    class BananaMine_Range_Mag: ATMine_Range_Mag {
        ace_explosives_setupObject = "BananaMine_Place";  // The object placed before the mine is armed
        class ACE_Triggers {  // Triggers
            SupportedTriggers[] = {"PressurePlate"};  // This mine only support pressure plate activation
            class PressurePlate {
                digDistance = 0.05;
            };
        };
    };
};
```

### 2.2 Setting up the Ammo

The class you inherit from depends of what type of trigger you are using, for `PressurePlate` and `Tripwire` you can skip this step, for timers and clackers refer to the Explosives entry.

Directional mines inherit from `DirectionalBombBase`.


## 3. Adding your own detonators

```cpp
class CfgWeapons {
    class ACE_ItemCore;  // ACE3 base item class
    class ACE_Clacker;  // Clacker base class
    class banana_clacker: ACE_Clacker {
        displayName = "banana clacker";  // Name of the item
        picture = "";  // Path to the item's picture
        ace_explosives_range = 9000;  // Explosives activation range in meters
        ace_explosives_triggerType = "Command";  // Trigger type, see below
    };
};
```


## 4. Trigger list

| Name | Use |
| ---- | ----- |
| `Command` | Explode when activated via clacker. |
| `MK16_Transmitter` | Explode when activated via M26 clacker. |
| `DeadManSwitch` | Explode after activated via the switch or the person dies. |
| `Cellphone` | Explode when the number is called. |
| `PressurePlate` | Explode upon being stepped upon. |
| `IRSensor` | Explode after movement is detected in front of the mine. |
| `Timer` | Explode after timer drops to 0. |
| `Tripwire` | Explode when something touch the tripwire. |


## 5. Scripting

### 5.1 Scripted Explosion

`ace_explosives_fnc_scriptedExplosive`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ----- | ------------------------ |
| 0  | Explosive objects | Array | Required |
| 1  | Delay before detonation | Number | Optional (default: `0`, randomized up to given number if negative) |
| **R** | None | None | Return value |

#### 5.1.1 Example

`[[charge1, charge2], -3] call ace_explosives_fnc_scriptedExplosive;`

|    | Arguments | Explanation |
|----| --------- | ----------- |
| 0  | `[charge1, charge2]` | Explosive objects to detonate |
| 1  | `-3` | Randomized delay, up to 3 seconds |

### 5.2 Connect Explosive

`ace_explosives_fnc_connectExplosive`

|    | Arguments | Type(s) | Optional (default value) |
|----| --------- | ------- | ------------------------ |
| 0  | Unit to connect to | Object | Required |
| 1  | Explosive object to connect to | Object | Required |
| 2  | Detonator type class name (must be present on unit) | String | Required |
| **R** | None | None | Return value |

#### 5.2.1 Example

`[player, claymore1, "ACE_Clacker"] call ace_explosives_fnc_connectExplosive;`

|    | Arguments | Explanation |
|----| --------- | ----------- |
| 0  | `player` | Unit explosive will connect to |
| 1  | `claymore1` | Explosive object that will be connected |
| 2  | `"ACE_Clacker"` | Detonator type class name |

#### 5.3 Detonation Handler.

Detonation Handlers are called when something attempts to trigger an explosive. They can be used to block the detonation.

These are only used for script based triggers like clackers, cell phones and timers (anything that uses `detonateExplosive`).
Sensor based triggers like AT Mines, Tripwires are unaffected.
All added handlers will be called, if ANY one returns false, the detonation will be blocked.

`[{CODE}] call ace_explosives_fnc_addDetonateHandler;`

CODE will be passed `[Unit <OBJECT>, MaxRange <NUMBER>, Explosive <OBJECT>, FuzeTime <NUMBER>, TriggerItem <STRING>]` and should return a bool: true (allowed) / false (blocked)

#### 5.3.1 Example

Jammer that blocks RF triggers:

```sqf
[{
    params ["_unit", "_range", "_explosive", "_fuzeTime", "_triggerItem"];
    if (_triggerItem == "ace_cellphone") exitWith { systemChat "Blocking Cell Phone"; false };  // always block cell phones
    if (_triggerItem == "ace_m26_clacker") exitWith {
        _range = _range / 1000;
        private _actualRange = _unit distance _explosive;
        systemChat format ["Limited Range For RF Clacker [%1m / %2m]", _actualRange toFixed 1, _range toFixed 1];
        (_actualRange < _range) // return bool
    };
    // allow anything else (like timers / wired clackers)
    true
}] call ace_explosives_fnc_addDetonateHandler;
```

#### 5.4 Enabling `setShotParents`.

ACE can set the owner/instigator of the explosive to the unit placing/detonating it.
By default, it will only set the instigator to prevent unrealistic AI behavior where it immediately knows the placer's exact location upon detonation.
Enabling this will also set the explosive owner, if required by custom Event Handlers or other scripts.

```sqf
ace_explosives_setShotParents = true;
```
