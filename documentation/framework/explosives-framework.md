---
layout: wiki
title: Explosives framework
description:
group: framework
order: 5
parent: wiki
---

## 1. Explosives

### 1.1 Setting the magazine

```
class CfgMagazines {
    class CA_Magazine;

    class banana_satchel_remote_mag: CA_Magazine {
        ACE_Placeable = 1;  // Can be placed
        useAction = 0;  // Disable the vanilla interaction
        ACE_SetupObject = "banana_satchel_place"; // The object placed before te explosive is armed.
        class ACE_Triggers {  // Trigger configurations
            SupportedTriggers[] = {"Timer","Command", "MK16_Transmitter", "DeadmanSwitch"};  // Triggers that can be used.
            class Timer {
                FuseTime = 0.5;  // Time for the fuse to burn.
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

```
class CfgAmmo {

    class PipeBombBase;
    class SatchelCharge_Remote_Ammo: PipeBombBase {
        soundActivation[] = {"", 0, 0, 0};  // No sound on activation.
        soundDeactivation[] = {"", 0, 0, 0};  // No sound on deactivation.
    };
};
```

Some optionnal parameters:
- triggerWhenDestroyed = 1; // Explode when the object is shot and destroyed (after being placed) (0= disabled, 1= enabled).
- ACE_explodeOnDefuse = 0.02; // Add a chance for the explosive to detonate after being disarmed. (in percent)

### 1.3 Adding the place item

```
class CfgVehicles {

    class ACE_Explosives_Place;
    class banana_satchel_place: ACE_Explosives_Place {
        displayName = "Banana satchel";  // Name of the item
        model = "";  // Path to your model
        ACE_offset[] = {0,0,0};  // Offset of the interaction point from the model in meters on the X,Y,Z axis.
    };
};
```


## 2. Mines

### 2.1 Setting the magazine

_Pretty much the same as Explosives except that we inherit from_ `ATMine_Range_Mag` _instead of_ `CA_Magazine`

```
class CfgMagazines {

    class ATMine_Range_Mag;

    class BananaMine_Range_Mag: ATMine_Range_Mag {
        ACE_SetupObject = "BananaMine_Place";  // The object placed before the mine is armed.
        class ACE_Triggers {  // Triggers
            SupportedTriggers[] = {"PressurePlate"};  // This mine only support pressure plate activation.
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

```
class CfgWeapons {

    class ACE_ItemCore;  // ACE3 base item class.
    class ACE_Clacker;  // Clacker base class.

    class banana_clacker: ACE_Clacker {
        displayName = "banana clacker"; // Name of the item.
        picture = ""; // Path to the item's picture.
        ACE_Range = 9000; // Explosives activation range in meters.
    };
};
```
## 4. Trigger list

Name | Use
---- | -----
Command | Explode when activated via clacker.
MK16_Transmitter | Explode when activated via M26 clacker.
DeadManSwitch | Explode after activated via the switch or the person dies.
Cellphone | Explode when the number is called.
PressurePlate | Explode upon being stepped upon.
IRSensor | Explode after movement is detected in front of the mine.
Timer | Explode after timer drop to 0.
Tripwire | Explode when something touch the tripwire.


## 5. Events
