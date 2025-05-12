---
layout: wiki
title: Wardrobe Framework
description: Explains the wardrobe system and how to make a compat.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 20
  patch: 0
---


## 1. Overview

The Wardrobe Addon gives the player the opportunity to change/modify their current wearables into different variants.

For example, if a uniform has a normal variant and a "Rolled-Up Sleeves" variant, the player will be able to use ether an ACE Self Interaction or the CBA Context Menu in the Inventory.

Since there is no reliable, common patterns in terms of class inheritance, not even within the same DLC, each possible variant has to be defined individually within `configFile >> "ace_wardrobe"`.

### 1.1 Components

Components are an optional assistance to define a group of variants where a variant is made of one or more components.
For example, a bandanna with sunglasses would have the the bandanna and the sunglasses as components, while the bandanna and sunglasses themself only have themselves as a component.

If the player switches from a variant with more components to a variant with less components, the surplus components will be deposited in their inventory. Vise Versa, if the player wants to change from a variant with less components to a variant with more components, they are required to have the missing components in their inventory, which will be removed on conversion.

More examples can be found below.

### 1.2 Config Guidelines

- A Container (Uniform, Vest, Backpack) should never change its `maxLoad`, unless there is a really good reason for it. This will result in the loss of items.
- Variants should not "magically" add/remove parts to/from themselves, unless it's handled through a component, especially when they add protection or functionality.
  - Do: Uniforms with and without Gloves should be fine in most cases, as they are cosmetical and don't break continuity/logic.
  - Do: Helmets with integral flip-down visors.
  - Don't: Helmet with additional armor or face protector without the requirement of some component that will be removed from the inventory.
- There should not be a difference in weight or container capacity between the different variants unless components get added/removed.
  - For Example: `Mass of Helmet with Goggles = Mass of Helmet + Mass of Goggles.`

## 2. Config

Only directly defined Subclasses will be taken into account. A fully inherited subclass will be ignored and will not provide any interaction. The `ace_wardrobe` properties are to be found as a subclass of the item itself. Multiple base configs are designed at root of `configFile`.

## 2.1 Properties
All supported Properties can be found within the `ace_wardrobe_base` baseclass.

| Class Property |  Data Type | Description |
| -------------- |  ----------- | ----------- |
| `modifiableTo` | Subclasses | possible Variants this item can be turned into. |
| `components[]` | Array of Classnames  | Components the current variant contains within itself | 
| `sound[]` | Array of CfgSound Entries | to be chosen by random when the action is performed |
| `sound_timing` | Number 0..1 | defines the point time relative to the duration when the sound is played |
| `gesture` | String of Classname | Gesture to be played when the action is performed |
| `alternativePicture` | String of path to icon | to be used instead of target variant picture |
| `alternativeDisplayName` | String | Will be used instead of the target variants displayname |
| `duration` | Number in seconds | Duration of action. Items are being replaced at the end. |
| `fallbackComponent` | String of Classname | Fallback for Components that are not present within the same mod/addon. Example: RHS AFRF helmets use `rhs_ess_black` goggles, which are only part of USAF. fallbackComponent can be used to default to a vanilla alternative. |

### 2.2 Base Classes

All base classes can be found in `addons\wardrobe\BaseClasses.hpp`

#### 2.2.1 Base
```cpp
// root of configFile
class ace_wardrobe {
    class ace_wardrobe_base {

        class modifiableTo {};

        components[] = {};

        // Supports Multiple Sounds, will pick one by random.
        sound[] = { "ace_wardrobe_fabric_06", "ace_wardrobe_fabric_07", "ace_wardrobe_fabric_16", "ace_wardrobe_fabric_20", "ace_wardrobe_fabric_25"};
        sound_timing = 0;    // [0..1] 0 at the start of the action, 0.5 half way during the duration of the action - always, if completed or not. 1 at the end, only when completed.

        // Gesture
        gesture = "Gear";

        // These will be read from the Target Class, so for example, the uniformclass with the rolled up sleaves, it should say "Roll Up Sleeves"
        alternativePicture = "";
        alternativeDisplayName = "";

        duration = 1; // Minimum Value: 1 - Anything above will produce a progressbar.

        fallbackComponent = ""; // To be used as an alternative for components where the intended component is from another addon/mod in case the source addon is not loaded.

    };
};

```

#### 2.2.2 Base Uniform Sleeves Up / Down
Common Base Class for Uniforms with Sleeves Up/Down Variants
```cpp
class ace_wardrobe_base_U_sleeves_up: ace_wardrobe_base {
    alternativeDisplayName = CSTRING(sleevesUp);  
};
class ace_wardrobe_base_U_sleeves_down: ace_wardrobe_base {
    alternativeDisplayName = CSTRING(sleevesDown);
};
```
#### 2.2.3 Base Uniform Gloves On / Off
Common Base Class for Uniforms with Gloves On/Off Variants
```cpp
class ace_wardrobe_base_U_gloves_on: ace_wardrobe_base {
    alternativeDisplayName = CSTRING(glovesOn); 
};
class ace_wardrobe_base_U_gloves_off: ace_wardrobe_base {
    alternativeDisplayName = CSTRING(glovesOff);
};
```
#### 2.2.4  Base Uniform Jacket Open / Closed
Common Base Class for Uniforms who are open/closed in the front
```cpp
class ace_wardrobe_base_U_jacket_open: ace_wardrobe_base {
    alternativeDisplayName = CSTRING(jacketOpen); 
};
class ace_wardrobe_base_U_jacket_closed: ace_wardrobe_base {
    alternativeDisplayName = CSTRING(jacketClose);
};
```

#### 2.2.5 Base Helmet Visor Up / Down
Common Base Class for Helmets with a Visor that can be flipped up or down.
Here, the duration is carefully timed to be aligned with the "click" of the soun.

```cpp
class ace_wardrobe_base_H_visor_up: ace_wardrobe_base {
    duration = 0.25;
    gesture ="gestureNod";

    sound[] = {CN_SOUND(helmet_visor,05)};
    sound_timing = 0;

    alternativeDisplayName = CSTRING(visorUp);
};

class ace_wardrobe_base_H_visor_down: ace_wardrobe_base {
    duration = 0.25;
    gesture ="gestureNod";

    sound[] = {"ace_wardrobe_05"};
    sound_timing = 0;

    alternativeDisplayName = CSTRING(visorDown);
};
```
#### 2.2.6 Base Headgear with Goggles on / off
Common Base Class for Headgear with goggles that can be used as a facewear item.
```cpp
class ace_wardrobe_base_H_goggles_on: ace_wardrobe_base {
    gesture ="GestureWipeFace";
    alternativeDisplayName = CSTRING(gogglesOn);
};

class ace_wardrobe_base_H_goggles_off: ace_wardrobe_base {
    gesture ="GestureWipeFace";
    alternativeDisplayName = CSTRING(gogglesOff);
};
```

## 3. Porting - Ease of Use
### 3.1 Macros
To streamline the configuration of compatible items a set of macro's can be found here `addons\wardrobe\script_macros_wardrobe.hpp`

### 3.2 BaseClasses
All pre-configured base classes can be imported by simply including the following file `"\z\ace\addons\wardrobe\BaseClasses_Import.hpp"`
### 3.3 Example
```cpp
#include "\z\ace\addons\wardrobe\script_macros_wardrobe.hpp
class ace_wardrobe {
    #include "\z\ace\addons\wardrobe\BaseClasses_Import.hpp"

    // Begin to define your configs ...
};
```
## 4. Configuration Examples
### 4.1 Simple Example - Uniform Sleeves - No requirement for Components
```cpp
class ace_wardrobe {
    #include "\z\ace\addons\wardrobe\BaseClasses_Import.hpp"

    class U_B_CTRG_1: ace_wardrobe_base_U_sleeves_down {
        components[] = {};
        class modifiableTo {
            class U_B_CTRG_3;
        };
    };

    class U_B_CTRG_3: ace_wardrobe_base_U_sleeves_up {
        components[] = {};
        class modifiableTo {
            class U_B_CTRG_1;
        };
    };
};

```
### 4.2 Advanced Example - Balaclava with Combat Glasses - Partial use of Components
```cpp
class ace_wardrobe {
    #include "\z\ace\addons\wardrobe\BaseClasses_Import.hpp"

    class G_Balaclava: ace_wardrobe_base {
        class modifiableTo {
            class G_Balaclava_lowprofile;
        };
        components[] = {};
    };

    class G_Lowprofile: ace_wardrobe_base {
        components[] = { "G_Lowprofile" };
    };

    class G_Balaclava_lowprofile: ace_wardrobe_base {
        class modifiableTo {
            class G_Balaclava;
        };
        components[] = { "G_Lowprofile" };
    };
};
```
### 4.3 Complex Example - Bandana with Aviators - Complex use of Multiple Components
```cpp
class ace_wardrobe {
    #include "\z\ace\addons\wardrobe\BaseClasses_Import.hpp"

    class G_Bandanna_blk: ace_wardrobe_base {
        class modifiableTo {
            class G_Bandanna_aviator;
            class G_Aviator;
        };
        components[] = {"G_Bandanna_blk"};
    };

    class G_Aviator: ace_wardrobe_base {
        class modifiableTo {
            class G_Bandanna_aviator;
        };

        components[] = { "G_Aviator" };
    };

    class G_Bandanna_aviator: ace_wardrobe_base {
        class modifiableTo {
            class G_Bandanna_blk;
            class G_Aviator;
        };
        components[] = { "G_Aviator", "G_Bandanna_blk" };
    };
};
```

## 5. Sounds
The following `CfgSounds` classes are integrated in `ace_wardrobe` and are the default sounds for the `ace_wardrobe_base` and `ace_wardrobe_base_H_visor_up`/`ace_wardrobe_base_H_visor_down` base classes.

### 5.1 Integrated Sounds
The number at the end of the classnames indicates the length of the file in 1/10th seconds.
10 -> 1 sec, 15 -> 1.5sec, ...

- `ace_wardrobe_fabric_06`
- `ace_wardrobe_fabric_07`
- `ace_wardrobe_fabric_16`
- `ace_wardrobe_fabric_20`
- `ace_wardrobe_fabric_25`
- `ace_wardrobe_helmet_visor_05`

## 6. Compatibility

## 6.1 MagzineID
Currently, `ace_intelitems` and `ace_overheating` (spare barrels) are being directly supported.

If an addon or mod utilizes a magazine's `magazineID` to handle additional data about items carried by the player, then the process of modifying a wearable container (uniform, vest, backpack) to another variant will result in new `magazineID`s for all magazines on the player and therefore, require special handling within `ace_wardrobe` functions.

There *might* be some changes coming from Bi regarding how arma handles the `setUnitLoadout` which could resolve the need for this.

## 6.2 Container Size - Uniform, Vest, Backpack
When the player changes from one container item to another through the wardrobe action and the container's `maximumLoad` is smaller then previously, the player risks the loss of items carried inside said container.

Therefore, the function `[] call ace_wardrobe_fnc_compare_container_maxLoad` can be used to compare the item's `maximumLoad`. The result will be dumped into the .rpt.