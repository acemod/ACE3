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
        ACE_Explosives_Placeable = 1;  // Can be placed
        useAction = 0;  // Disable the vanilla interaction
        ACE_Explosives_SetupObject = "banana_satchel_place";  // The object placed before the explosive is armed
        ACE_Explosives_DelayTime = 1.5;  // Seconds between trigger activation and explosion
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

```cpp
class CfgAmmo {
    class PipeBombBase;
    class SatchelCharge_Remote_Ammo: PipeBombBase {
        soundActivation[] = {"", 0, 0, 0};  // No sound on activation
        soundDeactivation[] = {"", 0, 0, 0};  // No sound on deactivation
        triggerWhenDestroyed = 1;  // (Optional) Explode when the object is shot and destroyed (after being placed) (0-disabled, 1-enabled).
        ACE_explodeOnDefuse = 0.02;  // (Optional) Add a chance for the explosive to detonate after being disarmed (in percent)
        ACE_explosives_defuseObjectPosition[] = {-1.415, 0, 0.12};  // (Optional) The position relative to the model where the defuse helper object will be attached and thus the interaction point will be rendered
        ACE_explosives_size = 0;  // (Optional) Setting to 1 will use a defusal action with a larger radius (useful for large mines or mines with a wide pressure plane trigger area)
    };
};
```

### 1.3 Adding the place item

```cpp
class CfgVehicles {
    class ACE_Explosives_Place;
    class banana_satchel_place: ACE_Explosives_Place {
        displayName = "Banana satchel";  // Name of the item
        model = "";  // Path to your model
        ACE_offset[] = {0, 0, 0};  // Offset of the interaction point from the model in meters on the X,Y,Z axis. Try setting this to the place where it makes most sense (e.g. to buttons/switches/pins)
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
        ACE_Explosives_SetupObject = "BananaMine_Place";  // The object placed before the mine is armed
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
        ACE_Explosives_Range = 9000;  // Explosives activation range in meters
        ACE_Explosives_triggerType = "Command";  // Trigger type, see below
    };
};
```


## 4. Trigger list

Name | Use
---- | -----
`Command` | Explode when activated via clacker.
`MK16_Transmitter` | Explode when activated via M26 clacker.
`DeadManSwitch` | Explode after activated via the switch or the person dies.
`Cellphone` | Explode when the number is called.
`PressurePlate` | Explode upon being stepped upon.
`IRSensor` | Explode after movement is detected in front of the mine.
`Timer` | Explode after timer drop to 0.
`Tripwire` | Explode when something touch the tripwire.


## 5. Scripting

### 5.1 Scripted Explosion

`ace_explosives_fnc_scriptedExplosive`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Explosive objects | Array | Required
1  | Delay before detonation | Number | Optional (default: `0`, randomized up to given number if negative)
**R** | None | None | Return value

#### 5.1.1 Example

`[[charge1, charge2], -3] call ace_explosives_fnc_scriptedExplosive;`

   | Arguments | Explanation
---| --------- | -----------
0  | `[charge1, charge2]` | Explosive objects to detonate
1  | `-3` | Randomized delay, up to 3 seconds

### 5.2 Connect Explosive

`ace_explosives_fnc_connectExplosive`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Unit to connect to | Object | Required
1  | Explosive object to connect to | Object | Required
2  | Detonator type class name (must be present on unit) | String | Required
**R** | None | None | Return value

#### 5.2.1 Example

`[player, claymore1, "ACE_Clacker"] call ace_explosives_fnc_connectExplosive;`

   | Arguments | Explanation
---| --------- | -----------
0  | `player` | Unit explosive will connect to
1  | `claymore1` | Explosive object that will be connected
2  | `"ACE_Clacker"` | Detonator type class name

#### 5.3 Detonation Handler.

Detonation Handlers are called when something attempts to trigger an explosive. They can be used to block the detonation.

These are only used for script based triggers like clackers, cellphone and timers (anything that uses `detonateExplosive`).
Sensor based triggers like AT Mines, Tripwires are uneffected.
All added handlers will be called, if ANY one returns false, the detonation will be blocked.

`[{CODE}] call ace_explosives_fnc_addDetonateHandler;`

CODE will be passed `[Unit<OBJECT>, MaxRange <NUMBER>, Explosive <OBJECT>, FuzeTime <NUMBER>, TriggerItem <STRING>]` and should return a bool: true(allowed) / false(blocked)

#### 5.3.1 Example

Jammer that blocks RF triggers:

```cpp
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
